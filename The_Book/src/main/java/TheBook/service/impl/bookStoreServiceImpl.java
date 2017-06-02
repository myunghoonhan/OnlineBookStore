package TheBook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import TheBook.service.bookQnaVO;
import TheBook.service.bookStoreNoticeVO;
import TheBook.service.bookStoreService;
import TheBook.service.bookStoreVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("storeService")
public class bookStoreServiceImpl extends EgovAbstractServiceImpl implements bookStoreService{

	@Resource(name = "storeDAO")
	private bookStoreDAO storeDAO;

	@Override
	public bookStoreVO selectStore(String storeunq) {
		return storeDAO.selectStore(storeunq);
	}

	@Override
	public List<?> snoticeList(bookStoreNoticeVO vo) throws Exception {
		return storeDAO.snoticeList(vo);
	}
	
/*	@Override
	public int snoticeTot(bookStoreNoticeVO vo) throws Exception {
		return storeDAO.snoticeTot(vo);
	}*/

}
