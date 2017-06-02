<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
</head>

<body style="display: block;  padding-top: 51px;">

   <jsp:include page="header.jsp">
      <jsp:param value="navbar-fixed-top" name="navbar_style" />
   </jsp:include>
      
   <script type="text/javascript">
    function fn_update() {
         
/*          if($("#qtitle").val() == "") {
            alert("제목을 입력해주세요.");
            return;
         } */
         var form = {};        
         
         form.qnaunq=$("#qnaunq").val();
         form.qnatitle = $("#qtitle").val();
         form.qnacontent = $("#qcontent").val();

         if(confirm("수정하시겠습니까?")) {
            
            $.ajax({
               type: 'POST',
               data: form,
               url: "/bookgogekQnaModify.do",

               success: function(data) {
                  if(data.result > 0) {
                     alert("저장하였습니다.");
                     //location.href = "/bookgogekQnaDetail.do";
                     fn_test();
                  } else {
                     alert("저장 실패했습니다. 다시 시도해 주세요.");
                  }
               },
               error: function () {
                  alert("오류발생 ");
               }
            }); 
         }
      }  
/*    
   function send_finish(){
        document.writeform.submit();
   } */
   
   function fn_test(){
	   document.test.submit();
   }
   </script>

<%--    <c:if test="${msg ==2 }">
      <script type="text/javascript">
            alert("비밀번호가 틀렸습니다");
         </script>
   </c:if>
    --%>
   <main>
   <form method="post" name="writeform">
      <div class="container">
         <div class="row">
            <div class="col-xs-12" >
               <h1>Q&A-게시글 수정하기</h1>               
               
               <table class="table table-bordered">
                  <thead>
                  </thead>
                  <tbody>
                     <tr height="40">
                        <td width="120">글번호</td>
                        <td width="180">${qnadetail.qnaunq }</td>
                        <td width="120">작성일</td>
                        <td width="180" name="qregdate" id="qregdate">${qnadetail.qnaregdate}</td>
                        <td width="120">조회수</td>
                        <td width="180" name="qhit" id="qhit">${qnadetail.qnahit}</td>
                     </tr>
                     <tr height="40">
                        <td width="120">글제목</td>
                        <td width="180" colspan="3">
                        <input type="text" name="qtitle" id="qtitle" value="${qnadetail.qnatitle}"></td>
                        <td width="120">작성자</td>
                        <td width="180" name="qwriter" id="qwriter">${qnadetail.qnaid}</td>
                     </tr>
                     <tr height="40">
                        <td width="120" style="vertical-align: middle;">게시글</td>
                        <td colspan="5"><div class="well well-lg" style="margin-bottom: 0px">
                        <input type="text" name="qcontent" id="qcontent" value="${qnadetail.qnacontent}"></div></td>
                     </tr>
                  </tbody>
               </table>
               <input type="hidden" name="qnaunq" id="qnaunq" value="${qnadetail.qnaunq}">
            
            </div>
            
         </div><!-- end row  -->
         
         <div class="row">
            <center>
               <button type="button" class="btn btn-danger" onclick="fn_update()">수정완료</button>
               <button type="button" class="btn btn-danger" onclick="location.href='/bookgogekQnaDetail.do?qnaunq=${qnadetail.qnaunq}'">나가기</button>
            </center>
         </div>
      </div><!-- end container  -->
   </form>
   
            <form id="test" name="test" method="post" action="bookgogekQnaDetail.do">
            	<input type="hidden" name="qnaunq" id="qnaunq" value="${qnadetail.qnaunq}">
            </form>
            
   </main>

   <jsp:include page="sidebar.jsp"></jsp:include>
   <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>