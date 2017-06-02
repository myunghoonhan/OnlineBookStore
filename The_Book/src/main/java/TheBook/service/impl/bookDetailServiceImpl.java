package TheBook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import TheBook.service.bookAuthorVO;
import TheBook.service.bookDetailService;
import TheBook.service.bookLevelVO;
import TheBook.service.bookMemberVO;
import TheBook.service.bookRebookVO;
import TheBook.service.bookReviewVO;
import TheBook.service.bookStockVO;
import TheBook.service.bookVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("bookDetailService")
public class bookDetailServiceImpl extends EgovAbstractServiceImpl 
implements bookDetailService{
	@Resource(name = "bookDetailDAO")
	private bookDetailDAO bookDetailDAO;

	@Override
	public bookVO bookDetail(String bounq) {
		return bookDetailDAO.bookDetail(bounq);
	}

	@Override
	public bookVO bookPreview(String bounq) {
		return bookDetailDAO.bookPreview(bounq);
	}

	@Override
	public List<?> bookStoreStock(String bounq) {
		return bookDetailDAO.bookStoreStock(bounq);
	}

	@Override
	public String authorAdd(bookAuthorVO bookAuthorVO) {
		return bookDetailDAO.authorAdd(bookAuthorVO);
	}

	@Override
	public void bookDetailUdatehit(String bounq) {
		bookDetailDAO.bookDetailUdatehit(bounq);
		
	}

	@Override
	public String bookReview(bookReviewVO bookReviewVO) {
		return bookDetailDAO.bookReview(bookReviewVO);
	}

	@Override
	public List<?> bookReviewList(String bounq) {
		return bookDetailDAO.bookReviewList(bounq);
	}

	@Override
	public bookStockVO bookStockOrderDay(String bounq) {
		return bookDetailDAO.bookStockOrderDay(bounq);
	}

	@Override
	public bookMemberVO bookMemberInfo(String id) {
		return bookDetailDAO.bookMemberInfo(id);
	}

	@Override
	public int reviewTotal(String bounq) {
		return bookDetailDAO.reviewTotal(bounq);
	}

	@Override
	public int reviewStar(String bounq) {
		return bookDetailDAO.reviewStar(bounq);
	}

	@Override
	public String levelcode(String bounq) {
		return bookDetailDAO.levelcode(bounq);
	}

	@Override
	public bookLevelVO daejungso(String levelcode) {
		return bookDetailDAO.daejungso(levelcode);
	}

	@Override
	public bookRebookVO detailRebook(String bounq) {
		return bookDetailDAO.detailRebook(bounq);
	}

	@Override
	public String jungTotal(String levelcode) {
		return bookDetailDAO.jungTotal(levelcode);
	}

	@Override
	public List<?> jungTotalList(String levelname) {
		return bookDetailDAO.jungTotalList(levelname);
	}
}
