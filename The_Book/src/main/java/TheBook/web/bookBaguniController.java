package TheBook.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import TheBook.service.bookBaguniService;
import TheBook.service.bookBaguniVO;
import TheBook.service.bookBuyDetailVO;
import TheBook.service.bookBuyVO;
import TheBook.service.bookMemberVO;
import TheBook.service.bookRebookVO;
import TheBook.service.bookStockVO;

@Controller
public class bookBaguniController {

	@Resource(name = "baguniService")
	private bookBaguniService baguniService;
	
	/*
	*//** EgovPropertyService_ 메세지 관련 
	 * @throws Exception *//*
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	//기존에 전자정부 프레임워크 내에 존재하는 시퀀스 서비스
	//사용을 위해서는 context-idgen.xml에 가서 설정을 해줘야한다.
	@Resource(name = "surveyUnqService")
	private EgovIdGnrService surveyUnqService;
	
	@RequestMapping(value = "/surveyWrite.do")
	public String surveyWrite(){
		return "survey/surveyWrite";
	}*/
	
	@RequestMapping(value = "/baguni.do")
	public String baguniMain(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		
		//session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");
		
		if(memid == null){
	         response.sendRedirect("/main.do");
	         return null;
	    }else{
			//회원의 이름, 적립금을 받아오기 위한 메소드
			bookMemberVO memberVO = baguniService.selectMemberInfo(memid);
			
			//장바구니 목록을 가져오기 위한 메소드
			List<?> baguniList = baguniService.selectBaguniList(memid);
			
			model.addAttribute("memberInfo", memberVO);
			model.addAttribute("baguniList", baguniList);
			
			return "TheBook/bookBaguni";
	    }
	}
		
	@RequestMapping(value = "/baguniTotalChange.do")
	@ResponseBody public Map<String, Object> updateBaguniTotal(HttpServletRequest request,
					 									 	   HttpServletResponse response,
					 									 	   bookBaguniVO vo)throws Exception{
		//장바구니 도서 수량 변경 기능		
		Map<String, Object> map = new HashMap<String, Object>();		
		int result = 0;
		
		int stockCnt = baguniService.selectBookstockCnt(vo);
		int cntResult = 0;
		if(stockCnt < vo.getBagunitotal()){
			cntResult = 1;
			//vo.setBagunitotal(stockCnt);
			//result = baguniService.updateBaguniTotal(vo);			
		}else{
			result = baguniService.updateBaguniTotal(vo);
		}
		
		map.put("result", result);		
		map.put("cntResult", cntResult);
		return map;
	}
	
	@RequestMapping(value = "/baguniDel.do")
	@ResponseBody public Map<String, Object> deleteBaguni(HttpServletRequest request,
														 HttpServletResponse response,
														 bookBaguniVO vo)throws Exception{
				
		//장바구니 목록 삭제 기능
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = 0;
		result = baguniService.deleteBaguni(vo);
		
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping(value = "/baguniCheckStock.do")
	@ResponseBody public Map<String, Object> baguniCheckStock(HttpServletRequest request, HttpServletResponse response,
															  @RequestParam(value="checkStock") List<String> bookunqs,
															  @RequestParam(value="bookCnts") List<String> bookcnts)throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
				
		String result = "ok";
		
		bookStockVO vo = null;
		bookRebookVO rebookVO = null;
		
		for(int i=0; i<bookunqs.size(); i++){
			String unq = bookunqs.get(i);			
			
			if(unq.substring(0, 1).equals("j") == false){	//중고도서가 아닌 경우
				
				vo = baguniService.selectBookstockCntList(unq);
				
				if(vo.getStockstock() < Integer.parseInt(bookcnts.get(i))){
					result = "no";
				}
			}else if(unq.substring(0, 1).equals("j")){		//중고도서인 경우
				rebookVO = baguniService.selectRebookstockCntList(unq);
				
				if(Integer.parseInt(rebookVO.getRebostock()) < Integer.parseInt(bookcnts.get(i))){
					result = "no";
				}
			}			
		}
		
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping(value = "/baguniCnt.do")
	@ResponseBody public Map<String, Object> baguniCnt(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		
		String memid = (String) request.getSession().getAttribute("session_memid");
		
		int cnt = baguniService.selectBaguniCnt(memid);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", cnt);
		return map;
	}
	
	
}
