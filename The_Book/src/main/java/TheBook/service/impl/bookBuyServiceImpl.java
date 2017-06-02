package TheBook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import TheBook.service.bookBuyDetailVO;
import TheBook.service.bookBuyService;
import TheBook.service.bookBuyVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("buyService")
public class bookBuyServiceImpl extends EgovAbstractServiceImpl implements bookBuyService{

	@Resource(name = "buyDAO")
	private bookBuyDAO buyDAO;

	@Override
	public List<?> selectBuyList(String sqlValue) throws Exception {
		return buyDAO.selectBuyList(sqlValue);
	}

	@Override
	public String insertBookBuy(bookBuyVO buyvo) throws Exception {
		return buyDAO.insertBookBuy(buyvo);
	}

	@Override
	public String insertBookBuyDetail(bookBuyDetailVO buydetailvo) throws Exception {
		return buyDAO.insertBookBuyDetail(buydetailvo);
	}

	@Override
	public int updateRebookStock(String unq) throws Exception {
		return buyDAO.updateRebookStock(unq);
	}

	@Override
	public int deleteBookbaguni(bookBuyVO buyvo) throws Exception {
		return buyDAO.deleteBookbaguni(buyvo);
	}

	@Override
	public int updateBookStockCnt(bookBuyDetailVO buydetailvo) throws Exception {
		return buyDAO.updateBookStockCnt(buydetailvo);
	}

	@Override
	public int updateBookmemberPoint(bookBuyVO buyvo) throws Exception {
		return buyDAO.updateBookmemberPoint(buyvo);
	}

	@Override
	public List<?> selectBuyListBook(String bounq) throws Exception {
		return buyDAO.selectBuyListBook(bounq);
	}

	@Override
	public List<?> selectBuyListRebook(String bounq) throws Exception {
		return buyDAO.selectBuyListRebook(bounq);
	}

	
}
