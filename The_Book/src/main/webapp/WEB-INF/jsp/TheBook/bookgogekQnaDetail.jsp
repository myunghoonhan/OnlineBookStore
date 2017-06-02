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
<script>

 function fn_goupdate(){
    document.frm.action = "<c:url value='/bookgogekQnaUpdate.do' />";
     document.frm.submit();
}   
 function fn_delete() {
   
   var form = {};
   form.qnaunq = $("#qnaunq").val();
   if(confirm("삭제하시겠습니까?")) {
      $.ajax({
         type: 'POST',
         data: form,
         url: "/bookgogekQnaDelete.do",
         
         success: function(data) {
            if(data.result > 0) {
               
               alert("삭제하였습니다.");
               location.href = "<c:url value="/bookgogekQnaList.do"/>";
            } else {
               alert("삭제에 실패했습니다. 다시 시도해 주세요.");
            }
         },
         error: function () {
            alert("오류발생 ");
         }
      }); 
   }
   
} 

	function fn_re() {
	
	var f = document.frm;
	
	url = "/qnareWrite.do";
	
	f.method = "post";
	f.action = url;
	f.submit();
}

   

   
   
</script>
<body style="display: block;  padding-top: 51px;">

   <jsp:include page="header.jsp">
      <jsp:param value="navbar-fixed-top" name="navbar_style" />
   </jsp:include>
   
   <main>
      
      <div class="container">
         <div class="row">
            <div class="col-xs-12" >
               <h1>Q&A-게시글</h1>
               <form name="frm" id="frm" method="post">
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
                        <td width="180" colspan="3" name="qtitle" id="qtitle">${qnadetail.qnatitle}</td>
                        <td width="120">작성자</td>
                        <td width="180" name="qwriter" id="qwriter">${qnadetail.qnaid}</td>
                     </tr>
                     <tr height="40">
                        <td width="120" style="vertical-align: middle;">게시글</td>
                        <td colspan="5"><div class="well well-lg" style="margin-bottom: 0px" name="qcontent" id="qcontent">${qnadetail.qnacontent}</div></td>
                     </tr>
                  </tbody>
               </table>
               <input type="hidden" name="qnaunq" id="qnaunq" value="${qnadetail.qnaunq}">
            </form>
            </div>
         </div><!-- end row  -->
         
         <div class="row">
            <center>
                  <button type="button" class="btn btn-danger" onclick="fn_re()">답글쓰기</button>
                  <button type="button" class="btn btn-danger" onclick="fn_goupdate()">수정</button>
                  <button type="button" class="btn btn-danger" onclick="fn_delete()">삭제</button>
               <button type="button" class="btn btn-danger" onclick="location.href='/bookgogekQnaList.do'">전체글보기</button>
            </center>
         </div>
      </div><!-- end container  -->

   </main>
   
   <jsp:include page="sidebar.jsp"></jsp:include>
   <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>