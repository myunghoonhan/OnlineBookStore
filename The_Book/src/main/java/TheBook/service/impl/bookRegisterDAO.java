package TheBook.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import TheBook.service.bookMemberVO;
import TheBook.service.bookPostVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("bookRegisterDAO")
public class bookRegisterDAO extends EgovAbstractDAO{

	public String insertbookMember(bookMemberVO bookMemberVO) {
		return (String) insert("bookRegisterDAO.insertbookMember", bookMemberVO);
	}

	public int selectIdCheck(String memid) {
		return (int) select("bookRegisterDAO.selectIdCheck", memid);
	}

	public List<?> selectSigunList(String sido) {
		return (List<?>) list("bookRegisterDAO.selectSigunList", sido);
	}

	public List<?> selectFindAddr(bookPostVO vo) {
		return (List<?>) list("bookRegisterDAO.selectFindAddr", vo);
	}

	public bookPostVO selectFindFromUnq(String unq) {
		return (bookPostVO) select("bookRegisterDAO.selectFindFromUnq", unq);
	}
	
}