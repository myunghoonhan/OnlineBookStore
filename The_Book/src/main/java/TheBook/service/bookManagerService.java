package TheBook.service;

import java.util.List;

public interface bookManagerService {

	List<?> bookManagerOrder(bookBuyVO vo) throws Exception;

	int updateCondition(bookBuyDetailVO vo) throws Exception;

	List<?> bookManagerQnA(bookQnaVO vo) throws Exception;

	int updateQnA(bookQnaVO vo) throws Exception;

	int deleteQnA(bookQnaVO vo) throws Exception;

	String insertNotice(bookNoticeVO vo) throws Exception;

	List<?> bookManagerNotice(bookNoticeVO vo) throws Exception;

	List<?> bookNoticesearch(bookNoticeVO vo) throws Exception;

	bookNoticeVO selectnoticeDetail(int unq) throws Exception;

	int modifynotice(bookNoticeVO vo) throws Exception;

	int deletenotice(bookNoticeVO vo) throws Exception;

	String insertstNotice(bookStoreNoticeVO vo) throws Exception;

	List<?> bookMangerStore(bookStoreNoticeVO vo) throws Exception;

	bookStoreNoticeVO selectstnotiDetail(int unq) throws Exception;

	int deletestNotice(bookStoreNoticeVO vo) throws Exception;

	int modifystnotice(bookStoreNoticeVO vo) throws Exception;

	List<?> bookList(bookVO vo) throws Exception;

	bookVO bookinfoform(String unq);

	int infoModify(bookVO vo);

	int deleteBook(bookVO vo);

	String nbookInsert(bookVO vo);

	String stockInsert(bookStockVO svo);

	int deletestock(bookStockVO svo);

	int stockModify(bookStockVO svo);

	int fileModify(bookVO vo);

	List<?> bigcode(bookLevelVO vo);

	List<?> selectBookList();



	
	

}
