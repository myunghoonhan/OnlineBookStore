package TheBook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import TheBook.service.bookQnaService;
import TheBook.service.bookQnaVO;
import TheBook.service.bookStoreNoticeVO;
import TheBook.service.bookStoreVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("bookQnaService")
public class bookQnaServiceImpl extends EgovAbstractServiceImpl implements bookQnaService{

   @Resource(name = "qnaDAO")
   private bookQnaDAO qnaDAO;


   @Override
   public List<?> selectbqnaList(bookQnaVO vo) {
      return qnaDAO.selectbqnaList(vo);
   }

   @Override
   public int bqnaTot(bookQnaVO vo) {
      return qnaDAO.bqnaTot();
   }

   @Override
   public bookQnaVO selectqna(String qnaunq) {
      return qnaDAO.selectqna(qnaunq);
   }

   @Override
   public int updateQnaHit(String qnaunq) {
      return qnaDAO.updateQnaHit(qnaunq);
   }

   @Override
   public int selectQnaThreadCnt(String qnaunq) {
      // TODO Auto-generated method stub
      return qnaDAO.selectQnaThreadCnt(qnaunq);
   }

   @Override
   public int updateQnaClear(String qnaunq) {
      // TODO Auto-generated method stub
      return qnaDAO.updateQnaClear(qnaunq);
   }

   @Override
   public int deleteQna(String qnaunq) {
      // TODO Auto-generated method stub
      return qnaDAO.deleteQna(qnaunq);
   }

   @Override
   public int updateQna(bookQnaVO vo) {
      // TODO Auto-generated method stub
      return qnaDAO.updateQna(vo);
   }

   @Override
   public String insertQna(bookQnaVO vo) {
      return qnaDAO.insertQna(vo);
   }

   @Override
   public bookQnaVO selectQnaMaxThread(String qnaunq) {
      // TODO Auto-generated method stub
      return qnaDAO.selectQnaMaxThread(qnaunq);
   }

   @Override
   public bookQnaVO selectQnaDetail(String qnaunq) {
      return qnaDAO.selectQnaDetail(qnaunq);
   }

   @Override
   public String insertQnaReply(bookQnaVO vo) {
      return qnaDAO.insertQnaReply(vo);
   }

	@Override
	public int bookQnaPwdCheck(bookQnaVO vo) throws Exception {
		return qnaDAO.bookQnaPwdCheck(vo);
	}
   
}