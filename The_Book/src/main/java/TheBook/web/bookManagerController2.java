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
import org.springframework.web.bind.annotation.ResponseBody;

import TheBook.service.bookBuyDetailVO;
import TheBook.service.bookBuyService;
import TheBook.service.bookManagerService2;
import TheBook.service.bookStockVO;
import TheBook.service.bookStoreOrderVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Controller
public class bookManagerController2 {

	@Resource(name = "managerService2")
	private bookManagerService2 managerService2;

	@Resource(name = "buyService")
	private bookBuyService buyService;

	@Resource(name = "bookStoreOrderUnq")
	private EgovIdGnrService bookStoreOrderUnq;

	@Resource(name = "storeOrderUnq")
	private EgovIdGnrService storeOrderUnq;

	// 영업점별 재고 리스트
	@RequestMapping(value = "/managerStockList.do")
	public String managerStockList(bookStockVO stockVO, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			String sql = "'2' OR stockstoreunq = '3' OR stockstoreunq = '4' OR stockstoreunq = '5'";

			if (stockVO.getStockstoreunq() == null || stockVO.getStockstoreunq().equals("1")) {
				stockVO.setStockstoreunq(sql);
			}

			List<?> list = managerService2.selectStoreOrderList(stockVO);

			if (stockVO.getStockstoreunq() == sql) {
				stockVO.setStockstoreunq("1");
			}

			model.addAttribute("list", list);
			model.addAttribute("stockstoreunq", stockVO.getStockstoreunq());
			model.addAttribute("seltype", stockVO.getSeltype());
			model.addAttribute("selname", stockVO.getSelname());

			return "TheBook/bookManagerStockList";
		}
	}

	// 영업점 발주요청 페이지
	@RequestMapping(value = "/managerStockOrder.do")
	public String managerStockOrder(bookStoreOrderVO orderVO, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {

			model.addAttribute("bookname", orderVO.getBookname());
			model.addAttribute("bookunq", orderVO.getStoreorderbounq());

			return "TheBook/bookManagerStockOrder";
		}
	}

	// 영업점 발주 요청
	@RequestMapping(value = "/managerStockOrderInsert.do")
	@ResponseBody
	public Map<String, Object> managerStockOrderInsert(HttpServletRequest request, HttpServletResponse response, bookStoreOrderVO orderVO) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			int unq = storeOrderUnq.getNextIntegerId();
			orderVO.setStoreorderunq(unq);
			System.out.println(orderVO.getStoreorderunq());

			String result = "";
			result = managerService2.insertStoreOrder(orderVO);
			if (result == null)
				result = "ok";

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("result", result);
			return map;
		}
	}

	// 영업점 발주요청 리스트
	@RequestMapping(value = "/managerStockOrderList.do")
	public String managerStockOrderList(bookStoreOrderVO orderVO, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			String sql = "'2' OR storeorderstoreunq = '3' OR storeorderstoreunq = '4' OR storeorderstoreunq = '5'";

			if (orderVO.getStoreorderstoreunq() == null || orderVO.getStoreorderstoreunq().equals("1")) {
				orderVO.setStoreorderstoreunq(sql);
			}

			List<?> list = managerService2.selectStoreOrderedList(orderVO);

			if (orderVO.getStoreorderstoreunq() == sql) {
				orderVO.setStoreorderstoreunq("1");
			}

			model.addAttribute("list", list);
			model.addAttribute("stockstoreunq", orderVO.getStoreorderstoreunq());
			model.addAttribute("seltype", orderVO.getSeltype());
			model.addAttribute("selname", orderVO.getSelname());

			return "TheBook/bookManagerStockOrderList";
		}
	}

	// 관리자 발주 요청 리스트
	@RequestMapping(value = "/managerStockOrderCheck.do")
	public String managerStockOrderCheck(bookStoreOrderVO orderVO, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			String sql2 = "'1' OR storeordercheck = '2'";

			if (orderVO.getStoreordercheck() == null || orderVO.getStoreordercheck().equals("0")) {
				orderVO.setStoreordercheck(sql2);
			}

			String sql = "'2' OR storeorderstoreunq = '3' OR storeorderstoreunq = '4' OR storeorderstoreunq = '5'";

			if (orderVO.getStoreorderstoreunq() == null || orderVO.getStoreorderstoreunq().equals("1")) {
				orderVO.setStoreorderstoreunq(sql);
			}

			List<?> list = managerService2.selectStoreOrderCheck(orderVO);

			if (orderVO.getStoreorderstoreunq() == sql) {
				orderVO.setStoreorderstoreunq("1");
			}
			if (orderVO.getStoreordercheck() == sql2) {
				orderVO.setStoreordercheck("0");
			}

			model.addAttribute("list", list);
			model.addAttribute("stockstoreunq", orderVO.getStoreorderstoreunq());
			model.addAttribute("seltype", orderVO.getSeltype());
			model.addAttribute("selname", orderVO.getSelname());
			model.addAttribute("storeordercheck", orderVO.getStoreordercheck());

			return "TheBook/bookManagerStockOrderCheck";
		}
	}

	// 관리자 발주 요청 수리
	@RequestMapping(value = "/managerStockOrderCheckSend.do")
	@ResponseBody
	public Map<String, Object> managerStockOrderCheckSend(HttpServletRequest request, HttpServletResponse response, bookStoreOrderVO orderVO, bookBuyDetailVO detailVO) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			int result = managerService2.updateStoreOrderCheck(orderVO);
			int result2 = buyService.updateBookStockCnt(detailVO);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("result", result);
			map.put("result2", result2);

			return map;
		}
	}

	// 총 매출
	@RequestMapping(value = "/managerTotalPrice.do")
	public String managerTotalPrice(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session에 할당된 id 받아오기
		String memid = (String) request.getSession().getAttribute("session_memid");

		if (memid.equals("master") == false || memid == null) {
			response.sendRedirect("/main.do");
			return null;
		} else {
			List<?> list = managerService2.selectStoreTotalPrice();

			model.addAttribute("list", list);
			return "TheBook/bookManagerTotalPrice";
		}
	}

}
