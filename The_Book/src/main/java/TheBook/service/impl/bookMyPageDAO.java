package TheBook.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import TheBook.service.bookBaguniVO;
import TheBook.service.bookBuyDetailVO;
import TheBook.service.bookBuyVO;
import TheBook.service.bookMemberVO;
import TheBook.service.bookRebookVO;
import TheBook.service.bookVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("bookMyPageDAO")
public class bookMyPageDAO extends EgovAbstractDAO{

	public bookMemberVO selectMemInfo(String memid) {
		return (bookMemberVO) select("bookMyPageDAO.selectMemInfo", memid);
	}

	public List<?> selectMemBookBuy(bookBuyDetailVO bookBuyDetailVO) {
		return list("bookMyPageDAO.selectMemBookBuy", bookBuyDetailVO);
	}
	
	public int selectMemBookBuyTot(String memid) {
		return (int) select("bookMyPageDAO.selectMemBookBuyTot", memid);
	}

	public List<?> selectMemBookAuthor(String memid) {
		return list("bookMyPageDAO.selectMemBookAuthor", memid);
	}

	public int selectCntPay(String memid) {
		return (int) select("bookMyPageDAO.selectCntPay", memid);
	}

	public int selectCntPrepare(String memid) {
		return (int) select("bookMyPageDAO.selectCntPrepare", memid);
	}

	public int selectCntShipping(String memid) {
		return (int) select("bookMyPageDAO.selectCntShipping", memid);
	}

	public int selectCntFinish(String memid) {
		return (int) select("bookMyPageDAO.selectCntFinish", memid);
	}

	public List<?> selectBookQnaList(String memid) {
		return list("bookMyPageDAO.selectBookQnaList", memid);
	}

	public List<?> selectReBookList(String memid) {
		return list("bookMyPageDAO.selectReBookList", memid);
	}

	public int selectReMemInfo(bookMemberVO bookMemberVO) {
		return (int) select("bookMyPageDAO.selectReMemInfo", bookMemberVO);
	}

	public int updateMemModify(bookMemberVO bookMemberVO) {
		return (int) update("bookMyPageDAO.updateMemModify", bookMemberVO);
	}

	public int deleteMemModify(bookMemberVO bookMemberVO) {
		return (int) delete("bookMyPageDAO.deleteMemModify", bookMemberVO);
	}

	public bookBuyDetailVO selectBookBuyDetail(bookBuyDetailVO detailVO) {
		return (bookBuyDetailVO) select("bookMyPageDAO.selectBookBuyDetail", detailVO);
	}

	public int updateBookMemberPointPlus(bookMemberVO memberVO) {
		return update("bookMyPageDAO.updateBookMemberPointPlus", memberVO);
	}

	public int selectBookMemberGrade(String memid) {
		return (int) select("bookMyPageDAO.selectBookMemberGrade", memid);
	}

	public int deleteRebook(String buydetailbookunq) {
		return delete("bookMyPageDAO.deleteRebook", buydetailbookunq);
	}

	public int deleteBookBaguni(String buydetailbookunq) {
		return delete("bookMyPageDAO.deleteBookBaguni", buydetailbookunq);
	}

	public int updateBookBototal(bookBuyDetailVO detailVO) {
		return update("bookMyPageDAO.updateBookBototal", detailVO);
	}

	public int updateBookBuyDetailCondition(bookBuyDetailVO detailVO) {
		return update("bookMyPageDAO.updateBookBuyDetailCondition", detailVO);
	}

	public int selectBookCost(bookBuyDetailVO detailVO) {
		return (int) select("bookMyPageDAO.selectBookCost", detailVO);
	}
	
	public bookBuyDetailVO selectSumCashPoint(bookBuyDetailVO detailVO) {
		return (bookBuyDetailVO) select("bookMyPageDAO.selectSumCashPoint", detailVO);
	}

	public int updateCashPoint(bookBuyVO bookBuyVO) {
		return (int) update("bookMyPageDAO.updateCashPoint", bookBuyVO);
	}

	public int updateMemPoint(bookMemberVO bookMemberVO) {
		return (int) update("bookMyPageDAO.updateMemPoint", bookMemberVO);
	}

	public int updateRebookStock(String rebostock) {
		return (int) update("bookMyPageDAO.updateRebookStock", rebostock);
	}

	public int updateBookBoTotal(bookVO bookVO) {
		return (int) update("bookMyPageDAO.updateBookBoTotal", bookVO);
	}

	public int updateBookStock(bookVO bookVO) {
		return (int) update("bookMyPageDAO.updateBookStock", bookVO);
	}

	public int updateBookDetail(bookBuyDetailVO detailVO) {
		return (int) update("bookMyPageDAO.updateBookDetail", detailVO);
	}

	public int UpdateReBookBaguni(bookBaguniVO bookBaguniVO) {
		return (int) update("bookMyPageDAO.UpdateReBookBaguni", bookBaguniVO);
	}

	public int UpdateReBook(bookRebookVO bookRebookVO) {
		return (int) update("bookMyPageDAO.UpdateReBook", bookRebookVO);
	}

	public int DeleteReBook(bookRebookVO bookRebookVO) {
		return (int) delete("bookMyPageDAO.DeleteReBook", bookRebookVO);
	}

	public int DeleteReBookBaguni(String rebounq) {
		return (int) delete("bookMyPageDAO.DeleteReBookBaguni", rebounq);
	}
}