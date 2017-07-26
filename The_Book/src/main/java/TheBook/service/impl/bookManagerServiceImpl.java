package TheBook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;























import TheBook.service.bookBuyDetailVO;
import TheBook.service.bookBuyVO;
import TheBook.service.bookLevelVO;
import TheBook.service.bookManagerService;
import TheBook.service.bookNoticeVO;
import TheBook.service.bookQnaVO;
import TheBook.service.bookStockVO;
import TheBook.service.bookStoreNoticeVO;
import TheBook.service.bookVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("managerService")
public class bookManagerServiceImpl extends EgovAbstractServiceImpl implements bookManagerService {

	@Resource(name = "managerDAO")
	private bookManagerDAO managerDAO;

	@Override
	public List<?> bookManagerOrder(bookBuyVO vo) throws Exception {
		return managerDAO.bookManagerOrder(vo);
	}

	@Override
	public int updateCondition(bookBuyDetailVO vo) throws Exception {
		
		return managerDAO.updateCondition(vo);
	}

	@Override
	public List<?> bookManagerQnA(bookQnaVO vo) {
		
		return managerDAO.bookManagerQnA(vo);
	}

	@Override
	public int updateQnA(bookQnaVO vo) {
		return managerDAO.updateQnA(vo);
	}

	@Override
	public int deleteQnA(bookQnaVO vo) throws Exception {

		return managerDAO.deleteQnA(vo);
	}

	@Override
	public String insertNotice(bookNoticeVO vo) {
		
		return managerDAO.insertNotice(vo);
		
	}

	@Override
	public List<?> bookManagerNotice(bookNoticeVO vo) {
		return managerDAO.bookManagerNotice(vo);
	}

	@Override
	public List<?> bookNoticesearch(bookNoticeVO vo) {
		return managerDAO.bookNoticesearch(vo);
	}

	@Override
	public bookNoticeVO selectnoticeDetail(int unq) {
		return managerDAO.selectnoticeDetail(unq);
	}

	@Override
	public int modifynotice(bookNoticeVO vo) {
	
		return managerDAO.modifynotice(vo);
	}

	@Override
	public int deletenotice(bookNoticeVO vo) {
		return managerDAO.deletenotice(vo);
	}

	@Override
	public String insertstNotice(bookStoreNoticeVO vo) {
		return managerDAO.insertstNotice(vo);
	}

	@Override
	public List<?> bookMangerStore(bookStoreNoticeVO vo) {
		return managerDAO.bookMangerStore(vo);
	}

	@Override
	public bookStoreNoticeVO selectstnotiDetail(int unq) {
		return managerDAO.selectstnotiDetail(unq);
	}

	@Override
	public int deletestNotice(bookStoreNoticeVO vo) {
		return managerDAO.deletestNotice(vo);
	}

	@Override
	public int modifystnotice(bookStoreNoticeVO vo) {
		return managerDAO.modifystnotice(vo);
	}

	@Override
	public List<?> bookList(bookVO vo) throws Exception {
		return managerDAO.bookList(vo);
	}

	@Override
	public bookVO bookinfoform(String unq) {
		return managerDAO.bookinfoform(unq);
	}
	
	@Override
	public int deleteBook(bookVO vo) {
		return managerDAO.deleteBook(vo);
	}

	@Override
	public String nbookInsert(bookVO vo) {
		return managerDAO.nbookInsert(vo);
	}

	@Override
	public String stockInsert(bookStockVO svo) {
		return managerDAO.stockInsert(svo);
	}

	@Override
	public int deletestock(bookStockVO svo) {
		return managerDAO.deletestock(svo);
	}

	@Override
	public int stockModify(bookStockVO svo) {
		return managerDAO.stockModify(svo);
	}
	
	@Override
	public int infoModify(bookVO vo) {
		return managerDAO.infoModify(vo);
	}

	@Override
	public int fileModify(bookVO vo) {
		return managerDAO.fileModify(vo);
	}

	@Override
	public List<?> bigcode(bookLevelVO vo) {
		return managerDAO.bigcode(vo);
	}

	@Override
	public List<?> selectBookList() {
		return managerDAO.selectBookList();
	}

	


	
	
}
