package TheBook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import TheBook.service.bookRebookService;
import TheBook.service.bookRebookVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("bookRebookService")
public class bookRebookServiceImpl extends EgovAbstractServiceImpl 
implements bookRebookService{
	@Resource(name = "bookRebookDAO")
	private bookRebookDAO bookRebookDAO;

	@Override
	public List<?> bonameList(String boname) {
		return bookRebookDAO.bonameList(boname);
	}

	@Override
	public String rebookInsert(bookRebookVO bookRebookVO) {
		return bookRebookDAO.rebookInsert(bookRebookVO);
	}

	@Override
	public String reboname(String rebobookunq) {
		return bookRebookDAO.reboname(rebobookunq);
	}

	@Override
	public List<?> lowPriceList(bookRebookVO bookRebookVO) {
		return bookRebookDAO.lowPriceList(bookRebookVO);
	}

	@Override
	public List<?> bestList(bookRebookVO bookRebookVO) {
		return bookRebookDAO.bestList(bookRebookVO);
	}
}
