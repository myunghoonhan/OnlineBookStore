package TheBook.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import TheBook.service.bookBaguniVO;
import TheBook.service.bookLevelVO;
import TheBook.service.bookRebookVO;
import TheBook.service.bookVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("bookMainDAO")
public class bookMainDAO extends EgovAbstractDAO{

	public List<?> selectUpdate(bookVO bookVO) {
		return list("bookMainDAO.selectUpdate", bookVO);
	}

	public String selectfavorite(String id) {
		return (String) select ("bookMainDAO.selectfavorite", id);
	}

	public List<?> favoriteBookList(String favorite) {
		return list("bookMainDAO.favoriteBookList", favorite);
	}

	public List<?> nullfavoriteList(bookVO bookVO) {
		return list("bookMainDAO.nullfavoriteList", bookVO);
	}

	public List<?> highPriceList(bookVO bookVO) {
		return list("bookMainDAO.highPriceList", bookVO);
	}


	public List<?> guknae(String levelcode) {
		return list("bookMainDAO.guknae", levelcode);
	}

	public List<?> soList(bookLevelVO bookLevelVO) {
		return list("bookMainDAO.soList", bookLevelVO);
	}

	public List<?> soname(String levelcode) {
		return list("bookMainDAO.soname", levelcode);
	}

	public List<?> bookSeachBar(bookVO bookVO) {
		return list("bookMainDAO.bookSeachBar", bookVO);
	}

	public List<?> searchTotCount(bookVO bookVO) {
		return list("bookMainDAO.searchTotCount", bookVO);
	}

	public List<?> searchBookInfo(bookVO bookVO) {
		return list("bookMainDAO.searchBookInfo", bookVO);
	}

	public List<?> searchNewLists(bookVO bookVO) {
		return list("bookMainDAO.searchNewLists", bookVO);
	}

	public List<?> searchLowPriceList(bookVO bookVO) {
		return list("bookMainDAO.searchLowPriceList", bookVO);
	}

	public List<?> searchHighPriceList(bookVO bookVO) {
		return list("bookMainDAO.searchHighPriceList", bookVO);
	}

	public List<?> searchReviewList(bookVO bookVO) {
		return list("bookMainDAO.searchReviewList", bookVO);
	}

	public List<?> searchHitList(bookVO bookVO) {
		return list("bookMainDAO.searchHitList", bookVO);
	}

	public String memgrade(String id) {
		return (String) select ("bookMainDAO.memgrade", id);
	}

	public List<?> tagRegDateList(String levelcode) {
		return list("bookMainDAO.tagRegDateList", levelcode);
	}

	public List<?> tagLowPriceList(String levelcode) {
		return list("bookMainDAO.tagLowPriceList", levelcode);
	}

	public List<?> tagHighPriceList(String levelcode) {
		return list("bookMainDAO.tagHighPriceList", levelcode);
	}

	public List<?> tagReviewList(String levelcode) {
		return list("bookMainDAO.tagReviewList", levelcode);
	}

	public List<?> tagHitList(String levelcode) {
		return list("bookMainDAO.tagHitList", levelcode);
	}

	public List<?> mainSearchRebook(bookRebookVO bookRebookVO) {
		return list("bookMainDAO.mainSearchRebook", bookRebookVO);
	}

	public List<?> LowPriceRebook(bookRebookVO bookRebookVO) {
		return list("bookMainDAO.LowPriceRebook", bookRebookVO);
	}

	public List<?> HighPriceRebook(bookRebookVO bookRebookVO) {
		return list("bookMainDAO.HighPriceRebook", bookRebookVO);
	}

	public List<?> clickJungoList(String rebobookunq) {
		return list("bookMainDAO.clickJungoList", rebobookunq);
	}

	public String baguniAdd(bookBaguniVO bookBaguniVO) {
		return (String) insert("bookMainDAO.baguniAdd", bookBaguniVO);
	}
}
