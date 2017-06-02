package TheBook.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import TheBook.service.bookMemberVO;
import TheBook.service.bookPostVO;
import TheBook.service.bookRegisterService;

@Controller
public class bookRegisterController {
	
	@Resource(name = "bookRegisterService")
	private bookRegisterService bookRegisterService;
	
	
	//=======================================================================회원가입 Insert
	@RequestMapping(value = "/bookRegister.do", method = RequestMethod.POST)
	@ResponseBody public Map<String, String> bookRegister(HttpServletResponse response, HttpServletRequest request, bookMemberVO bookMemberVO) throws Exception {
		
		String result = bookRegisterService.insertbookMember(bookMemberVO);
		if(result == null) result="ok";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", result);
		return map;
	}
		
	//=======================================================================회원가입 IdCheck
	@RequestMapping(value = "/bookRegisterIdCheck.do", method = RequestMethod.POST)
	@ResponseBody public Map<String, Object> bookRegisterIdCheck(HttpServletResponse response, HttpServletRequest request, bookMemberVO bookMemberVO) throws Exception {
		int cnt = bookRegisterService.selectIdCheck(bookMemberVO.getMemid());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cnt", cnt);
		return map;
	}
	
	//======================================================================= 우편번호 찾기 새창열기
	@RequestMapping(value = "/bookPost.do")
	public String bookFindZip(){
		return "TheBook/bookPost";
	}
	
	//======================================================================= 우편번호 새창에서 "시" 선택
	@RequestMapping(value = "/registerSido.do", method = RequestMethod.POST)
	@ResponseBody public Map<String, Object> selectSigunList(HttpServletRequest request, HttpServletResponse response, bookPostVO vo) throws Exception {
		
		List<?> sigunList = bookRegisterService.selectSigunList(vo.getSido());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sigunList", sigunList);

		return map;
	}
	
	//======================================================================= 우편번호 새창에서 검색 선택
	@RequestMapping(value = "/registerFindAddr.do", method = RequestMethod.POST)
	@ResponseBody public Map<String, Object> selectFindAddr(HttpServletRequest request, HttpServletResponse response, bookPostVO vo) throws Exception {
		
		List<?> addrList = bookRegisterService.selectFindAddr(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addrList", addrList);

		return map;
	}
	
	//======================================================================= 우편번호 값 넘기기
	@RequestMapping(value = "/registerFindFromUnq.do", method = RequestMethod.POST)
	@ResponseBody public Map<String, String> selectFindFromUnq(HttpServletRequest request, HttpServletResponse response, bookPostVO vo) throws Exception {

		String unq = Integer.toString(vo.getUnq());
		vo = bookRegisterService.selectFindFromUnq(unq);
		
		if(vo.getRi()==null){
			vo.setRi("");
		}
		if(vo.getBunji()==null){
			vo.setBunji("");
		}
		if(vo.getOthers()==null){
			vo.setOthers("");
		}
		String addr1 = vo.getSido()+" "+vo.getSigun()+" "+vo.getDong()+" "+vo.getRi()+" "+vo.getBunji()+" "+vo.getOthers();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("addr1", addr1);

		return map;
	}
}