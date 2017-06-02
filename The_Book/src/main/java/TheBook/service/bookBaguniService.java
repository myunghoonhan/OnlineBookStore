package TheBook.service;

import java.util.List;

public interface bookBaguniService {

	bookMemberVO selectMemberInfo(String memid) throws Exception;

	List<?> selectBaguniList(String memid) throws Exception;

	int updateBaguniTotal(bookBaguniVO vo) throws Exception;

	int deleteBaguni(bookBaguniVO vo) throws Exception;

	int selectBookstockCnt(bookBaguniVO vo) throws Exception;

	bookStockVO selectBookstockCntList(String unq) throws Exception;

	int selectBaguniCnt(String memid) throws Exception;

	bookRebookVO selectRebookstockCntList(String unq) throws Exception;

}
