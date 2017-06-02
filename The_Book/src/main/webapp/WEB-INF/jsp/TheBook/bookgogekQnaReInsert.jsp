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
  
  <main>
    <script type="text/javascript">
    	$(function() {
    		$("#title").focus();
    		
    	});

    	function send_finish() {

    		if ($("#title").val() == "") {
    			alert("제목을 입력해주세요.");
    			return;
    		}
    		if ($("#pwd").val() == "") {
    			alert("비밀번호를 입력해주세요.");
    			return;
    		}
    		
    		var form = {};
    		form.qnaunq=$("#qnaunq").val();
    		form.qnatitle = $("#title").val();
    		form.qnapwd = $("#pwd").val();
    		form.qnacontent = $("#contents").val();
    		
    		if (confirm("저장하시겠습니까?")) {

    			$.ajax({
    				type : 'POST',
    				data : form,
    				url : "/bookgogekQnaReInsert.do",
    				//여기까지는 전송 전 상태

    				success : function(data) {
    					if (data.result == "ok") {
    						alert("저장하였습니다.");
    						//fn_test();
    						location.href = "<c:url value="/bookgogekQnaList.do"/>";
    					} else {
    						alert("저장 실패했습니다. 다시 시도해 주세요.");
    					}
    				},
    				error : function() {
    					alert("오류발생 ");
    				}
    			});
    		}
    	}
     </script>
     <div class="container">
     <form method="post" name="writeform">
     <input type="hidden" name="qnaunq" id="qnaunq" value="${bqnaVO.qnaunq }" />
         <div class="row">
            <div class="col-xs-12">
         
               <h1>Q&A- 답글 작성하기</h1>
               
                  <table class="table table-bordered">
                     <thead>
                     </thead>
                     <tbody>
                        <tr>
                           <td width="80">제목</td>
                           <td><input type="text" name="title" id="title" class="form-control" placeholder="[답글]제목을 입력하세요."></td>
                        </tr>
                        <tr height="40">
                           <td width="80">글 비밀번호</td>
                           <td><input type="password" name="pwd" id="pwd" class="form-control" placeholder="비밀번호를 입력하세요." style="width: 13em;"></td>
                        </tr>
                        <tr height="40">
                           <td width="120" style="vertical-align: middle;">답글내용</td>
                           <td>
                              <textarea class="form-control" rows="7" style="resize: none" name="contents" id="contents"></textarea>
                              <input type="hidden" name="qthread" value="${bqnaVO.qnathread}">
                              
                           </td>
                        </tr>
                     </tbody>
                  </table>
               
               
            </div>
         </div><!-- end row  -->
         
         <div class="row">
            <center>
               <button type="button" class="btn btn-danger btn-lg" onclick="send_finish()">작성하기</button>
            </center>
         </div>
         </form>
      </div><!-- end container  -->
  </main>
  
  <jsp:include page="sidebar.jsp"></jsp:include>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>