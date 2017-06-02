package TheBook.service.impl;

import org.springframework.stereotype.Repository;

import TheBook.service.bookMemberVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("bookLoginDAO")
public class bookLoginDAO extends EgovAbstractDAO{

	public String getMemPwd(String memid) {
		return (String) select("bookLoginDAO.getMemPwd", memid);
	}
	
}