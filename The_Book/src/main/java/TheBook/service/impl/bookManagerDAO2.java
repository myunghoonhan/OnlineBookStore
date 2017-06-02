package TheBook.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import TheBook.service.bookStockVO;
import TheBook.service.bookStoreOrderVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("managerDAO2")
public class bookManagerDAO2 extends EgovAbstractDAO{

	public List<?> selectStoreOrderList(bookStockVO stockVO) {
		return list("managerDAO2.selectStoreOrderList", stockVO);
	}

	public String insertStoreOrder(bookStoreOrderVO orderVO) {
		return (String) insert("managerDAO2.insertStoreOrder", orderVO);
	}

	public List<?> selectStoreOrderedList(bookStoreOrderVO orderVO) {
		return list("managerDAO2.selectStoreOrderedList", orderVO);
	}

	public List<?> selectStoreOrderCheck(bookStoreOrderVO orderVO) {
		return list("managerDAO2.selectStoreOrderCheck", orderVO);
	}

	public int updateStoreOrderCheck(bookStoreOrderVO orderVO) {
		return update("managerDAO2.updateStoreOrderCheck", orderVO);
	}

	public List<?> selectStoreTotalPrice() {
		return list("managerDAO2.selectStoreTotalPrice");
	}

	/*
	 * public List<?> bookManagerOrder(bookBuyVO vo) {

		return list("managerDAO.bookManagerOrder", vo);
	}
	 * 
	 * */
}
