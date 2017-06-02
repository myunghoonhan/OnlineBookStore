package TheBook.service;

import java.util.List;

public interface bookStoreService {

	bookStoreVO selectStore(String storeunq) throws Exception;


	List<?> snoticeList(bookStoreNoticeVO vo) throws Exception;

/*	int snoticeTot(bookStoreNoticeVO vo) throws Exception;*/

}
