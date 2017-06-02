package TheBook.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;






import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import TheBook.service.bookMemberVO;
import TheBook.service.bookVO;
import TheBook.service.bookRebookVO;
import TheBook.service.bookRebookService;


@Controller
public class bookRebookController {
	
	@Resource(name ="bookRebookService")//서비스
	private bookRebookService bookRebookService;
	
	@Resource(name = "bookRebookUnq")
	private EgovIdGnrService bookRebookUnq;
	


	@RequestMapping(value="/bookRebook.do")
	public String bookRebook(HttpServletResponse response,HttpServletRequest request, ModelMap model , bookRebookVO bookRebookVO) throws Exception {
		
		
		//id 얻어오기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("session_memid");
		//베스트셀러 8개 
		List<?> bestList = bookRebookService.bestList(bookRebookVO);
		model.addAttribute("bestList", bestList);
		
		//최저가 12개
		List<?> lowPriceList = bookRebookService.lowPriceList(bookRebookVO);
		model.addAttribute("lowPriceList", lowPriceList);
		
		model.addAttribute("id", id);
		return "TheBook/bookUsed";
	
	
	
	}

	
	
	@RequestMapping(value="/rebookAdd.do")
		public String rebookAdd(HttpServletResponse response,HttpServletRequest request, ModelMap model) throws Exception {
		
						
			//id 얻어오기
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("session_memid");
			
			model.addAttribute("id", id);
			
		return "TheBook/rebookAdd";
	}
	
		@RequestMapping(value = "/rebookInsert.do", method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> rebookInsert (ModelMap modelMap, HttpServletRequest request, 
					HttpServletResponse response,bookVO bookVO, bookRebookVO bookRebookVO) throws Exception {
					
		//가격
		int reboprice = bookRebookVO.getReboprice();
		//id 얻어오기
		HttpSession session = request.getSession();
		String reboid = (String) session.getAttribute("session_memid");
		
		//rebounq 얻어오기
		String rebounq = "j" + Integer.toString(bookRebookUnq.getNextIntegerId());
		//책unq 얻어오기
		String rebobookunq = bookRebookVO.getRebobookunq();
		//상태 얻어오기
		String rebocondition = bookRebookVO.getRebocondition();
		//책제목 얻어오기 
		String reboname = "[중고] " + bookRebookService.reboname(rebobookunq);
		String rebostock = "1";	
		
		bookRebookVO.setRebounq(rebounq);
		bookRebookVO.setRebobookunq(rebobookunq);
		bookRebookVO.setReboprice(reboprice);
		bookRebookVO.setRebocondition(rebocondition);
		bookRebookVO.setReboid(reboid);
		bookRebookVO.setReboname(reboname);
		bookRebookVO.setRebostock(rebostock);
		
			
		String rebookInsert = bookRebookService.rebookInsert(bookRebookVO);
		
		if(rebookInsert == null)  rebookInsert = "ok";   //null값이면 저장이 제대로 된 것이기 때문에 ok라는 값을 넣어줘라
	      
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rebookInsert", rebookInsert);
		return map;
	}
	
	@RequestMapping(value = "/nameSearch.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> nameSearch (ModelMap modelMap, HttpServletRequest request, 
				HttpServletResponse response,bookVO bookVO, bookMemberVO bookMemberVO) throws Exception {
				
		//책제목 얻어오기
		String boname = bookVO.getBoname();
		
		System.out.println(boname);
		
		List<?> bonameList = bookRebookService.bonameList(boname);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bonameList", bonameList);
		return map;
	}

}
