package TheBook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import TheBook.service.bookBaguniService;
import TheBook.service.bookBaguniVO;
import TheBook.service.bookMemberVO;
import TheBook.service.bookRebookVO;
import TheBook.service.bookStockVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("baguniService")
public class bookBaguniServiceImpl extends EgovAbstractServiceImpl implements bookBaguniService{
	
	@Resource(name = "baguniDAO")
	private bookBaguniDAO baguniDAO;

	@Override
	public bookMemberVO selectMemberInfo(String memid) throws Exception {
		return baguniDAO.selectMemberInfo(memid);
	}

	@Override
	public List<?> selectBaguniList(String memid) throws Exception {
		return baguniDAO.selectBaguniList(memid);
	}

	@Override
	public int updateBaguniTotal(bookBaguniVO vo) throws Exception {
		return baguniDAO.updateBaguniTotal(vo);
	}

	@Override
	public int deleteBaguni(bookBaguniVO vo) throws Exception {
		return baguniDAO.deleteBaguni(vo);
	}

	@Override
	public int selectBookstockCnt(bookBaguniVO vo) throws Exception {
		return baguniDAO.selectBookstockCnt(vo);
	}

	@Override
	public bookStockVO selectBookstockCntList(String unq) throws Exception {
		return baguniDAO.selectBookstockCntList(unq);
	}

	@Override
	public int selectBaguniCnt(String memid) throws Exception {
		return baguniDAO.selectBaguniCnt(memid);
	}

	@Override
	public bookRebookVO selectRebookstockCntList(String unq) throws Exception {
		return baguniDAO.selectRebookstockCntList(unq);
	}

}
