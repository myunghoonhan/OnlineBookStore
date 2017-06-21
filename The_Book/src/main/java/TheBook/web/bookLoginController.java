package TheBook.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import TheBook.service.bookLoginService;
import TheBook.service.bookMemberVO;

@Controller
public class bookLoginController{
	
	@Resource(name = "bookLoginService")
	private bookLoginService bookLoginService;
	
	//=======================================================================로그인
	@RequestMapping(value = "/bookLogin.do", method = RequestMethod.POST)
	@ResponseBody public Map<String, String> bookLogin(HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		String mempwd = bookLoginService.getMemPwd(request.getParameter("memid"));
		
		Map<String, String> map = new HashMap<String, String>();
		String result="";
		
		if (mempwd.equals(request.getParameter("mempw"))) {
			
			HttpSession session = request.getSession(); //session객체 만들기
			session.setAttribute("session_memid", request.getParameter("memid"));
			
			result="0";
			map.put("result", result);
			
		} else {
			result="1";
			map.put("result", result);
		}
		return map;
	}
	
	//=======================================================================로그아웃
	@RequestMapping(value = "/bookLogOut.do", method = RequestMethod.POST)
	@ResponseBody public Map<String, String> bookLogOut(HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(); //session객체 만들기
		session.invalidate();
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "ok");
		return map;
	}
}
