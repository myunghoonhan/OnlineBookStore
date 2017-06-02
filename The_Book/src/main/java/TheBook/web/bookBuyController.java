package TheBook.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import TheBook.service.bookBaguniService;
import TheBook.service.bookBuyDetailVO;
import TheBook.service.bookBuyService;
import TheBook.service.bookBuyVO;
import TheBook.service.bookMemberVO;

@Controller
public class bookBuyController {

	@Resource(name = "buyService")
	private bookBuyService buyService;
	
	@Resource(name = "baguniService")
	private bookBaguniService baguniService;
	
	
	//** EgovPropertyService_ 메세지 관련 *//*
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	//기존에 전자정부 프레임워크 내에 존재하는 시퀀스 서비스
	//사용을 위해서는 context-idgen.xml에 가서 설정을 해줘야한다.
	@Resource(name = "bookBuyUnq")
	private EgovIdGnrService bookBuyUnq;
	
	/*
	@RequestMapping(value = "/surveyWrite.do")
	public String surveyWrite(){
		return "survey/surveyWrite";
	}*/
	
	@RequestMapping(value = "/buy.do")
	public String checkedBaguniList(HttpServletRequest request, HttpServletResponse response,
									ModelMap model, bookBuyDetailVO detailVO,
									@RequestParam(value="checkedBaguni") List<String> checkedBaguni)throws Exception{

		//session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");
		
		List<?> buyList = null;
		
		if(memid == null){
	         response.sendRedirect("/main.do");
	         return null;
	    }else{
			//회원의 이름, 적립금을 받아오기 위한 메소드
			bookMemberVO memberVO = baguniService.selectMemberInfo(memid);
			
			//장바구니에서 구매하기로 넘어온 경우 : buyRoute값은 0
			if(detailVO.getBuyRoute() == 0){
				//선택된 장바구니 갯수 보여주기
				//System.out.println(checkedBaguni.size());
						
				String sqlValue = "where bounq = bagunibookunq and ( 1=0";
				
				for(String baguni : checkedBaguni){
					//받아온 unq 값 확인하기
					//System.out.println(baguni);
					sqlValue += " OR baguniunq = " + baguni;
				}
				
				sqlValue += ")";
				
				//배열 값을 할당시킨 sql문을 작성하여 보내기
				buyList = buyService.selectBuyList(sqlValue);
				
			}else if(detailVO.getBuyRoute() == 1){
				
				String bounq = null;
				
				for(String bookunq : checkedBaguni){
					//받아온 unq 값 확인하기
					//System.out.println(bookunq);
					bounq = bookunq;
				}
				
				if(bounq.substring(0, 1).equals("j") == false){
					buyList = buyService.selectBuyListBook(bounq);
				}else if(bounq.substring(0, 1).equals("j")){
					buyList = buyService.selectBuyListRebook(bounq);
				}
				
			}
			
			model.addAttribute("memberInfo", memberVO);
			model.addAttribute("buyList", buyList);
			model.addAttribute("buyRoute", detailVO.getBuyRoute());
			model.addAttribute("bocnt", detailVO.getBuydetailcnt());
			
			return "TheBook/bookRightBuy";
	    }
	}
	
	@RequestMapping(value = "/buyNow.do")
	@ResponseBody public Map<String, Object> buyNow(HttpServletRequest request, HttpServletResponse response,
									bookBuyVO buyvo, bookBuyDetailVO buydetailvo,
									@RequestParam(value="bookunqs") List<String> bookunqs,
									@RequestParam(value="booknames") List<String> booknames,
									@RequestParam(value="bookprices") List<Integer> bookprices,
									@RequestParam(value="bookcnts") List<Integer> bookcnts,
									@RequestParam(value="bookimgs") List<String> bookimgs)throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//==================================
		//bookBuy insert 부분
		//==================================
		
		//시퀀스 설정
		String buyunq = Integer.toString(bookBuyUnq.getNextIntegerId());		
		buyvo.setBuyunq(buyunq);
		
		//세션에서 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");
		if(memid == null){
			buyvo.setBuyid("비회원");
			buydetailvo.setBuydetailmemid("비회원");
		}else{
			buyvo.setBuyid(memid);
			buydetailvo.setBuydetailmemid(memid);
		}
		
		String result = "";		
		result = buyService.insertBookBuy(buyvo);		
		if(result == null) result = "ok";
		
		
		//==================================
		//bookBuyDetail insert 부분
		//==================================
		
		String result2 = "";
		
		//bookBuy 구매번호랑 연결
		buydetailvo.setBuydetailbuyunq(buyunq);
		
		//묶어서 주문한 도서정보들 불러오기
		//배열값은 0부터 시작
		for(int i=0; i<bookunqs.size(); i++){
			//==================================
			//bookBuyDetail insert
			//==================================
			buydetailvo.setBuydetailbookunq(bookunqs.get(i));
			buydetailvo.setBuydetailbookname(booknames.get(i));
			buydetailvo.setBuydetailprice(bookprices.get(i));
			buydetailvo.setBuydetailcnt(bookcnts.get(i));
			
			int totalprice = bookprices.get(i) * bookcnts.get(i);
			buydetailvo.setBuydetailtotalprice(totalprice);
			
			buydetailvo.setBuydetailbookimg(bookimgs.get(i));
			buydetailvo.setBuydetailmemid(memid);
			
			result2 = buyService.insertBookBuyDetail(buydetailvo);
			if(result2 == null) result2 = "ok";
			
			//==================================
			//reBook update, bookBaguni delete
			//==================================
			
			if(bookunqs.get(i).substring(0, 1).equals("j")){
				
				String unq = bookunqs.get(i);
				int up = buyService.updateRebookStock(unq);
				
				buyvo.setSearchtype("bagunirebounq");
				buyvo.setSearchname(bookunqs.get(i));
				int del = buyService.deleteBookbaguni(buyvo);
				
			}else{
				
				int up = buyService.updateBookStockCnt(buydetailvo);
				
				buyvo.setSearchtype("bagunibookunq");
				buyvo.setSearchname(bookunqs.get(i));
				int del = buyService.deleteBookbaguni(buyvo);
			}
			
			int up = buyService.updateBookmemberPoint(buyvo);
			
		}
		
		map.put("result", result);
		map.put("result2", result2);
		
		return map;
	}
	
	
/*	
	@RequestMapping(value = "/buy.do")
	@ResponseBody public Map<String, Object> checkedBaguniList(HttpServletRequest request,
														  	   HttpServletResponse response,
														  	   ModelMap model,
														  	   @RequestParam(value="checkedBaguni[]") List<String> checkedBaguni)throws Exception{

		//선택된 장바구니 갯수 보여주기
		System.out.println(checkedBaguni.size());
		
		for(String baguni : checkedBaguni){
			System.out.println(baguni);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = 0;
		result = baguniService.deleteBaguni(vo);
		
		String aaa = "성공";
		map.put("aaa", aaa);
		//model.addAttribute("aaa", aaa);
		
		return map;
	}
*/	
	@RequestMapping(value = "/soo.do")
	public String soo() throws Exception{
		return "TheBook/soo3";
	}	
}
