package TheBook.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;












import org.springframework.web.util.CookieGenerator;
import org.stringtemplate.v4.compiler.STParser.mapExpr_return;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import TheBook.service.bookAuthorVO;
import TheBook.service.bookDetailService;
import TheBook.service.bookLevelVO;
import TheBook.service.bookMemberVO;
import TheBook.service.bookRebookVO;
import TheBook.service.bookReviewVO;
import TheBook.service.bookStockVO;
import TheBook.service.bookVO;

@Controller
public class bookDetailController {
	
	@Resource(name ="bookDetailService")//서비스
	private bookDetailService bookDetailService;
	
	@Resource(name = "bookUnqService")
	private EgovIdGnrService bookUnqService;
	
	@Resource(name = "bookReviewUnq")
	private EgovIdGnrService bookReviewUnq;
	
	@RequestMapping(value="/bookDetail.do")
	public String bookMain(HttpServletRequest request, 
			HttpServletResponse response, bookVO bookVO, bookReviewVO bookReviewVO,  ModelMap model) throws Exception {
		
		String bounq = bookVO.getBounq();
		
		Cookie cookie = new Cookie("cookieImg_"+bounq, bounq);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		//레벨코드 얻어오기
		String levelcode = bookDetailService.levelcode(bounq);
		
		//대중소
		bookLevelVO daejungso = bookDetailService.daejungso(levelcode);
		
		//책정보 
		bookVO bookDetail = bookDetailService.bookDetail(bounq);
		bookDetailService.bookDetailUdatehit(bounq);
		
		String reviewbookunq = bookReviewVO.getReviewbookunq();
		
		//리뷰 리스트
		List<?> bookReviewList = bookDetailService.bookReviewList(bounq);
		
		//리뷰 갯수
		int reviewTotal = bookDetailService.reviewTotal(bounq);
		model.addAttribute("reviewTotal", reviewTotal);
		
		//리뷰 별수
		int reviewStar = bookDetailService.reviewStar(bounq);
		model.addAttribute("reviewStar", reviewStar);
		
		//배송일자
		bookStockVO bookStockOrderDay = bookDetailService.bookStockOrderDay(bounq);
		
		//중분류 판매순으로 6개
		String levelname = bookDetailService.jungTotal(levelcode);
		List<?> jungTotalList = bookDetailService.jungTotalList(levelname);
		model.addAttribute("jungTotalList", jungTotalList);
		
		//포인트
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("session_memid");
		
		if(id == null){
		bookMemberVO bookMemberInfo = bookDetailService.bookMemberInfo(id);
		model.addAttribute("bookMemberInfo", bookMemberInfo);
		}
		else if(id != null){
		bookMemberVO bookMemberInfo = bookDetailService.bookMemberInfo(id);
		String memgrade = bookMemberInfo.getMemgrade();	
		if(memgrade.equals("골드")){
			  double memGradePoint = 0.10; 
			  model.addAttribute("memGradePoint", memGradePoint);
		}
		  else if(memgrade.equals("실버")){
			  
			  double memGradePoint = 0.07;
			 
			  model.addAttribute("memGradePoint", memGradePoint);
		  }
		  else if(memgrade.equals("브론즈")){
			  
			  double memGradePoint = 0.05;
			  
			  model.addAttribute("memGradePoint", memGradePoint);
		  }else if(memgrade.equals("일반")){
			  
			  double memGradePoint = 0.03;
			  model.addAttribute("memGradePoint", memGradePoint);
		  }
		model.addAttribute("bookMemberInfo", bookMemberInfo);
		
		}
		
		//중고장터
		bookRebookVO detailRebook = bookDetailService.detailRebook(bounq);
	
		model.addAttribute("detailRebook", detailRebook);
		model.addAttribute("daejungso", daejungso);
		model.addAttribute("id", id);
		model.addAttribute("bookStockOrderDay", bookStockOrderDay);
		model.addAttribute("bookReviewList", bookReviewList);
		model.addAttribute("bookDetail", bookDetail);
		
		return "TheBook/bookDetail";
	}

	@RequestMapping(value="/bookPreview.do")
	public String bookPreview(bookVO bookVO, ModelMap model) throws Exception {
		System.out.println("unq==================" +bookVO.getBounq());
		
		String bounq = bookVO.getBounq();
		
		bookVO bookPreview = bookDetailService.bookPreview(bounq);
		model.addAttribute("bookPreview", bookPreview);
		return "TheBook/bookPreview";
	}
	@RequestMapping(value="/bookStoreStock.do")
	public String bookStoreStock(bookVO bookVO, bookMemberVO bookMemberVO, ModelMap model) throws Exception {

		String bounq = bookVO.getBounq();
		List<?> bookStoreStock = bookDetailService.bookStoreStock(bounq);
		model.addAttribute("bookStoreStock", bookStoreStock);
		return "TheBook/bookStoreStock";
	
	}

	@RequestMapping(value = "/authorAdd.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> authorAdd (ModelMap modelMap, HttpServletRequest request, 
			HttpServletResponse response,bookVO bookVO, bookMemberVO bookMemberVO, bookAuthorVO bookAuthorVO) throws Exception {
			
		//id 얻어오기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("session_memid");
		
		String author = bookVO.getBoauthor();
		String cnt = Integer.toString(bookUnqService.getNextIntegerId());
		String bounq= bookVO.getBounq();

		bookAuthorVO.setAuthorid(id);
		bookAuthorVO.setAuthorauthor(author);
		bookAuthorVO.setAuthorunq(cnt);
		
		//이거전에 아이디 중복체크해서 id가있으면 관심작가 등록 못하게
		String authorAdd = bookDetailService.authorAdd(bookAuthorVO);
		
		if(authorAdd == null)  authorAdd = "ok";   //null값이면 저장이 제대로 된 것이기 때문에 ok라는 값을 넣어줘라
	      
	      Map<String, Object> map = new HashMap<String, Object>();
	     
	      map.put("bounq", bounq);
	      map.put("authorAdd", authorAdd);
	      return map;
	
	}
	//리뷰 인서트 
	@RequestMapping(value = "/bookReview.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bookReview (ModelMap modelMap, HttpServletRequest request, 
			HttpServletResponse response,bookReviewVO bookReviewVO) throws Exception {
			
		
	    Map<String, Object> map = new HashMap<String, Object>();
		
	    //id 얻어오기
	    HttpSession session = request.getSession();
		String id = (String) session.getAttribute("session_memid");
	    
	    String cnt = Integer.toString(bookReviewUnq.getNextIntegerId());
		int star = bookReviewVO.getReviewstar();
		String bookunq= bookReviewVO.getReviewbookunq();
		String content = bookReviewVO.getReviewcontent();
		
		
		bookReviewVO.setReviewunq(cnt);
		bookReviewVO.setReviewid(id);
		bookReviewVO.setReviewbookunq(bookunq);
		bookReviewVO.setReviewcontent(content);
		bookReviewVO.setReviewstar(star);
		
		String bookReview = bookDetailService.bookReview(bookReviewVO); 
		if(bookReview == null)  bookReview = "ok"; 
		
		
		map.put("bookunq", bookunq);
	    map.put("bookReview", bookReview);
		
	    return map;
	}
	
/*	//review 리스트
		@RequestMapping(value = "/bookReviewList.do")
		public String bookReviewList(HttpServletResponse response, HttpServletRequest request, bookReviewVO bookReviewVO, ModelMap model) throws Exception {
			
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(bookReviewVO.getPageIndex()); //현재페이지 번호 설정: 1 설정
			paginationInfo.setRecordCountPerPage(10); //한페이지당 보여지는 글 갯수 설정: 10개 설정
			paginationInfo.setPageSize(10); //페이지 사이즈 설정: 10 설정

			bookReviewVO.setFirstIndex(paginationInfo.getFirstRecordIndex()); //vo에 첫째인덱스를 (1) -> 페이지에 첫번째글 인덱스로
			bookReviewVO.setLastIndex(paginationInfo.getLastRecordIndex()); //vo에 마지막인덱스를 (1) -> 페이지에 마지막글 인덱스로
			bookReviewVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage()); //vo에 페이지당 보여지는 글 갯수를 (10) -> 페이지당 보여지는 글 갯수
		
		String reviewbookunq = bookReviewVO.getReviewbookunq();
		System.out.println(reviewbookunq);

			
		List<?> bookReviewList = bookDetailService.bookReviewList(reviewbookunq);
		model.addAttribute("bookReviewList", bookReviewList);
		
		
		return "TheBook/bookDetail";
	}*/
	
	@RequestMapping(value = "/GetSidebar.do")
	@ResponseBody
	public Map<String, Object> GetSidebar(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		String[] arrStr = { "cookieImg_1", "cookieImg_2", "cookieImg_3", "cookieImg_4" };
		Cookie[] cookie = request.getCookies();
		int totCookieLength = cookie.length;

		if (cookie != null) {
			int i = 0;
			for (Cookie c : cookie) {
				if (i >= 4) {
					break;
				} else {
					if (c.getName().contains("cookieImg_")) {
						map.put(arrStr[i], cookie[totCookieLength - 1].getValue());
						i++;
						totCookieLength--;
					}
				}
			}
		}
		return map;
	}
}