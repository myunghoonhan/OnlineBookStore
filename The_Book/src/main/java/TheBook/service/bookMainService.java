package TheBook.service;

import java.util.List;

public interface bookMainService {

	List<?> selectUpdate(bookVO bookVO) throws Exception;
	String selectfavorite(String id);
	List<?> favoriteBookList(String favorite);
	List<?> nullfavoriteList(bookVO bookVO);
	List<?> highPriceList(bookVO bookVO);
	List<?> guknae(String levelcode);
	List<?> soList(bookLevelVO bookLevelVO);
	List<?> soname(String levelcode);
	List<?> bookSeachBar(bookVO bookVO);
	List<?> searchTotCount(bookVO bookVO);
	List<?> searchBookInfo(bookVO bookVO);
	List<?> searchNewLists(bookVO bookVO);
	List<?> searchLowPriceList(bookVO bookVO);
	List<?> searchHighPriceList(bookVO bookVO);
	List<?> searchReviewList(bookVO bookVO);
	List<?> searchHitList(bookVO bookVO);
	String memgrade(String id);
	List<?> tagRegDateList(String levelcode);
	List<?> tagLowPriceList(String levelcode);
	List<?> tagHighPriceList(String levelcode);
	List<?> tagReviewList(String levelcode);
	List<?> tagHitList(String levelcode);
	List<?> mainSearchRebook(bookRebookVO bookRebookVO);
	List<?> LowPriceRebook(bookRebookVO bookRebookVO);
	List<?> HighPriceRebook(bookRebookVO bookRebookVO);
	List<?> clickJungoList(String rebobookunq);
	String baguniAdd(bookBaguniVO bookBaguniVO);
}
