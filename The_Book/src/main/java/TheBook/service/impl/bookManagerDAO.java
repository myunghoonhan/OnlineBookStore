package TheBook.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import TheBook.service.bookBuyDetailVO;
import TheBook.service.bookBuyVO;
import TheBook.service.bookLevelVO;
import TheBook.service.bookNoticeVO;
import TheBook.service.bookQnaVO;
import TheBook.service.bookStockVO;
import TheBook.service.bookStoreNoticeVO;
import TheBook.service.bookVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;


@Repository("managerDAO")
public class bookManagerDAO extends EgovAbstractDAO{

	
	public List<?> bookManagerOrder(bookBuyVO vo) {

		return list("managerDAO.bookManagerOrder", vo);
	}


	public int updateCondition(bookBuyDetailVO vo) {

		return update("managerDAO.updateCondition", vo);
	}


	public List<?> bookManagerQnA(bookQnaVO vo) {
		
		return list("managerDAO.bookManagerQnA", vo);
	}


	public int updateQnA(bookQnaVO vo) {

		return update("managerDAO.updateQnA", vo);
	}


	public int deleteQnA(bookQnaVO vo) {
	
		return delete("managerDAO.deleteQnA", vo);
	}


	public String insertNotice(bookNoticeVO vo) {
		System.out.println("11111111");
		return (String) insert("managerDAO.insertNotice", vo);
	}


	public List<?> bookManagerNotice(bookNoticeVO vo) {
		return list("managerDAO.bookManagerNotice", vo);
	}


	public List<?> bookNoticesearch(bookNoticeVO vo) {
		return list("managerDAO.bookNoticesearch", vo);
	}


	public bookNoticeVO selectnoticeDetail(int unq) {
		return (bookNoticeVO) select("managerDAO.selectnoticeDetail", unq);
	}


	public int modifynotice(bookNoticeVO vo) {
		return update("managerDAO.modifynotice", vo);
	}


	public int deletenotice(bookNoticeVO vo) {
		return delete("managerDAO.deletenotice", vo);
	}


	public String insertstNotice(bookStoreNoticeVO vo) {
		return (String) insert("managerDAO.insertstNotice", vo);
	}


	public List<?> bookMangerStore(bookStoreNoticeVO vo) {
		return list("managerDAO.bookMangerStore", vo);
	}


	public bookStoreNoticeVO selectstnotiDetail(int unq) {
		return (bookStoreNoticeVO) select("managerDAO.selectstnotiDetail", unq);
	}


	public int deletestNotice(bookStoreNoticeVO vo) {
		return delete("managerDAO.deletestNotice", vo);
	}


	public int modifystnotice(bookStoreNoticeVO vo) {
		return update("managerDAO.modifystnotice", vo);
	}


	public List<?> bookList(bookVO vo) {
		return list("managerDAO.bookList", vo);
	}


	public bookVO bookinfoform(String unq) {
		return (bookVO) select("managerDAO.bookinfoform", unq);
	}


	public int deleteBook(bookVO vo) {
		return delete("managerDAO.deleteBook", vo);
	}


	public String nbookInsert(bookVO vo) {
		return (String) insert("managerDAO.nbookInsert", vo);
	}


	public String stockInsert(bookStockVO svo) {
		return (String) insert("managerDAO.stockInsert", svo);
	}


	public int deletestock(bookStockVO svo) {
		return delete("managerDAO.deletestock", svo);
	}


	public int stockModify(bookStockVO svo) {
		return update("managerDAO.stockModify", svo);
	}
	
	public int infoModify(bookVO vo) {
		return update("managerDAO.infoModify", vo);
	}


	public int fileModify(bookVO vo) {
		return update("managerDAO.fileModify", vo);
	}


	public List<?> bigcode(bookLevelVO vo) {
		return list("managerDAO.bigcode", vo);
	}


	public List<?> selectBookList() {
		return list("managerDAO.selectBookList");
	}


	
	
	

}
