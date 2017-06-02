package TheBook.service.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import TheBook.service.bookQnaVO;
import TheBook.service.bookStoreNoticeVO;
import TheBook.service.bookStoreVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("storeDAO")
public class bookStoreDAO extends EgovAbstractDAO{

	public bookStoreVO selectStore(String storeunq) {
		System.out.println(storeunq);
		return (bookStoreVO) select("storeDAO.selectStore",storeunq);
	}

	public List<?> snoticeList(bookStoreNoticeVO vo) {
		return list("storeDAO.snoticeList", vo);
	}

/*	public int snoticeTot(bookStoreNoticeVO vo) {
		return (int) select("storeDAO.snoticeTot");
	}*/

}



