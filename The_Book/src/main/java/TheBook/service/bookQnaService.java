package TheBook.service;

import java.util.List;

public interface bookQnaService {

   List<?> selectbqnaList(bookQnaVO vo);

   int bqnaTot(bookQnaVO vo);

   bookQnaVO selectqna(String qnaunq);

   int updateQnaHit(String qnaunq);

   int selectQnaThreadCnt(String qnaunq);

   int updateQnaClear(String qnaunq);

   int deleteQna(String qnaunq);

   int updateQna(bookQnaVO vo);

   String insertQna(bookQnaVO vo);

   bookQnaVO selectQnaMaxThread(String qnaunq);

   bookQnaVO selectQnaDetail(String qnaunq);

   String insertQnaReply(bookQnaVO vo);

   int bookQnaPwdCheck(bookQnaVO vo) throws Exception;

}