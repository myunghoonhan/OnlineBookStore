package TheBook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import TheBook.service.bookNoticeService;
import TheBook.service.bookNoticeVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("noticeService")
public class bookNoticeServiceImpl extends EgovAbstractServiceImpl implements bookNoticeService{

   @Resource(name = "noticeDAO")
   private bookNoticeDAO noticeDAO;

   @Override
   public List<?> selectbnoticeList(bookNoticeVO vo) throws Exception{
      return noticeDAO.selectbnoticeList(vo);
   }

   /*@Override
   public int bnoticeTot(bookNoticeVO vo) {
      return noticeDAO.bnoticeTot();
   }*/

}