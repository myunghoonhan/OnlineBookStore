package TheBook.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import TheBook.service.bookLoginService;
import TheBook.service.bookMemberVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("bookLoginService")
public class bookLoginImpl extends EgovAbstractServiceImpl implements bookLoginService {

	@Resource(name = "bookLoginDAO")
	private bookLoginDAO bookLoginDAO;

	@Override
	public String getMemPwd(String memid) {
		return bookLoginDAO.getMemPwd(memid);
	}
	
}








