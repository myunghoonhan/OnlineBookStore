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

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
</head>
<script>

 var aa;

 function fn_egov_link_page(pageNo){
   document.qnalist.pageIndex.value = pageNo;
   document.qnalist.action = "<c:url value='/bookgogekQnaList.do'/>";
      document.qnalist.submit();
} 

function fn_qnasearch(){
   document.qnalist.action = "<c:url value='/bookgogekQnaList.do' />";
   document.qnalist.submit();
}

function fn_check(){
	
	var form = {};
	form.qnapwd = $("#qnapwd").val();
	form.qnaunq = aa;

	$.ajax({
		type : 'POST',
		data : form,
		url : "/bookQnaPwdCheck.do",

		success : function(data) {
			if (data.result > 0) {
				//alert("비밀번호가 일치합니다.");
				fn_detailSend();
				//location.href = "<c:url value="/bookgogekQnaDetail.do"/>";
			}else {
				alert("비밀번호가 일치하지 않습니다. 다시 시도해 주세요.");
			}
		},
		error : function() {
			alert("오류발생 ");
		}
	});
}

function fn_detailSend(){
	location.href="bookgogekQnaDetail.do?qnaunq=" + aa;
}


</script>
<body style="display: block;  padding-top: 51px;">
   <form:form name="qnalist" id="qnalist" method="post">
   <jsp:include page="header.jsp">
      <jsp:param value="navbar-fixed-top" name="navbar_style" />
   </jsp:include>
   
   <main>
      
      <div class="container">
             
             <div class="row" style="margin-top: 20px;">
            <div class="col-xs-12">
               <ul class="nav nav-tabs nav-justified">
                 <li role="presentation" class=""><a href="/bookgogekNotice.do"><h4>공지사항</h4></a></li>
                 <li role="presentation" class="active"><a href="/bookgogekQnaList.do"><h4>Q & A</h4></a></li>
               </ul>
               
                   <table class="table table-hover table-bordered">
                   <thead>
                     <tr>
                       <th width="100" style="text-align: center; vertical-align:middle;">번호</th>
                       <th style="text-align: center; vertical-align:middle;">글제목</th>
                       <th width="100" style="text-align: center; vertical-align:middle;">작성자</th>
                       <th width="100" style="text-align: center; vertical-align:middle;">날짜 </th>
                       <th width="100" style="text-align: center; vertical-align:middle;">조회수 </th>
                     </tr>
                   </thead>
                    <%--  onclick="location.href='/bookgogekQnaDetail.do?qnaunq=${bqna.qnaunq}'" --%>
                   <c:forEach var="bqna" items="${bqnaVO}" varStatus="status">
                   <c:set var="length" value="${fn:length(bqna.qnathread) }" />
                      <tr id="${bqna.qnaunq}" name="qnalist"  data-toggle="modal" data-target="#modalDetail" onclick="javascript:aa=${bqna.qnaunq};">
                      <%-- <input type="hidden" name="qnaunq" id="qnaunq" value="${bqna.qnaunq}"/> --%>
                             <td style="text-align: center; vertical-align: middle;">${paginationInfo.totalRecordCount - (bqna.pageIndex * bqna.pageSize + status.count)+4}</td>
                         <td style="vertical-align: middle;">
                        <c:forEach var="i" begin="2" end="${length }" step="1">
                     		&nbsp;&nbsp;&nbsp;
                  		</c:forEach>
                  <c:if test="${length > 1 }">└ [답글]</c:if>
                  <c:if test="${bqna.qnatitle == '삭제된 게시물입니다.' }">
                     ${bqna.qnatitle}
                  </c:if>
                  <c:if test="${bqna.qnatitle != '삭제된 게시물입니다.' }">
                     ${bqna.qnatitle}
                  </c:if>
                         </td>
                         <td style="text-align: center; vertical-align: middle;">${bqna.qnaid}</td>
                           <td style="text-align: center; vertical-align: middle;">${bqna.qnaregdate}</td>
                           <td style="text-align: center; vertical-align: middle;">${bqna.qnahit}</td>
                        </tr>
                      </c:forEach>     
                      </table>                 
          
          <div class="row" align="center">
             <div class="col-xs-4 col-md-offset-4">
               <div class="input-group">
                  <div class="input-group-btn">
                  <input type="hidden" name="selectqna"/>
                  <select class="form-control" style="width: 90px; display: inline;" name="srchCd" id="srchCd">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="writer">작성자</option>
                 </select>
                  </div><!-- /btn-group -->
                  <input type="text" class="form-control" aria-label="..." name="srchTxt" id="srchTxt" >
                  <span class="input-group-btn">
                    <input type="button" class="btn btn-default" onClick="fn_qnasearch()" value="검색"/>
                  </span>
                </div><!-- /input-group -->
              </div><!-- /.col-lg-6 -->
              <div class="row">
            <center>
            <input type="hidden" name="qid" id="qid" value="${bqna.qnaid }">
               <input type="button" class="btn btn-danger btn-lg" onClick="location.href='/bookgogekQnaform.do'" value="새글쓰기"/>
            </center>
         </div>
          </div>
          
         
      
   </div>
   
  
   <!-- end container  -->
   <div id="modalDetail" class="modal fade qnaupdate-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-sm">
      
            <form name="login" method="POST" action="bookgogekQnaDetail.do?qnaunq=${bqna.qnaunq}">
              <div class="form-group">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h5 class="modal-title" id="myModalLabel">게시글 비밀번호 확인</h5>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-sm-12" style="margin-bottom: 10px">
                        <h4>비밀번호를 입력하세요.</h4>
                      </div>
                      <div class="col-sm-12" style="margin-bottom: 10px">
                        <input type="password" name="qnapwd" id="qnapwd" class="form-control" placeholder="비밀번호" style="height: 50px">

                      </div>
                      <div class="col-sm-12">
                      <input type="hidden" name="qid" id="qid" value="${bqna.qnaid }">
                        <input type="button" class="btn btn-primary" style="height: 50px; width: 100%" onClick="fn_check()" value="입력"/>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </form>
      
          </div>
        </div>
   
  </main>
    
    </form:form>
    
<%--      <div id="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div> --%>
   <jsp:include page="sidebar.jsp"></jsp:include>
   <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>