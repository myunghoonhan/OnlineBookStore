package TheBook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import TheBook.service.bookBaguniVO;
import TheBook.service.bookLevelVO;
import TheBook.service.bookMainService;
import TheBook.service.bookRebookVO;
import TheBook.service.bookVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("bookMainService")
public class bookMainServiceImpl extends EgovAbstractServiceImpl implements bookMainService{
	@Resource(name="bookMainDAO")
	private bookMainDAO bookMainDAO;

	@Override
	public List<?> selectUpdate(bookVO bookVO) {
		return bookMainDAO.selectUpdate(bookVO);
	}
	@Override
	public String selectfavorite(String id) {
		return bookMainDAO.selectfavorite(id);
	}
	@Override
	public List<?> favoriteBookList(String favorite) {
		return bookMainDAO.favoriteBookList(favorite);
	}
	@Override
	public List<?> nullfavoriteList(bookVO bookVO) {
		return bookMainDAO.nullfavoriteList(bookVO);
	}
	@Override
	public List<?> highPriceList(bookVO bookVO) {
		return bookMainDAO.highPriceList(bookVO);
	}
	
	@Override
	public List<?> guknae(String levelcode) {
		return bookMainDAO.guknae(levelcode);
	}
	@Override
	public List<?> soList(bookLevelVO bookLevelVO) {
		return bookMainDAO.soList(bookLevelVO);
	}
	@Override
	public List<?> soname(String levelcode) {
		return bookMainDAO.soname(levelcode);
	}
	@Override
	public List<?> bookSeachBar(bookVO bookVO) {
		return bookMainDAO.bookSeachBar(bookVO);
	}
	@Override
	public List<?> searchTotCount(bookVO bookVO) {
		return bookMainDAO.searchTotCount(bookVO);
		}
	@Override
	public List<?> searchBookInfo(bookVO bookVO) {
		return bookMainDAO.searchBookInfo(bookVO);
	}
	@Override
	public List<?> searchNewLists(bookVO bookVO) {
		return bookMainDAO.searchNewLists(bookVO);
	}
	@Override
	public List<?> searchLowPriceList(bookVO bookVO) {
		return bookMainDAO.searchLowPriceList(bookVO);
	}
	@Override
	public List<?> searchHighPriceList(bookVO bookVO) {
		return bookMainDAO.searchHighPriceList(bookVO);
	}
	@Override
	public List<?> searchReviewList(bookVO bookVO) {
		return bookMainDAO.searchReviewList(bookVO);
	}
	@Override
	public List<?> searchHitList(bookVO bookVO) {
		return bookMainDAO.searchHitList(bookVO);
	}
	@Override
	public String memgrade(String id) {
		return bookMainDAO.memgrade(id);
	}
	@Override
	public List<?> tagRegDateList(String levelcode) {
		return bookMainDAO.tagRegDateList(levelcode);
	}
	@Override
	public List<?> tagLowPriceList(String levelcode) {
		return bookMainDAO.tagLowPriceList(levelcode);
	}
	@Override
	public List<?> tagHighPriceList(String levelcode) {
		return bookMainDAO.tagHighPriceList(levelcode);
	}
	@Override
	public List<?> tagReviewList(String levelcode) {
		return bookMainDAO.tagReviewList(levelcode);
	}
	@Override
	public List<?> tagHitList(String levelcode) {
		return bookMainDAO.tagHitList(levelcode);
	}
	@Override
	public List<?> mainSearchRebook(bookRebookVO bookRebookVO) {
		return bookMainDAO.mainSearchRebook(bookRebookVO);
	}
	@Override
	public List<?> LowPriceRebook(bookRebookVO bookRebookVO) {
		return bookMainDAO.LowPriceRebook(bookRebookVO);
	}
	@Override
	public List<?> HighPriceRebook(bookRebookVO bookRebookVO) {
		return bookMainDAO.HighPriceRebook(bookRebookVO);
	}
	@Override
	public List<?> clickJungoList(String rebobookunq) {
		return bookMainDAO.clickJungoList(rebobookunq);
	}
	@Override
	public String baguniAdd(bookBaguniVO bookBaguniVO) {
		return bookMainDAO.baguniAdd(bookBaguniVO);
	}
}

