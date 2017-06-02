package TheBook.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import TheBook.service.bookBaguniVO;
import TheBook.service.bookMemberVO;
import TheBook.service.bookRebookVO;
import TheBook.service.bookStockVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("baguniDAO")
public class bookBaguniDAO extends EgovAbstractDAO{

	public bookMemberVO selectMemberInfo(String memid) {
		return (bookMemberVO) select("baguniDAO.selectMemberInfo", memid);
	}

	public List<?> selectBaguniList(String memid) {
		return list("baguniDAO.selectBaguniList", memid);
	}

	public int updateBaguniTotal(bookBaguniVO vo) {
		return update("baguniDAO.updateBaguniTotal", vo);
	}

	public int deleteBaguni(bookBaguniVO vo) {
		return delete("baguniDAO.deleteBaguni", vo);
	}

	public int selectBookstockCnt(bookBaguniVO vo) {
		return (int) select("baguniDAO.selectBookstockCnt", vo);
	}

	public bookStockVO selectBookstockCntList(String unq) {
		return (bookStockVO) select("baguniDAO.selectBookstockCntList", unq);
	}

	public int selectBaguniCnt(String memid) {
		return (int) select("baguniDAO.selectBaguniCnt", memid);
	}

	public bookRebookVO selectRebookstockCntList(String unq) {
		return (bookRebookVO) select("baguniDAO.selectRebookstockCntList", unq);
	}

}
