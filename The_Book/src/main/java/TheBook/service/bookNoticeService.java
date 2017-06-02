package TheBook.service;

import java.util.List;

public interface bookNoticeService {

   List<?> selectbnoticeList(bookNoticeVO vo) throws Exception;
   /*int bnoticeTot(bookNoticeVO vo);*/
   

}