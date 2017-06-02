package TheBook.service;

import java.util.List;

public interface bookMyPageService {
	
	bookMemberVO selectMemInfo(String memid) throws Exception;
	
	List<?> selectMemBookBuy(bookBuyDetailVO bookBuyDetailVO) throws Exception;
	int selectMemBookBuyTot(String memid);
	
	List<?> selectMemBookAuthor(String memid) throws Exception;
	
	int selectCntPay(String memid);
	int selectCntPrepare(String memid);
	int selectCntShipping(String memid);
	int selectCntFinish(String memid);

	List<?> selectBookQnaList(String memid) throws Exception;
	List<?> selectReBookList(String memid) throws Exception;

	int selectReMemInfo(bookMemberVO bookMemberVO);

	int updateMemModify(bookMemberVO bookMemberVO);

	int deleteMemModify(bookMemberVO bookMemberVO);

	bookBuyDetailVO selectBookBuyDetail(bookBuyDetailVO detailVO) throws Exception;

	int updateBookMemberPointPlus(bookMemberVO memberVO) throws Exception;

	int selectBookMemberGrade(String memid) throws Exception;

	int deleteRebook(String buydetailbookunq) throws Exception;

	int deleteBookBaguni(String buydetailbookunq) throws Exception;

	int updateBookBototal(bookBuyDetailVO detailVO) throws Exception;

	int updateBookBuyDetailCondition(bookBuyDetailVO detailVO) throws Exception;

	int selectBookCost(bookBuyDetailVO detailVO);
	
	boolean requestCancel(bookBuyDetailVO detailVO, String memid) throws Exception;

	int UpdateReBook(String rebounq, int rebopirce, String memid);

	int DeleteReBook(String rebounq, String memid);
	
}
