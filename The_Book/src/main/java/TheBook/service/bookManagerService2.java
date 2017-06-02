package TheBook.service;

import java.util.List;

public interface bookManagerService2 {

	List<?> selectStoreOrderList(bookStockVO stockVO) throws Exception;

	String insertStoreOrder(bookStoreOrderVO orderVO) throws Exception;

	List<?> selectStoreOrderedList(bookStoreOrderVO orderVO) throws Exception;

	List<?> selectStoreOrderCheck(bookStoreOrderVO orderVO) throws Exception;

	int updateStoreOrderCheck(bookStoreOrderVO orderVO) throws Exception;

	List<?> selectStoreTotalPrice() throws Exception;
	
	//List<?> selectBuyList(String sqlValue) throws Exception;

	//String insertBookBuy(bookBuyVO buyvo) throws Exception;
}
