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

import TheBook.service.bookBuyDetailVO;
import TheBook.service.bookMemberVO;
import TheBook.service.bookMyPageService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class bookMyPageController {
	
	@Resource(name = "bookMyPageService")
	private bookMyPageService bookMyPageService;
	
	@RequestMapping(value = "/bookMyPage.do")
	public String bookMyPage(HttpServletResponse response, HttpServletRequest request, bookBuyDetailVO bookBuyDetailVO, ModelMap model) throws Exception {
		
		HttpSession session = request.getSession();
		String memid = (String)session.getAttribute("session_memid");
		
		bookMemberVO bookMemberVO = new bookMemberVO();
		
		//=========== 회원이름,포인트 출력
		bookMemberVO.setMemid(memid);
		bookMemberVO = bookMyPageService.selectMemInfo(bookMemberVO.getMemid());
		model.addAttribute("bookMemberVO", bookMemberVO);
		
		//=========== 나의 최근 주문현황
		int cntStep1 = bookMyPageService.selectCntPay(memid);
		int cntStep2 = bookMyPageService.selectCntPrepare(memid);
		int cntStep3 = bookMyPageService.selectCntShipping(memid);
		int cntStep4 = bookMyPageService.selectCntFinish(memid);
		
		model.addAttribute("cntStep1", cntStep1);
		model.addAttribute("cntStep2", cntStep2);
		model.addAttribute("cntStep3", cntStep3);
		model.addAttribute("cntStep4", cntStep4);
		
		//=========== 주문번호: 주문번호, 상품정보, 수량, 주문금액, 주문상태
		//주문번호 페이지 구현
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(bookBuyDetailVO.getPageIndex()); //현재페이지 번호 설정: 1 설정
		paginationInfo.setRecordCountPerPage(5); //한페이지당 보여지는 글 갯수 설정: 10개 설정
		paginationInfo.setPageSize(10); //페이지 사이즈 설정: 10 설정
		
		bookBuyDetailVO.setFirstIndex(paginationInfo.getFirstRecordIndex()); //vo에 첫째인덱스를 (1) -> 페이지에 첫번째글 인덱스로
		bookBuyDetailVO.setLastIndex(paginationInfo.getLastRecordIndex()); //vo에 마지막인덱스를 (1) -> 페이지에 마지막글 인덱스로
		bookBuyDetailVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage()); //vo에 페이지당 보여지는 글 갯수를 (10) -> 페이지당 보여지는 글 갯수
		
		int totCnt = bookMyPageService.selectMemBookBuyTot(memid);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		//주문번호 리스트
		bookBuyDetailVO.setMemid(memid);
		List<?> bookBuyVO_List = bookMyPageService.selectMemBookBuy(bookBuyDetailVO);
		model.addAttribute("bookBuyVO_List", bookBuyVO_List);
		
		return "TheBook/bookMyPage";
	}
	
	@RequestMapping(value = "/bookMyPageContents.do")
	public String bookMyPageContents(HttpServletResponse response, HttpServletRequest request, bookMemberVO bookMemberVO, ModelMap model) throws Exception {
		
		HttpSession session = request.getSession();
		String memid = (String)session.getAttribute("session_memid");
			
		//=========== 회원이름,포인트 출력
		bookMemberVO.setMemid(memid);
		bookMemberVO = bookMyPageService.selectMemInfo(bookMemberVO.getMemid());
		model.addAttribute("bookMemberVO", bookMemberVO);
		
		//=========== 관심작가: 저자, 책이름, 책정보, 가격, 출판사
		List<?> bookAuthor_List = bookMyPageService.selectMemBookAuthor(memid);
		model.addAttribute("bookAuthor_List", bookAuthor_List);
		
		//=========== 문의내역
		List<?> bookQnaVO_List = bookMyPageService.selectBookQnaList(memid);
		model.addAttribute("bookQnaVO_List", bookQnaVO_List);
		
		//=========== 나의 중고도서
		List<?> bookReBookVO_List = bookMyPageService.selectReBookList(memid);
		model.addAttribute("bookReBookVO_List", bookReBookVO_List);
		
		return "TheBook/bookMyPageContents";
	}
	
	@RequestMapping(value = "/bookMyPageMember.do")
	public String bookMyPageMember(HttpServletResponse response, HttpServletRequest request, ModelMap model) throws Exception {
		
		String modiORdelete = request.getParameter("modifORdelete");
		
		model.addAttribute("modiORdelete", modiORdelete);
		return "TheBook/bookMyPageMember";
	}
	
	//=======================================================================비밀번호 재확인
	@RequestMapping(value = "/bookMemberCheck.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody public Map<String, Object> bookMemberCheck(HttpServletResponse response, HttpServletRequest request, bookMemberVO bookMemberVO) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		String memid = (String)session.getAttribute("session_memid");
		
		if(bookMemberVO.getMemid().equals(memid) == false){
			map.put("cnt", 0);
			return map;
		}else{
			//=========== 비밀번호 재확인
			int cnt = bookMyPageService.selectReMemInfo(bookMemberVO);
			map.put("cnt", cnt);
			return map;
		}
	}
	
	//=======================================================================회원정보수정 창 보기
	@RequestMapping(value = "/bookShowMemberForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookShowMemberForm(HttpServletResponse response, HttpServletRequest request, bookMemberVO bookMemberVO, ModelMap model) throws Exception {
		
		HttpSession session = request.getSession();
		String memid = (String)session.getAttribute("session_memid");
		
		String isMembercheckStr = request.getParameter("isMemberCheck");
		
		if(isMembercheckStr == null){
			response.sendRedirect("/bookMyPageMember.do");
			return null;
		}else{
			int isMembercheck = Integer.parseInt(isMembercheckStr);
			
			if(isMembercheck == 1){
				
				bookMemberVO= bookMyPageService.selectMemInfo(memid);
				model.addAttribute("bookMemberVO", bookMemberVO);
				
				return "TheBook/bookMyPageMemberForm";
			}else{
				response.sendRedirect("/bookMyPageMember.do");
				return null;
			}
		}
		
	}
	
	//=======================================================================회원정보수정
	@RequestMapping(value = "/bookMemModify.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody public Map<String, Object> bookMemModify(HttpServletResponse response, HttpServletRequest request, bookMemberVO bookMemberVO) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		//=========== 회원정보수정
		int result = bookMyPageService.updateMemModify(bookMemberVO);
		map.put("result", result);
		return map;
	}
	
	//=======================================================================회원탈퇴
	@RequestMapping(value = "/bookMemberDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody public Map<String, Object> bookMemberDelete(HttpServletResponse response, HttpServletRequest request, bookMemberVO bookMemberVO) throws Exception {
		
		HttpSession session = request.getSession();
		String memid = (String)session.getAttribute("session_memid");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(bookMemberVO.getMemid().equals(memid) == false){
			map.put("result", 0);
			return map;
		}else{
			//=========== 회원탈퇴
			int result = bookMyPageService.deleteMemModify(bookMemberVO);
			if(result > 0){
				session.invalidate();
			}
			map.put("result", result);
			return map;
		}
	}
	
	//=======================================================================구매확정
	@RequestMapping(value = "/finalBuy.do")
	@ResponseBody public Map<String, Object> finalBuy(HttpServletResponse response, HttpServletRequest request, bookBuyDetailVO detailVO) throws Exception {
				
		HttpSession session = request.getSession();
		String memid = (String)session.getAttribute("session_memid");
		bookMemberVO memberVO = bookMyPageService.selectMemInfo(memid);
		
		//===========구매확정 : 적립금 부여
		detailVO = bookMyPageService.selectBookBuyDetail(detailVO);
		
		String memgrade = memberVO.getMemgrade();
		int gradepoint = 0;
		if(memgrade.equals("일반")){
			gradepoint = 1;
		}else if(memgrade.equals("브론즈")){
			gradepoint = 3;
		}else if(memgrade.equals("실버")){
			gradepoint = 5;
		}else if(memgrade.equals("골드")){
			gradepoint = 7;
		}
		
		int updatepoint = (int) (detailVO.getBuydetailtotalprice() * 0.01 * gradepoint);
		memberVO.setUpdatepoint(updatepoint);		
		memberVO.setMemid(memid);
				
		//===========구매확정 : 등급 수정
		int buyallprice = bookMyPageService.selectBookMemberGrade(memid);
		
		if(buyallprice >= 500000){
			memberVO.setMemgrade("골드");
		}else if(buyallprice >= 300000 && buyallprice < 500000 ){
			memberVO.setMemgrade("실버");
		}else if(buyallprice >= 100000 && buyallprice < 300000 ){
			memberVO.setMemgrade("브론즈");
		}else if(buyallprice < 100000){
			memberVO.setMemgrade("일반");
		}
		
		//회원등급, 적립금 update
		int result = bookMyPageService.updateBookMemberPointPlus(memberVO);
		
		//===========구매확정 : 중고책일 경우, 등록된 중고도서 삭제 및 장바구니에 있는 중고도서 목록 삭제
		if(detailVO.getBuydetailbookunq().substring(0, 1).equals("j")){
			int result2 = bookMyPageService.deleteRebook(detailVO.getBuydetailbookunq());
			int result3 = bookMyPageService.deleteBookBaguni(detailVO.getBuydetailbookunq());
		}else{
			int result4 = bookMyPageService.updateBookBototal(detailVO);
		}
		
		int result5 = bookMyPageService.updateBookBuyDetailCondition(detailVO);		
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", result);
		map.put("updatepoint", updatepoint);
		return map;
	}
	
	//=======================================================================구매취소수정
	@RequestMapping(value = "/requestCancel.do")
	@ResponseBody public Map<String, Object> requestCancel(HttpServletResponse response, HttpServletRequest request, bookBuyDetailVO detailVO) throws Exception {
		
		HttpSession session = request.getSession();
		String memid = (String)session.getAttribute("session_memid");
	
		boolean isSuccess = bookMyPageService.requestCancel(detailVO, memid);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", isSuccess);
		return map;
		
	}
	
	//=======================================================================나의 중고도서 새창열기
	@RequestMapping(value = "/OpenUpdateReBook.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String OpenUpdateReBook(HttpServletResponse response, HttpServletRequest request, ModelMap model) throws Exception {
		
		String img = request.getParameter("img");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String rebounq = request.getParameter("rebounq");
		
		model.addAttribute("img", img);
		model.addAttribute("name", name);
		model.addAttribute("price", price);
		model.addAttribute("rebounq", rebounq);
		
		return "TheBook/bookUpdateReBook";	
	}
	
	//=======================================================================나의 중고도서 가격 입력 후 버튼 클릭
	@RequestMapping(value = "/UpdateReBook.do")
	@ResponseBody public Map<String, Object> UpdateReBook(HttpServletResponse response, HttpServletRequest request, bookBuyDetailVO detailVO) throws Exception {
		
		HttpSession session = request.getSession();
		String memid = (String)session.getAttribute("session_memid");
		String rebounq = request.getParameter("rebounq");
		String str_reboprice = request.getParameter("fixedPrice");
		
		int rebopirce= Integer.parseInt(str_reboprice);
		
		int result = bookMyPageService.UpdateReBook(rebounq, rebopirce, memid);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}
	
	@RequestMapping(value = "/DeleteReBook.do")
	@ResponseBody public Map<String, Object> DeleteReBook(HttpServletResponse response, HttpServletRequest request, bookBuyDetailVO detailVO) throws Exception {
		
		HttpSession session = request.getSession();
		String memid = (String)session.getAttribute("session_memid");
		String rebounq = request.getParameter("rebounq");
		
		int result = bookMyPageService.DeleteReBook(rebounq, memid);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}
}
