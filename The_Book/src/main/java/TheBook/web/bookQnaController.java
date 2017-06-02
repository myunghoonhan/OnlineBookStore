package TheBook.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;




import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import TheBook.service.bookQnaService;
import TheBook.service.bookQnaVO;




@Controller
public class bookQnaController {
   
   @Resource(name = "bookQnaService")
   private bookQnaService bookQnaService;
   
    /** EgovPropertyService_ 메세지 관련 */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "bqnaUnqService")
   private EgovIdGnrService bqnaUnqService;
    
   //qna선택시
   @RequestMapping(value = "/bookgogekQnaList.do")
   public String qna(@ModelAttribute("bqnaVO") bookQnaVO vo, ModelMap model) throws Exception{
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

      List<?> bqnaList = bookQnaService.selectbqnaList(vo);
      model.addAttribute("bqnaVO", bqnaList);

      int totCnt = bookQnaService.bqnaTot(vo);

      paginationInfo.setTotalRecordCount(totCnt);
      model.addAttribute("paginationInfo", paginationInfo);

      return "TheBook/bookgogekQnaList";
   }
   
   //qna 입력
   @RequestMapping(value = "/bookgogekQnaform.do")
   public String qnainform(@ModelAttribute("bqnaVO") bookQnaVO vo) throws Exception{      
      
	   return "TheBook/bookgogekQnaInsert";
   }
   
   @RequestMapping(value = "/bookgogekQnaInsert.do")
   @ResponseBody public Map<String, Object> qnain(HttpServletRequest request,
         HttpServletResponse response, bookQnaVO vo) throws Exception {
      
	 //session에 할당된 id 받아오기
	  String qnaid = (String) request.getSession().getAttribute("session_memid");
	   
      Map<String, Object> map = new HashMap<String, Object>();
      String result = "";

      int cnt = bqnaUnqService.getNextIntegerId();
      vo.setQnaunq(cnt);
      vo.setQnaid(qnaid);

      result = bookQnaService.insertQna(vo);
      
      if (result == null) result = "ok";
      map.put("result", result);

      return map;
   }
   
   //qna상세페이지
   @RequestMapping(value = "/bookgogekQnaDetail.do")
   public String qnade(bookQnaVO vo,ModelMap model)throws Exception{
      
      String qnaunq = Integer.toString(vo.getQnaunq());
      

      vo = bookQnaService.selectqna(qnaunq);

      model.addAttribute("qnadetail",vo);
      
      bookQnaService.updateQnaHit(qnaunq);
      return "TheBook/bookgogekQnaDetail";
   }
   
   //qna 글수정
   @RequestMapping(value = "/bookgogekQnaUpdate.do")
   public String qnaup(bookQnaVO vo,ModelMap model)throws Exception{
         System.out.println("111111111");
         String qnaunq = Integer.toString(vo.getQnaunq());
         System.out.println("g"+qnaunq);

         vo = bookQnaService.selectqna(qnaunq);

         model.addAttribute("qnadetail",vo);
         
         //bookQnaService.updateQnaHit(qnaunq);
         System.out.println("controller=============");
         
      return "TheBook/bookgogekQnaUpdate";
   }
   @RequestMapping(value = "/bookgogekQnaModify.do")
   public  @ResponseBody Map<String, Object> qnaup(HttpServletRequest request,
         HttpServletResponse response, bookQnaVO vo) throws Exception {
     
     System.out.println(vo.getQnaunq());
     
      Map<String, Object> map = new HashMap<String, Object>();
      int result = 0;
      
      result = bookQnaService.updateQna(vo);
      map.put("result", result);
      
      return map;
   }
   
   //qna답글쓰기
   
   @RequestMapping(value = "/qnareWrite.do")
   public String qnaReplyWrite(@ModelAttribute("bqnaVO") bookQnaVO vo) throws Exception{
      
      return "TheBook/bookgogekQnaReInsert";
   }
   
   @RequestMapping(value = "/bookgogekQnaReInsert.do")
   @ResponseBody public Map<String, Object> qnare(HttpServletRequest request, HttpServletResponse response, bookQnaVO vo) throws Exception {
   
	// session에 할당된 id 받아오기
	String qnaid = (String) request.getSession().getAttribute("session_memid");

	String qnaunq = Integer.toString(vo.getQnaunq());

   bookQnaVO voNew = bookQnaService.selectQnaMaxThread(qnaunq);
   System.out.println("controller========"+voNew.getQnathread());
   
   String myThread = null;
   
   if(voNew.getQnathread() == null){
   voNew = bookQnaService.selectQnaDetail(qnaunq);
   myThread = voNew.getQnathread() + "a";
   }else{
   String test = voNew.getQnathread();
   String testF = test.substring(0, test.length()-1);
   char testL = test.charAt(test.length()-1);
   
   char testL2 = ++testL;
   myThread = testF + testL2;
   }
   
   vo.setQnafid(voNew.getQnafid());
   vo.setQnathread(myThread);
   vo.setQnaid(qnaid);
   
   System.out.println("c============="+myThread);
   
   Map<String, Object> map = new HashMap<String, Object>();
   String result = "";
   
   int cnt = bqnaUnqService.getNextIntegerId();
   vo.setQnaunq(cnt);
   
   result = bookQnaService.insertQnaReply(vo);
   System.out.println("c2============="+cnt);
   if(result == null) result = "ok";
   map.put("result", result);
   
   return map;
   }
   
   @RequestMapping(value = "/bookgogekQnaDelete.do", method = RequestMethod.POST)
   @ResponseBody public Map<String, Object> deleteQna (
               HttpServletRequest request, 
               HttpServletResponse response, 
               bookQnaVO vo) throws Exception {

      Map<String, Object> map = new HashMap<String, Object>();
      int result = 0;
      
      String qnaunq = Integer.toString(vo.getQnaunq());
      
      int cnt = bookQnaService.selectQnaThreadCnt(qnaunq);
      
      System.out.println("답글개수 : " + cnt);

      if(cnt > 0) {
         result = bookQnaService.updateQnaClear(qnaunq);
      } else {
         result = bookQnaService.deleteQna(qnaunq);
      }
      map.put("result", result);
      return map;
   }
   
   @RequestMapping(value ="/bookQnaPwdCheck.do")
   @ResponseBody public Map<String, Object> bookQnaPwdCheck( HttpServletRequest request, HttpServletResponse response, 
           													bookQnaVO vo) throws Exception {
	   	   
	   String memid = (String) request.getSession().getAttribute("session_memid");
	   vo.setQnaid(memid);
	   
	   int result = bookQnaService.bookQnaPwdCheck(vo);
	   
	   Map<String, Object> map = new HashMap<String, Object>();	   
	   map.put("result", result);
	   return map;
   }
   
   
   

   
}