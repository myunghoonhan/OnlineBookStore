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

import TheBook.service.bookBaguniVO;
import TheBook.service.bookLevelVO;
import TheBook.service.bookMainService;
import TheBook.service.bookMemberVO;
import TheBook.service.bookRebookVO;
import TheBook.service.bookVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Controller
public class bookMainController {

	@RequestMapping(value = "/samplemain.do")
	public String samplemain() {
		return "TheBook/bookMain";
	}

	@Resource(name = "bookMainService")
	// 서비스
	private bookMainService bookMainService;

	@Resource(name = "bookDetailService")
	// 서비스
	private TheBook.service.bookDetailService bookDetailService;

	@Resource(name = "bookBaguniUnq")
	private EgovIdGnrService bookBaguniUnq;

	@RequestMapping(value = "/main.do")
	public String bookMain(HttpServletResponse response, HttpServletRequest request, bookVO bookVO, ModelMap model) throws Exception {

		// 판매량순
		List<?> highPriceList = bookMainService.highPriceList(bookVO);
		model.addAttribute("highPriceList", highPriceList);

		// 업데이트 순 (화제의신간)
		List<?> updateList = bookMainService.selectUpdate(bookVO);
		model.addAttribute("updateList", updateList);

		// id 얻어오기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("session_memid");
		// System.out.println(id);

		// 관심분야 얻어오는 메소드
		String favorite = bookMainService.selectfavorite(id);
		/* System.out.println("favorite ================" +favorite); */

		// 관심분야가 있으면 관심분야 적용 , 없으면 전체 조회수 (클릭실시간 추천)
		if (favorite != null) {

			List<?> favoriteBookList = bookMainService.favoriteBookList(favorite);
			model.addAttribute("favoriteBookList", favoriteBookList);
			// 없을경우 전체 책의 조회수
		} else {
			List<?> nullfavoriteList = bookMainService.nullfavoriteList(bookVO);
			model.addAttribute("favoriteBookList", nullfavoriteList);
		}
		// List<?> favaoritehit = bookMainService.favaoritehit(bookVO);

		// 판메량순 (구매테이블에서 buybookunq가 증가할때마다 북테이블에 있는 bookunq랑 비교하여 botot 증가
		model.addAttribute("id", id);
		return "TheBook/bookMain";
	}

	// 메인에서 검색시
	@RequestMapping(value = "/bookSearch.do")
	public String bookSearch(HttpServletResponse response, HttpServletRequest request, bookVO bookVO, bookMemberVO bookMemberVO, ModelMap model) throws Exception {
		/*
		 * //라디오 버튼 리스트 String levelname = bookLevelVO.getLevelname();
		 */

		String searchCode = bookVO.getSearchCode();
		String searchName = bookVO.getSearchName();
		int gubun = Integer.parseInt(bookVO.getGubun());

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("session_memid");

		// 등급 가져오기
		if (id == null) {
			bookMemberVO bookMemberInfo = bookDetailService.bookMemberInfo(id);
			model.addAttribute("bookMemberInfo", bookMemberInfo);
		}

		else if (id != null) {
			bookMemberVO bookMemberInfo = bookDetailService.bookMemberInfo(id);
			String memgrade = bookMemberInfo.getMemgrade();

			if (memgrade.equals("골드")) {
				double memGradePoint = 0.10;
				model.addAttribute("memGradePoint", memGradePoint);
			} else if (memgrade.equals("실버")) {

				double memGradePoint = 0.07;

				model.addAttribute("memGradePoint", memGradePoint);
			} else if (memgrade.equals("브론즈")) {

				double memGradePoint = 0.05;

				model.addAttribute("memGradePoint", memGradePoint);
			} else if (memgrade.equals("일반")) {

				double memGradePoint = 0.03;
				model.addAttribute("memGradePoint", memGradePoint);
			}
			model.addAttribute("bookMemberInfo", bookMemberInfo);

		}

		// 중분류 이름과 그 중분류으에대한 카운트
		List<?> bookSearchBar = bookMainService.bookSeachBar(bookVO);
		// 검색결과 총카운트
		List<?> searchTotCount = bookMainService.searchTotCount(bookVO);

		// 검색결과 책정보
		if (gubun == 1) {
			List<?> searchBookInfo = bookMainService.searchBookInfo(bookVO);
			model.addAttribute("searchBookInfo", searchBookInfo);
		} else if (gubun == 2) {
			List<?> searchBookInfo = bookMainService.searchNewLists(bookVO);
			model.addAttribute("searchBookInfo", searchBookInfo);
		} else if (gubun == 3) {
			List<?> searchBookInfo = bookMainService.searchLowPriceList(bookVO);
			model.addAttribute("searchBookInfo", searchBookInfo);
		} else if (gubun == 4) {
			List<?> searchBookInfo = bookMainService.searchHighPriceList(bookVO);
			model.addAttribute("searchBookInfo", searchBookInfo);
		} else if (gubun == 5) {

			List<?> searchBookInfo = bookMainService.searchReviewList(bookVO);
			model.addAttribute("searchBookInfo", searchBookInfo);
		} else if (gubun == 6) {
			List<?> searchBookInfo = bookMainService.searchHitList(bookVO);
			model.addAttribute("searchBookInfo", searchBookInfo);
		}

		model.addAttribute("id", id);
		model.addAttribute("gubun", gubun);
		model.addAttribute("searchName", searchName);
		model.addAttribute("searchCode", searchCode);
		model.addAttribute("bookSearchBar", bookSearchBar);
		model.addAttribute("searchTotCount", searchTotCount);

		return "TheBook/bookSearchTagList";
	}

	@RequestMapping(value = "/reBookSearch.do")
	public String bookSearchMain(HttpServletResponse response, HttpServletRequest request, bookRebookVO bookRebookVO, ModelMap model) throws Exception {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("session_memid");

		String rebosearchCode = bookRebookVO.getReboSearchCode();
		String rebosearchName = bookRebookVO.getReboSearchName();

		int reboGubun = Integer.parseInt(bookRebookVO.getReboGubun());

		if (reboGubun == 1) {
			List<?> mainSearchRebook = bookMainService.mainSearchRebook(bookRebookVO);
			model.addAttribute("mainSearchRebook", mainSearchRebook);
		} else if (reboGubun == 2) {
			List<?> mainSearchRebook = bookMainService.LowPriceRebook(bookRebookVO);
			model.addAttribute("mainSearchRebook", mainSearchRebook);
		} else if (reboGubun == 3) {
			List<?> mainSearchRebook = bookMainService.HighPriceRebook(bookRebookVO);
			model.addAttribute("mainSearchRebook", mainSearchRebook);
		}
		System.out.println(reboGubun);
		model.addAttribute("reboGubun", reboGubun);
		return "TheBook/bookRebookSearch";
	}

	@RequestMapping(value = "/clickJungoList.do")
	public String clickJungoList(HttpServletResponse response, HttpServletRequest request, bookRebookVO bookRebookVO, ModelMap model) throws Exception {

		// 메인메뉴에서 검색하고 중고링크 클릭시

		String Rebobookunq = bookRebookVO.getRebobookunq();

		List<?> mainSearchRebook = bookMainService.clickJungoList(Rebobookunq);
		model.addAttribute("mainSearchRebook", mainSearchRebook);
		return "TheBook/bookRebookSearch";
	}

	@RequestMapping(value = "/searchgubun.do")
	public String searchgubun(HttpServletResponse response, HttpServletRequest request, bookLevelVO bookLevelVO, ModelMap model) throws Exception {

		int gubun = Integer.parseInt(bookLevelVO.getLevelcode());

		if (gubun == 10) {
			String levelcode = bookLevelVO.getLevelcode();
			List<?> guknae = bookMainService.guknae(levelcode);
			model.addAttribute("guknae", guknae);
		} else if (gubun == 20) {
			String levelcode = bookLevelVO.getLevelcode();
			List<?> guknae = bookMainService.guknae(levelcode);
			model.addAttribute("guknae", guknae);
		} else if (gubun == 30) {
			String levelcode = bookLevelVO.getLevelcode();
			List<?> guknae = bookMainService.guknae(levelcode);
			model.addAttribute("guknae", guknae);
		}
		return "TheBook/bookSearchTag";
	}

	@RequestMapping(value = "/jungInsert.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> jungInsert(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response, bookLevelVO bookLevelVO) throws Exception {

		String levelcode = bookLevelVO.getLevelcode();

		String dae = levelcode.substring(0, 2);
		String jung = levelcode.substring(2, 4);

		bookLevelVO.setDae(dae);
		bookLevelVO.setJung(jung);

		List<?> soList = bookMainService.soList(bookLevelVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("soList", soList);
		return map;

	}

	@RequestMapping(value = "/searchbutton.do")
	public String searchbutton(HttpServletResponse response, HttpServletRequest request, bookLevelVO bookLevelVO, bookMemberVO bookMemberVO, ModelMap model) throws Exception {

		int taggubun = Integer.parseInt(bookLevelVO.getTaggubun());

		String levelcode = bookLevelVO.getLevelcode();

		bookLevelVO daejungso = bookDetailService.daejungso(levelcode);

		model.addAttribute("daejungso", daejungso);

		// 검색결과 책정보
		if (taggubun == 1) {
			List<?> tagSearchList = bookMainService.soname(bookLevelVO.getLevelcode());
			model.addAttribute("tagSearchList", tagSearchList);
		} else if (taggubun == 2) {
			List<?> tagSearchList = bookMainService.tagRegDateList(bookLevelVO.getLevelcode());
			model.addAttribute("tagSearchList", tagSearchList);
		} else if (taggubun == 3) {
			List<?> tagSearchList = bookMainService.tagLowPriceList(bookLevelVO.getLevelcode());
			model.addAttribute("tagSearchList", tagSearchList);
		} else if (taggubun == 4) {
			List<?> tagSearchList = bookMainService.tagHighPriceList(bookLevelVO.getLevelcode());
			model.addAttribute("tagSearchList", tagSearchList);
		} else if (taggubun == 5) {
			List<?> tagSearchList = bookMainService.tagReviewList(bookLevelVO.getLevelcode());
			model.addAttribute("tagSearchList", tagSearchList);
			;
		} else if (taggubun == 6) {
			List<?> tagSearchList = bookMainService.tagHitList(bookLevelVO.getLevelcode());
			model.addAttribute("tagSearchList", tagSearchList);
		}

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("session_memid");
		// 등급가져오기
		if (id == null) {
			bookMemberVO bookMemberInfo = bookDetailService.bookMemberInfo(id);
			model.addAttribute("bookMemberInfo", bookMemberInfo);
		}

		else if (id != null) {
			bookMemberVO bookMemberInfo = bookDetailService.bookMemberInfo(id);
			String memgrade = bookMemberInfo.getMemgrade();

			if (memgrade.equals("골드")) {
				double memGradePoint = 0.10;
				model.addAttribute("memGradePoint", memGradePoint);
			} else if (memgrade.equals("실버")) {

				double memGradePoint = 0.07;

				model.addAttribute("memGradePoint", memGradePoint);
			} else if (memgrade.equals("브론즈")) {

				double memGradePoint = 0.05;

				model.addAttribute("memGradePoint", memGradePoint);
			} else if (memgrade.equals("일반")) {

				double memGradePoint = 0.03;
				model.addAttribute("memGradePoint", memGradePoint);
			}
			model.addAttribute("bookMemberInfo", bookMemberInfo);

		}
		model.addAttribute("taggubun", taggubun);
		model.addAttribute("levelcode", levelcode);
		model.addAttribute("taggubun", taggubun);
		return "TheBook/bookSearch";
	}

	@RequestMapping(value = "/baguniAdd.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> baguniAdd(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response, bookVO bookVO, bookBaguniVO bookBaguniVO, bookLevelVO bookLevelVO) throws Exception {
		int bagunitotal;
		int baguniprice;

		if (bookBaguniVO.getBagunitotal() == 0) {
			// 수량
			bagunitotal = 1;
		} else {
			bagunitotal = bookBaguniVO.getBagunitotal();
		}
		bookBaguniVO.setBagunitotal(bagunitotal);

		// unq
		String baguniunq = Integer.toString(bookBaguniUnq.getNextIntegerId());
		bookBaguniVO.setBaguniunq(baguniunq);

		// 아이디
		HttpSession session = request.getSession();
		String baguniid = (String) session.getAttribute("session_memid");
		bookBaguniVO.setBaguniid(baguniid);

		String baguniAdd = bookMainService.baguniAdd(bookBaguniVO);

		Map<String, Object> map = new HashMap<String, Object>();

		return map;
	}

	@RequestMapping(value = "/bookEvent.do")
	public String bookEvent() {
		return "TheBook/bookEvent";
	}
}
