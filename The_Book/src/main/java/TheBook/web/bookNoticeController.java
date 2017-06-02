package TheBook.web;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import TheBook.service.bookNoticeService;
import TheBook.service.bookNoticeVO;
import TheBook.service.bookQnaVO;




@Controller
public class bookNoticeController {
   
   @Resource(name = "noticeService")
   private bookNoticeService noticeService;
   
    /** EgovPropertyService_ 메세지 관련 */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    // 기존에 전자정부 프레임워크 내에 존재하는 시퀀스 서비스
    // 사용을 위해서는 context-idgen.xml에 가서 설정을 해줘야한다.
    @Resource(name = "bnoticeUnqService")
    private EgovIdGnrService bnoticeUnqService;
    
    
   //고객센터 메인
   @RequestMapping(value = "/bookgogekNotice.do")
   public String notice(@ModelAttribute("bnoticeVO") bookNoticeVO vo, ModelMap model) throws Exception{
      // context-properties.xml에 값이 저장되어 있음
            // ctrl + shift + r 선택해서 파일을 찾을 수 있음
            /** EgovPropertyService.sample */
            vo.setPageUnit(propertiesService.getInt("pageUnit"));
            vo.setPageSize(propertiesService.getInt("pageSize"));

            /** pageing setting */
            PaginationInfo paginationInfo = new PaginationInfo();
            paginationInfo.setCurrentPageNo(vo.getPageIndex());
            paginationInfo.setRecordCountPerPage(vo.getPageUnit());
            paginationInfo.setPageSize(vo.getPageSize());

            vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
            vo.setLastIndex(paginationInfo.getLastRecordIndex());
            vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

            List<?> bnoticeList = noticeService.selectbnoticeList(vo);
            model.addAttribute("bnoticeVO", bnoticeList);

            /*int totCnt = noticeService.bnoticeTot(vo);

            paginationInfo.setTotalRecordCount(totCnt);*/
            model.addAttribute("paginationInfo", paginationInfo);

      
      return "TheBook/bookgogekNotice";
   }
   

   
}