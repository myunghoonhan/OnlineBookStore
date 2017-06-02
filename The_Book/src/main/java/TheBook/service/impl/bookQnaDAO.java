package TheBook.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import TheBook.service.bookQnaVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("qnaDAO")
public class bookQnaDAO extends EgovAbstractDAO{

   public List<?> selectbqnaList(bookQnaVO vo) {
      System.out.println(vo);
      return list("qnaDAO.selectbqnaList", vo);
   }


   public int bqnaTot() {
      return (int) select("qnaDAO.bqnaTot");
   }

   public bookQnaVO selectqna(String qnaunq) {
      return (bookQnaVO) select("qnaDAO.selectqna", qnaunq);
   }


   public int updateQnaHit(String qnaunq) {      
      return (int) update("qnaDAO.updateQnaHit", qnaunq);
   }


   public int selectQnaThreadCnt(String qnaunq) {
      return (int) select("qnaDAO.selectQnaThreadCnt", qnaunq);
   }


   public int updateQnaClear(String qnaunq) {
      return update("qnaDAO.updateQnaClear", qnaunq);
   }


   public int deleteQna(String qnaunq) {
      return delete("qnaDAO.deleteQna", qnaunq);
   }

   public int updateQna(bookQnaVO vo) {
      return update("qnaDAO.updateQna", vo);
   }


   public String insertQna(bookQnaVO vo) {
      return (String) insert("qnaDAO.insertQna", vo);
   }


   public bookQnaVO selectQnaMaxThread(String qnaunq) {
      // TODO Auto-generated method stub
      return (bookQnaVO) select("qnaDAO.selectQnaMaxThread", qnaunq);
   }


   public bookQnaVO selectQnaDetail(String qnaunq) {
      return (bookQnaVO) select("qnaDAO.selectQnaDetail", qnaunq);
   }


   public String insertQnaReply(bookQnaVO vo) {
      // TODO Auto-generated method stub
      return (String) insert("qnaDAO.insertQnaReply", vo);
   }


	public int bookQnaPwdCheck(bookQnaVO vo) {
		return (int) select("qnaDAO.bookQnaPwdCheck", vo);
	}



}