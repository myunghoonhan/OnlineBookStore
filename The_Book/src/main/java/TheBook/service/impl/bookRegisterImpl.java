package TheBook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import TheBook.service.bookMemberVO;
import TheBook.service.bookPostVO;
import TheBook.service.bookRegisterService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("bookRegisterService")
public class bookRegisterImpl extends EgovAbstractServiceImpl implements bookRegisterService {

	@Resource(name = "bookRegisterDAO")
	private bookRegisterDAO bookRegisterDAO;

	@Override
	public String insertbookMember(bookMemberVO bookMemberVO) throws Exception {
		return bookRegisterDAO.insertbookMember(bookMemberVO);
	}

	@Override
	public int selectIdCheck(String memid) {
		return bookRegisterDAO.selectIdCheck(memid);
	}
	
	@Override
	public List<?> selectSigunList(String sido) {
		return bookRegisterDAO.selectSigunList(sido);
	}

	@Override
	public List<?> selectFindAddr(bookPostVO vo) {
		return bookRegisterDAO.selectFindAddr(vo);
	}
	
	@Override
	public bookPostVO selectFindFromUnq(String unq) throws Exception{
		return bookRegisterDAO.selectFindFromUnq(unq);
	}

}








