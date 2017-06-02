package TheBook.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import TheBook.service.bookQnaVO;
import TheBook.service.bookStoreNoticeVO;
import TheBook.service.bookStoreService;
import TheBook.service.bookStoreVO;


@Controller
public class bookStoreController {
	
	@Resource(name = "storeService")
	private bookStoreService storeService;	
	
	   /** EgovPropertyService_ 메세지 관련 */
	   @Resource(name = "propertiesService")
	   protected EgovPropertyService propertiesService;

	   // 기존에 전자정부 프레임워크 내에 존재하는 시퀀스 서비스
	   // 사용을 위해서는 context-idgen.xml에 가서 설정을 해줘야한다.
	   @Resource(name = "snoticeUnqService")
	   private EgovIdGnrService snoticeUnqService;


	//영업점 안내 클릭 시(기본화면)
	@RequestMapping(value = "/bookStoreInfo.do")
	public String storeinfo(bookStoreVO vo,ModelMap model)throws Exception{
		
		String storeunq = vo.getStoreunq();
		

		vo = storeService.selectStore(storeunq);

		model.addAttribute("selectVO",vo);

		return "TheBook/bookStoreInfo";
	}
	
	   @RequestMapping(value = "/bookStoreNotice.do")
	   public String storen(@ModelAttribute("snoticeVO") bookStoreNoticeVO vo, bookStoreVO storevo, ModelMap model, HttpServletRequest request) throws Exception {

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

	      vo.setStorenoticestore(request.getParameter("storeunq"));
	      List<?> bookStoreNotice = storeService.snoticeList(vo);
	      model.addAttribute("snoticeVO", bookStoreNotice);

/*	      int totCnt = storeService.snoticeTot(vo);

	      paginationInfo.setTotalRecordCount(totCnt);*/
	      model.addAttribute("paginationInfo", paginationInfo);
	      
	      String storeunq = request.getParameter("storeunq");
	      
	      storevo = storeService.selectStore(storeunq);

		  model.addAttribute("selectVO",storevo);
	      
	      model.addAttribute("storeunq", storeunq);
	      
	      return "TheBook/bookStoreNotice";

	}
	
	//약도, 주차 클릭시
	@RequestMapping(value = "/bookStoreMap.do")
	public String storemap(bookStoreVO vo,ModelMap model)throws Exception{
		
		String storeunq = vo.getStoreunq();

	    vo = storeService.selectStore(storeunq);

	    model.addAttribute("selectVO",vo);
		
		return "TheBook/bookStoreMap";
	}
	
	   //안내도 클릭시
	   @RequestMapping(value = "/bookStoreInfoMap.do")
	   public String storeinfomap(bookStoreVO vo,ModelMap model)throws Exception{
	      
		  String storeunq = vo.getStoreunq();

	      vo = storeService.selectStore(storeunq);

	      model.addAttribute("selectVO",vo);
	      
	      return "TheBook/bookStoreInfoMap";
	   }
	

	
	
}
