package TheBook.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Service
public class LoginCheckIntercepter extends HandlerInterceptorAdapter {
	
	private static final Logger logger = Logger.getLogger(LoginCheckIntercepter.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		
		HttpSession session = request.getSession();
        
		try{
	        String userid = (String)session.getAttribute("session_memid");
	        
	        if(userid == null){
	        	response.sendRedirect("main.do");
	            return false;
	        }else{
	        	return true;
	        }
        }catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}