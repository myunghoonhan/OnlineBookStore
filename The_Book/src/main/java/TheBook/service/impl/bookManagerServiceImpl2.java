package TheBook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import TheBook.service.bookManagerService2;
import TheBook.service.bookStockVO;
import TheBook.service.bookStoreOrderVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("managerService2")
public class bookManagerServiceImpl2 extends EgovAbstractServiceImpl implements bookManagerService2{

	@Resource(name = "managerDAO2")
	private bookManagerDAO2 managerDAO2;

	@Override
	public List<?> selectStoreOrderList(bookStockVO stockVO) throws Exception {
		return managerDAO2.selectStoreOrderList(stockVO);
	}

	@Override
	public String insertStoreOrder(bookStoreOrderVO orderVO) throws Exception {
		return managerDAO2.insertStoreOrder(orderVO);
	}

	@Override
	public List<?> selectStoreOrderedList(bookStoreOrderVO orderVO) throws Exception {
		return managerDAO2.selectStoreOrderedList(orderVO);
	}

	@Override
	public List<?> selectStoreOrderCheck(bookStoreOrderVO orderVO) throws Exception {
		return managerDAO2.selectStoreOrderCheck(orderVO);
	}

	@Override
	public int updateStoreOrderCheck(bookStoreOrderVO orderVO) throws Exception {
		return managerDAO2.updateStoreOrderCheck(orderVO);
	}

	@Override
	public List<?> selectStoreTotalPrice() throws Exception {
		return managerDAO2.selectStoreTotalPrice();
	}
}
