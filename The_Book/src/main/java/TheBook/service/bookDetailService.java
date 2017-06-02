package TheBook.service;

import java.util.List;




public interface bookDetailService {

	bookVO bookDetail(String bounq);
	bookVO bookPreview(String bounq);
	List<?> bookStoreStock(String bounq);
	String authorAdd(bookAuthorVO bookAuthorVO);
	void bookDetailUdatehit(String bounq);
	String bookReview(bookReviewVO bookReviewVO);
	List<?> bookReviewList(String bounq);
	bookStockVO bookStockOrderDay(String bounq);
	bookMemberVO bookMemberInfo(String id);
	int reviewTotal(String bounq);
	int reviewStar(String bounq);
	String levelcode(String bounq);
	bookLevelVO daejungso(String levelcode);
	bookRebookVO detailRebook(String bounq);
	String jungTotal(String levelcode);
	List<?> jungTotalList(String levelname);
}
