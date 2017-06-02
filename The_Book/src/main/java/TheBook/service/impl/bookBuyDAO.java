package TheBook.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import TheBook.service.bookBuyDetailVO;
import TheBook.service.bookBuyVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("buyDAO")
public class bookBuyDAO extends EgovAbstractDAO{

	public List<?> selectBuyList(String sqlValue) {
		return list("buyDAO.selectBuyList", sqlValue);
	}

	public String insertBookBuy(bookBuyVO buyvo) {
		return (String) insert("buyDAO.insertBookBuy", buyvo);
	}

	public String insertBookBuyDetail(bookBuyDetailVO buydetailvo) {
		return (String) insert("buyDAO.insertBookBuyDetail", buydetailvo);
	}

	public int updateRebookStock(String unq) {
		return update("buyDAO.updateRebookStock", unq);
	}

	public int deleteBookbaguni(bookBuyVO buyvo) {
		return delete("buyDAO.deleteBookbaguni", buyvo);
	}

	public int updateBookStockCnt(bookBuyDetailVO buydetailvo) {
		return update("buyDAO.updateBookStockCnt", buydetailvo);
	}

	public int updateBookmemberPoint(bookBuyVO buyvo) {
		return update("buyDAO.updateBookmemberPoint", buyvo);
	}

	public List<?> selectBuyListBook(String bounq) {
		return list("buyDAO.selectBuyListBook", bounq);
	}

	public List<?> selectBuyListRebook(String bounq) {
		return list("buyDAO.selectBuyListRebook", bounq);
	}


}
