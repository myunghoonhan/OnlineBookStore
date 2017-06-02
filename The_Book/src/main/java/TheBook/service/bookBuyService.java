package TheBook.service;

import java.util.List;

public interface bookBuyService {

	List<?> selectBuyList(String sqlValue) throws Exception;

	String insertBookBuy(bookBuyVO buyvo) throws Exception;

	String insertBookBuyDetail(bookBuyDetailVO buydetailvo) throws Exception;

	int updateRebookStock(String unq) throws Exception;

	int deleteBookbaguni(bookBuyVO buyvo) throws Exception;

	int updateBookStockCnt(bookBuyDetailVO buydetailvo) throws Exception;

	int updateBookmemberPoint(bookBuyVO buyvo) throws Exception;

	List<?> selectBuyListBook(String bounq) throws Exception;

	List<?> selectBuyListRebook(String bounq) throws Exception;

}
