package TheBook.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import TheBook.service.bookRebookVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("bookRebookDAO")
public class bookRebookDAO extends EgovAbstractDAO{

	public List<?> bonameList(String boname) {
		return list ("bookRebookDAO.bonameList" , boname);
	}

	public String rebookInsert(bookRebookVO bookRebookVO) {
		return (String) insert("bookRebookDAO.rebookInsert" , bookRebookVO);
	}

	public String reboname(String rebobookunq) {
		return (String) select ("bookRebookDAO.reboname" , rebobookunq);
	}

	public List<?> lowPriceList(bookRebookVO bookRebookVO) {
		return list("bookRebookDAO.lowPriceList" , bookRebookVO);
	}

	public List<?> bestList(bookRebookVO bookRebookVO) {
		return list("bookRebookDAO.bestList" , bookRebookVO);
	}
}
