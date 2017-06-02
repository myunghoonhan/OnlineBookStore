package TheBook.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import TheBook.service.bookNoticeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("noticeDAO")
public class bookNoticeDAO extends EgovAbstractDAO{

   public List<?> selectbnoticeList(bookNoticeVO vo) {
      return list("noticeDAO.selectbnoticeList", vo);
   }

/*   public int bnoticeTot() {
      return (int) select("noticeDAO.bnoticeTot");
   }
*/

}

