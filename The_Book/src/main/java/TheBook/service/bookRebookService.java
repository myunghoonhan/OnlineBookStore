package TheBook.service;

import java.util.List;

public interface bookRebookService {

	List<?> bonameList(String boname);

	String rebookInsert(bookRebookVO bookRebookVO);

	String reboname(String rebobookunq);

	List<?> lowPriceList(bookRebookVO bookRebookVO);

	List<?> bestList(bookRebookVO bookRebookVO);
}
