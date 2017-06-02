package TheBook.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import TheBook.service.bookAuthorVO;
import TheBook.service.bookLevelVO;
import TheBook.service.bookMemberVO;
import TheBook.service.bookRebookVO;
import TheBook.service.bookReviewVO;
import TheBook.service.bookStockVO;
import TheBook.service.bookVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
@Repository("bookDetailDAO")
public class bookDetailDAO extends EgovAbstractDAO {

	public bookVO bookDetail(String bounq) {
		return (bookVO) select ("bookDetailDAO.bookDetail" ,bounq);
	}

	public bookVO bookPreview(String bounq) {
		return (bookVO) select ("bookDetailDAO.bookPreview" ,bounq);
	}

	public List<?> bookStoreStock(String bounq) {
		return list ("bookDetailDAO.bookStoreStock" , bounq);
	}

	public String authorAdd(bookAuthorVO bookAuthorVO) {
		return (String) insert ("bookDetailDAO.authorAdd" , bookAuthorVO);
	}

	public void bookDetailUdatehit(String bounq) {
		update ("bookDetailDAO.bookDetailUdatehit" ,bounq );
	}

	public String bookReview(bookReviewVO bookReviewVO) {
		return (String) insert ("bookDetailDAO.bookReview" , bookReviewVO);
	}

	public List<?> bookReviewList(String bounq) {
		return list ("bookDetailDAO.bookReviewList" , bounq);
	}

	public bookStockVO bookStockOrderDay(String bounq) {
		return (bookStockVO) select ("bookDetailDAO.bookStockOrderDay" ,bounq);
	}

	public bookMemberVO bookMemberInfo(String id) {
		return (bookMemberVO) select ("bookDetailDAO.bookMemberInfo" ,id);
	}

	public int reviewTotal(String bounq) {
		return (int) select ("bookDetailDAO.reviewTotal" , bounq);
	}

	public int reviewStar(String bounq) {
		return (int) select ("bookDetailDAO.reviewStar" , bounq);
	}

	public String levelcode(String bounq) {
		return (String) select ("bookDetailDAO.levelcode" , bounq);
	}

	public bookLevelVO daejungso(String levelcode) {
		return (bookLevelVO) select ("bookDetailDAO.daejungso" , levelcode);
	}

	public bookRebookVO detailRebook(String bounq) {
		return (bookRebookVO) select ("bookDetailDAO.detailRebook" , bounq);
	}

	public String jungTotal(String levelcode) {
		return (String) select ("bookDetailDAO.jungTotal" , levelcode);
	}

	public List<?> jungTotalList(String levelname) {
		return list ("bookDetailDAO.jungTotalList" , levelname);
	}
}
