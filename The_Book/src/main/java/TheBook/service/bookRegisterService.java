package TheBook.service;

import java.util.List;

public interface bookRegisterService {

	String insertbookMember(bookMemberVO bookMemberVO) throws Exception;

	int selectIdCheck(String memid);
	
	List<?> selectSigunList(String sido);

	List<?> selectFindAddr(bookPostVO vo);
	
	bookPostVO selectFindFromUnq(String unq) throws Exception;
}
