package TheBook.web;

import java.beans.XMLDecoder;
import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.xml.XMLSerializer;

import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ibatis.sqlmap.engine.mapping.result.XmlList;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.XStream11NameCoder;

import TheBook.service.bookBuyDetailVO;
import TheBook.service.bookBuyVO;
import TheBook.service.bookLevelVO;
import TheBook.service.bookManagerService;
import TheBook.service.bookMemberVO;
import TheBook.service.bookNoticeVO;
import TheBook.service.bookQnaVO;
import TheBook.service.bookStockVO;
import TheBook.service.bookStoreNoticeVO;
import TheBook.service.bookVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Controller
public class bookManagerController {

	@Resource(name = "managerService")
	private bookManagerService managerService;

	@Resource(name = "snoticeUnqService")
	private EgovIdGnrService snoticeUnqService; // 영업점 공지사항 unq 시퀀스

	@Resource(name = "bnoticeUnqService")
	private EgovIdGnrService bnoticeUnqService; // 홈페이지 공지사항 unq 시퀀스

	@Resource(name = "bookUnqseq")
	private EgovIdGnrService bookUnqseq; // book unq 시퀀스

	// 배송관리 리스트
	@RequestMapping(value = "/bookManagerOrder.do")
	public String bookManagerOrder(@ModelAttribute("orderVO") bookBuyVO vo, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			List<?> orderList = managerService.bookManagerOrder(vo);
			model.addAttribute("orderList", orderList); // 만들어진 리스트들을 가져옴

			return "TheBook/bookManagerOrder";
		}
	}

	// 배송관리 업데이트
	@RequestMapping(value = "/bookMgcdupdate.do")
	@ResponseBody
	public Map<String, Object> updateCondition(HttpServletRequest request, HttpServletResponse response, bookBuyVO bvo, bookBuyDetailVO vo) throws Exception {
		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {

			Map<String, Object> map = new HashMap<String, Object>();
			int result = 0;

			result = managerService.updateCondition(vo);

			map.put("result", result);

			return map;

		}
	}

	// 고객 QnA 리스트
	@RequestMapping(value = "/bookManagerQnA.do")
	public String bookManagerQnA(@ModelAttribute("qnaVO") bookQnaVO vo, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {

			List<?> qnaList = managerService.bookManagerQnA(vo);

			model.addAttribute("qnaList", qnaList); // 만들어진 리스트들을 가져옴

			return "TheBook/bookManagerQnA";
		}
	}

	// 고객 QnA 답변 업데이트
	@RequestMapping(value = "/bookQnAupdate.do")
	@ResponseBody
	public Map<String, Object> updateQnA(HttpServletRequest request, HttpServletResponse response, bookQnaVO vo) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			int result = 0;

			result = managerService.updateQnA(vo);

			map.put("result", result);

			return map;
		}
	}

	// 고객 QnA 게시글 삭제
	@RequestMapping(value = "/bookQnAdelete.do")
	public @ResponseBody Map<String, Object> deleteQnA(HttpServletRequest request, HttpServletResponse response, bookQnaVO vo) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			int result = 0;

			result = managerService.deleteQnA(vo);

			map.put("result", result);

			return map;
		}
	}

	// 홈페이지 공지사항 등록페이지 보이기
	@RequestMapping(value = "/bookAddNoticeform.do")
	public String bookAddNotice() {

		return "TheBook/bookAddNotice";
	}

	// 홈페이지 공지사항 등록
	@RequestMapping(value = "/bookAddNotice.do")
	@ResponseBody
	public Map<String, Object> insertNotice(HttpServletRequest request, HttpServletResponse response, bookNoticeVO vo) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {

			Map<String, Object> map = new HashMap<String, Object>();
			String result = "";

			int cnt = bnoticeUnqService.getNextIntegerId();
			vo.setBooknoticeunq(cnt);

			result = managerService.insertNotice(vo);
			if (result == null)
				result = "ok";
			map.put("result", result);

			return map;
		}

	}

	// 홈페이지 공지사항 리스트
	@RequestMapping(value = "/bookManagerNotice.do")
	public String bookManagerNotice(@ModelAttribute("notiVO") bookNoticeVO vo, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {

			List<?> notiList = managerService.bookManagerNotice(vo);

			model.addAttribute("notiList", notiList); // 만들어진 리스트들을 가져옴

			return "TheBook/bookManagerNotice";
		}
	}

	// 공지사항 검색
	@RequestMapping(value = "/bookNoticesearch.do")
	public String bookNoticesearch(@ModelAttribute("notiVO") bookNoticeVO vo, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {

			List<?> notiList = managerService.bookNoticesearch(vo);

			model.addAttribute("notiList", notiList); // 만들어진 리스트들을 가져옴

			return "TheBook/bookManagerNotice";
		}
	}

	// 관리자 수정페이지 디테일
	@RequestMapping(value = "/bookModifyform.do")
	public String bookModifyform(bookNoticeVO vo, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {

			int unq = vo.getBooknoticeunq();
			vo = managerService.selectnoticeDetail(unq);

			model.addAttribute("notidetail", vo);

			return "TheBook/bookModifyform";
		}
	}

	// 관리자 공지사항 수정
	@RequestMapping(value = "/booknotiModify.do")
	public @ResponseBody Map<String, Object> modifynotice(HttpServletRequest request, HttpServletResponse response, bookNoticeVO vo) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			int result = 0;

			result = managerService.modifynotice(vo);

			map.put("result", result);

			return map;
		}
	}

	// 관리자 공지사항 삭제
	@RequestMapping(value = "/booknotiDelete.do")
	public @ResponseBody Map<String, Object> deletenotice(HttpServletRequest request, HttpServletResponse response, bookNoticeVO vo) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			int result = 0;

			result = managerService.deletenotice(vo);

			map.put("result", result);

			return map;
		}
	}

	// 영업점 공지사항 등록페이지 보이기
	@RequestMapping(value = "/bookAddstorenotform.do")
	public String bookAddstorenoti(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			return "TheBook/bookAddstorenoti";

		}
	}

	// 영업점 공지사항 등록
	@RequestMapping(value = "/bookAddstnotice.do")
	@ResponseBody
	public Map<String, Object> insertstNotice(HttpServletRequest request, HttpServletResponse response, bookStoreNoticeVO vo) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			String result = "";

			int cnt = snoticeUnqService.getNextIntegerId();
			vo.setStorenoticeunq(cnt);

			result = managerService.insertstNotice(vo);
			if (result == null)
				result = "ok";
			map.put("result", result);

			return map;
		}
	}

	// 영업점 공지사항 리스트
	@RequestMapping(value = "/bookMangerStore.do")
	public String bookMangerStore(@ModelAttribute("stnotiVO") bookStoreNoticeVO vo, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			List<?> stnotiList = managerService.bookMangerStore(vo);

			model.addAttribute("stnotiList", stnotiList); // 만들어진 리스트들을 가져옴

			return "TheBook/bookMangerStore";
		}
	}

	// 영업점 공지사항 수정 폼
	@RequestMapping(value = "/bookstModifyform.do")
	public String bookstModifyform(bookStoreNoticeVO vo, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			int unq = vo.getStorenoticeunq();
			vo = managerService.selectstnotiDetail(unq);

			model.addAttribute("stnotidetail", vo);

			return "TheBook/bookstModifyform";
		}
	}

	// 영업점 공지사항 수정
	@RequestMapping(value = "/bookstModify.do")
	public @ResponseBody Map<String, Object> modifystnotice(HttpServletRequest request, HttpServletResponse response, bookStoreNoticeVO vo) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			int result = 0;

			result = managerService.modifystnotice(vo);

			map.put("result", result);

			return map;
		}
	}

	// 영업점 공지사항 삭제
	@RequestMapping(value = "/bookstnotiDelete.do")
	public @ResponseBody Map<String, Object> deletestNotice(HttpServletRequest request, HttpServletResponse response, bookStoreNoticeVO vo) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {

			Map<String, Object> map = new HashMap<String, Object>();
			int result = 0;

			result = managerService.deletestNotice(vo);

			map.put("result", result);

			return map;
		}
	}

	// 책 리스트
	@RequestMapping(value = "/bookList.do")
	public String bookList(@ModelAttribute("bookVO") bookVO vo, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			List<?> booklist = managerService.bookList(vo);

			model.addAttribute("booklist", booklist); // 만들어진 리스트들을 가져옴

			return "TheBook/bookList";
		}
	}

	// 책 정보 삭제
	@RequestMapping(value = "/bookDelete.do")
	public @ResponseBody Map<String, Object> deleteBook(HttpServletRequest request, HttpServletResponse response, bookVO vo, bookStockVO svo) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			int result = 0;
			int result1 = 0;

			result = managerService.deleteBook(vo);
			result1 = managerService.deletestock(svo);

			map.put("result", result);
			map.put("result1", result1);

			return map;
		}
	}

	// 책 등록 페이지
	@RequestMapping(value = "/bookAddform.do")
	public String bookAddform(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			return "TheBook/bookAdd";
		}
	}

	// 새책 등록(파일 업로드)
	@RequestMapping(value = "/nbookInsert.do")
	@ResponseBody
	public Map<String, Object> nbookInsert(final MultipartHttpServletRequest multiRequest, HttpServletRequest request, HttpServletResponse response, bookVO vo) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {

			int stockstock = vo.getStockstock();

			MultipartFile file;
			String filePath = "";
			int cnt = 0;

			// Map 형태로 넘어온 파일의 정보를 files라는 변수로 받는다.
			Map<String, MultipartFile> files = multiRequest.getFileMap();
			String uploadPath = "c:\\eGovFrameDev-3.5.1-64bit\\workspace\\The_Book\\src\\main\\webapp\\images\\poster";

			// 폴더의 존재 유무 및 생성
			File saveFolder = new File(uploadPath);
			if (!saveFolder.exists()) {
				saveFolder.mkdirs();
			}

			// Map인 files의 저장 내용을 가져오기 위해 Iterator 형태로 형변환
			Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();

			// itr의 내용을 하나씩 가져와 upload 파일에 저장한다.

			int count = 1;
			while (itr.hasNext()) { // 다음 가져올 파일의 존재유무
				// 한 행의 내용을 가져와서 entry 변수에게 준다.
				Entry<String, MultipartFile> entry = itr.next();
				file = entry.getValue();
				if (!"".equals(file.getOriginalFilename())) {

					filePath = uploadPath + "\\" + file.getOriginalFilename();

					// 업로드 정보 형성 ex: c:\\upload\a.jpg
					System.out.println("fileupload중간ㅜ==]=========");

					// name1[] = file.getOriginalFilename();
					System.out.println("name : " + file.getOriginalFilename());
					// 바깥에서 사용하려면 String을 선언 해준후 while문안에 넣어주고 그것을 밖에서 호출해서 db에
					// insert 해준다

					// 실제 파일 업로드
					file.transferTo(new File(filePath));
					cnt++;
					if (count == 1) {
						vo.setBoimg(file.getOriginalFilename());
						System.out.println("메인이름 :  " + vo.getBoimg());
					}
					if (count == 2) {
						vo.setBopreview1(file.getOriginalFilename());
						System.out.println("미리보기1 : " + vo.getBopreview1());
					}
					if (count == 3) {
						vo.setBopreview2(file.getOriginalFilename());
					}
					if (count == 4) {
						vo.setBopreview3(file.getOriginalFilename());
					}
				}
				count = count + 1;

			}

			bookStockVO svo = new bookStockVO();
			svo.setStockstock(stockstock);

			System.out.println("filePath : " + filePath);
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("cnt", Integer.toString(cnt));

			String result = "";
			String result1 = "";

			String bounq = "c" + Integer.toString(bookUnqseq.getNextIntegerId()); // 분류번호
																					// 앞
																					// c붙여줌
			vo.setBounq(bounq);
			svo.setStockbook(bounq);

			result = managerService.nbookInsert(vo);
			result1 = managerService.stockInsert(svo);

			if (result == null)
				result = "ok";
			if (result1 == null)
				result1 = "ok";
			map.put("result", result);
			map.put("result1", result1);

			System.out.println("cnt -> " + cnt);
			return map;
		}

	}

	// 책 수정페이지
	@RequestMapping(value = "/bookinfoform.do")
	public String bookinfoform(bookVO vo, bookStockVO svo, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {

			String unq = vo.getBounq();

			vo = managerService.bookinfoform(unq);

			model.addAttribute("book", vo);

			return "TheBook/bookinfoModify";
		}
	}

	// 책 정보 수정
	@RequestMapping(value = "/bookinfoModify.do")
	@ResponseBody
	public Map<String, Object> infoModify(final MultipartHttpServletRequest multiRequest, HttpServletRequest request, HttpServletResponse response, bookVO vo) throws Exception {
		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			/*
			 * Map<String, Object> map = new HashMap<String, Object>(); int
			 * result = 0;
			 * 
			 * result = managerService.modifystnotice(vo);
			 * 
			 * map.put("result", result);
			 * 
			 * return map;
			 */

			System.out.println("---------- 11 --------------------");

			int stockstock = vo.getStockstock();

			MultipartFile file;
			String filePath = "";
			int cnt = 0;

			System.out.println("---------- 22 --------------------");
			// Map 형태로 넘어온 파일의 정보를 files라는 변수로 받는다.
			Map<String, MultipartFile> files = multiRequest.getFileMap();
			String uploadPath = "c:\\eGovFrameDev-3.5.1-64bit\\workspace\\The_Book\\src\\main\\webapp\\images\\poster";

			// 폴더의 존재 유무 및 생성
			File saveFolder = new File(uploadPath);
			if (!saveFolder.exists()) {
				saveFolder.mkdirs();
			}

			// Map인 files의 저장 내용을 가져오기 위해 Iterator 형태로 형변환
			Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();

			Map<String, Object> map = new HashMap<String, Object>();

			System.out.println("메인이미지 값 뭐야 ======================" + vo.getBoimg());

			if (vo.getBoimg() == null) { // 메인 이미지 업로드 안할경우

				bookStockVO svo = new bookStockVO();
				svo.setStockstock(stockstock);

				System.out.println("filePath : " + filePath);

				map.put("cnt", Integer.toString(cnt));
				System.out.println("fileupload이후ㅜ==]=========");

				int result = 0;
				int result1 = 0;

				svo.setStockbook(vo.getBounq());

				result = managerService.infoModify(vo);
				result1 = managerService.stockModify(svo);

				map.put("result", result);
				map.put("result1", result1);

			} else { // 메인이미지 재업로드 할경우

				int count = 1;
				while (itr.hasNext()) { // 다음 가져올 파일의 존재유무
					// 한 행의 내용을 가져와서 entry 변수에게 준다.
					Entry<String, MultipartFile> entry = itr.next();
					file = entry.getValue();
					if (!"".equals(file.getOriginalFilename())) {

						filePath = uploadPath + "\\" + file.getOriginalFilename();

						// 업로드 정보 형성 ex: c:\\upload\a.jpg
						System.out.println("fileupload중간ㅜ==]=========");

						// name1[] = file.getOriginalFilename();
						System.out.println("name : " + file.getOriginalFilename());
						// 바깥에서 사용하려면 String을 선언 해준후 while문안에 넣어주고 그것을 밖에서 호출해서
						// db에 insert 해준다

						// 실제 파일 업로드
						file.transferTo(new File(filePath));
						cnt++;

						if (count == 1) {
							vo.setBoimg(file.getOriginalFilename());
							System.out.println("메인이름 :  " + vo.getBoimg());
						}
					}

				}

				bookStockVO svo = new bookStockVO();
				svo.setStockstock(stockstock);

				System.out.println("filePath : " + filePath);

				map.put("cnt", Integer.toString(cnt));
				System.out.println("fileupload이후ㅜ==]=========");

				int result = 0;
				int result1 = 0;
				int result2 = 0;

				svo.setStockbook(vo.getBounq());

				result = managerService.infoModify(vo);
				result1 = managerService.stockModify(svo);
				result2 = managerService.fileModify(vo);

				map.put("result", result);
				map.put("result1", result1);
				map.put("result2", result2);

			}
			// itr의 내용을 하나씩 가져와 upload 파일에 저장한다.

			System.out.println("cnt -> " + cnt);
			return map;
		}
	}

	// 책 수정페이지
	@RequestMapping(value = "/bookselectTest.do")
	public String bookselectTest(bookLevelVO vo, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {

			List<?> bigcode = managerService.bigcode(vo);

			model.addAttribute("bigcode", bigcode); // 만들어진 리스트들을 가져옴

			return "TheBook/bookinfoModify";
		}
	}

	// 관리자 메인페이지
	@RequestMapping(value = "/bookManagerheader.do")
	public String bookManagerheader(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			return "TheBook/bookManagerheader";
		}
	}

	// 관리자 로그아웃
	@RequestMapping(value = "/bookLogOutManager.do", method = RequestMethod.POST)
	public String bookLogOutManager(HttpServletResponse response, HttpServletRequest request) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			HttpSession session = request.getSession(); // session객체 만들기
			session.invalidate();

			return "redirect:/main.do";
		}
	}

	// JSON 출력
	@RequestMapping(value = "/bookManagerDataVisualizing.do")
	public String bookManagerDataVisualizing() {
		return "TheBook/bookManagerDataVisualizing";
	}
	
	// JSON, XML 출력
	@RequestMapping(value = "/bookManagerDatabaseToXML.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bookManagerDatabaseToXML(HttpServletResponse response, HttpServletRequest request, bookMemberVO bookMemberVO) throws Exception {

		List<?> list = managerService.selectBookList();
		
		JSONArray json = new JSONArray();
		json = json.fromObject(list); //list -> JSON문법 적용한 Object
		
		XStream x = new XStream();
		String xml = x.toXML(list); //list -> XML문법 적용한 String
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("json", json);
		map.put("xml", xml);
		
		return map;
	}

}
