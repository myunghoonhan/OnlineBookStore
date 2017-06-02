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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function(){
    $(".contents").each(function(i){
       $(this).hide();
    });
 });

function fn_close(unq){
 $("#contents"+unq).hide();   
}

function fn_click(unq){
 $("#contents"+unq).show();
}

</script>
<body style="display: block;  padding-top: 51px;">

   <jsp:include page="header.jsp">
      <jsp:param value="navbar-fixed-top" name="navbar_style" />
   </jsp:include>
   
   <main>      
      <div class="container">
               
         
             
             <div class="row" style="margin-top: 20px;">
            <div class="col-xs-12">
               <ul class="nav nav-tabs nav-justified">
                 <li role="presentation" class="active"><a href="/bookgogekNotice.do"><h4>공지사항</h4></a></li>
                 <li role="presentation" class=""><a href="bookgogekQnaList.do"><h4>Q & A</h4></a></li>
               </ul>
               
               <table class="table table-hover table-bordered" style="margin: 0px;">
                   <thead>
                     <tr>
                       <th width="100" style="text-align: center; vertical-align:middle;">번호</th>
                       <th style="text-align: center; vertical-align:middle;">제목</th>
                       <th width="300" style="text-align: center; vertical-align:middle;">날짜</th>
                       <th width="100" style="text-align: center; vertical-align:middle;">조회수</th>
                     </tr>
                   </thead>
                   
                   <form name="booknoticelist" id="booknoticelist">
                   <c:forEach var="bnotice" items="${bnoticeVO}" varStatus="status">
                      <tr id="${bnotice.booknoticeunq}" name="bnoticelist" onClick="fn_click(${bnotice.booknoticeunq})">
                             <td style="text-align: center; vertical-align: middle;">${bnotice.booknoticeunq}</td>
                         <td style="vertical-align: middle;">${bnotice.booknoticetitle}</td>
                        <td style="text-align: center; vertical-align: middle;">${bnotice.booknoticeregdate}</td>
                        <td style="text-align: center; vertical-align: middle;">${bnotice.booknoticehit}</td>
                     </tr>
                      <tr>
                         <td id="contents${bnotice.booknoticeunq}" class="contents" colspan="4" style="vertical-align: middle; padding: 30px;">${bnotice.booknoticecontent}                         
                                 
                                 <br><br>
                                 <input type="button" class="btn btn-success btn-xs" style="float: right;" onClick="fn_close(${bnotice.booknoticeunq})" value="닫기"/>
                         </td>
                      </tr>
                      <input type="hidden" name="bnoticeunq" id="bnoticeunq" value="${bnotice.booknoticeunq}"/>
                      </c:forEach>                      
                      </form>
                   </table>
                   
            <br><br>
            <div class="row" align="center">
             <div class="col-xs-4 col-md-offset-4">
               <div class="input-group">
                  <div class="input-group-btn">
                  <select class="form-control" style="width: 90px; display: inline;">
                    <option>제목</option>
                    <option>내용</option>
                 </select>
                  </div><!-- /btn-group -->
                  <input type="text" class="form-control" aria-label="...">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="button">검색</button>
                  </span>
                </div><!-- /input-group -->
             </div><!-- /.col-lg-6 -->
          </div>
            
             </div>
         </div>
         

      </div><!-- end container  -->
   </main>
   
   <jsp:include page="sidebar.jsp"></jsp:include>
   <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>