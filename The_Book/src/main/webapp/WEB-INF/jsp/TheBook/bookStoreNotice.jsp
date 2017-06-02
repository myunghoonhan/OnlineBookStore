<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>

</head>
<script type="Text/JavaScript">

	$(document).ready(function(){
	      $("#contents").each(function(i){
	         $(this).hide();
	      });
	   });
   
   function fn_close(unq){
		$("#contents"+unq).hide();	
   }
   
   function fn_click(unq){
		$("#contents"+unq).show();
	}
   
   fn_storeselect(){
	   
   }
   
</script>


<body style="display: block; padding-top: 51px;">

	<jsp:include page="header2.jsp">
		<jsp:param value="navbar-fixed-top" name="navbar_style" />
	</jsp:include>

	<main>
	<div class="container">
		<div class="row">
			<div class="col-xs-3">
				<a href="main.do"><img src="/images/thebooklogo2.jpg" class="img-responsive"	alt="Responsive image"></a>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-12">
				<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" style="font-size: 30px;" href="/bookStoreInfo.do?storeunq=${storeunq}">The Book ${selectVO.storename }</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class=""><a href="/bookStoreInfo.do?storeunq=${storeunq}">기본정보</a></li>
							<li class="active"><a href="/bookStoreNotice.do?storeunq=${storeunq}">공지사항</a></li>
							<li><a href="/bookStoreMap.do?storeunq=${storeunq}">약도/주차</a></li>
							<li><a href="/bookStoreInfoMap.do?storeunq=${storeunq}">안내도</a></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid --> </nav>
			</div>
		</div>
<!-- 
		<div class="row" align="right" style="margin-bottom: 10px;">
			<div class="col-xs-4 col-md-offset-8">
				<div class="input-group">
					<div class="input-group-btn">
						<select class="form-control" style="width: 90px; display: inline;">
							<option value="1">본점</option>
							<option value="2">강남점</option>
							<option value="3">디큐브시티점</option>
							<option value="4">수유점</option>
							<option value="5">잠실점</option>
						</select>
							/input-group
				<span class="input-group-btn">
							<input type="button" class="btn btn-default" onClick="fn_storeselect()">선택</button>
						</span>				
					</div>
					/btn-group
					<input type="text" class="form-control" aria-label="...">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button" onClick="fn_storeselect()">선택</button>
					</span>
				</div>
				
			</div>
			/.col-lg-6
		</div>
 -->
		<div class="row" align="center" style="margin-bottom: 20px;">
			<div class="col-xs-12">


				<table class="table table-hover table-bordered" style="margin: 0px;">
					<thead>
						<tr>
							<th width="100"
								style="text-align: center; vertical-align: middle;">번호</th>
							<th width="170"
								style="text-align: center; vertical-align: middle;">영업점</th>
							<th style="text-align: center; vertical-align: middle;">제목</th>
							<th width="200"
								style="text-align: center; vertical-align: middle;">장소</th>
							<th width="200"
								style="text-align: center; vertical-align: middle;">기간</th>
						</tr>
					</thead>

					<!-- <tbody> -->
					<form name="noticelist" id="noticelist">
						<c:forEach var="result" items="${snoticeVO}" varStatus="status">
							<tr id="${result.storenoticeunq}" onClick="fn_click(${result.storenoticeunq})">
								<td style="text-align: center; vertical-align: middle;">${paginationInfo.totalRecordCount - (result.pageIndex * result.pageSize + status.count)+4}</td>
								<td style="vertical-align: middle;">${result.storenoticestore}</td>
								<td style="text-align: center; vertical-align: middle;">${result.storenoticetitle}</td>
								<td style="text-align: center; vertical-align: middle;">${result.storenoticeroom}</td>
								<td style="text-align: center; vertical-align: middle;">${result.storenoticeing}</td>
							</tr>
							<tr id="contents">
								<td id="contents${result.storenoticeunq}" colspan="5" style="vertical-align: middle; padding: 30px;">${result.storenoticecontent}
									<input type="button" class="btn btn-success btn-xs" style="float: right;" onClick="fn_close(${result.storenoticeunq})" value="닫기"/>
								</td>
							</tr>
							<input type="hidden" name="snoticeunq" id="snoticeunq" value="${result.storenoticeunq}"/>
						</c:forEach>
					</form>
					<!-- </tbody> -->

				</table>

				<nav style="text-align: center;">
				<ul class="pagination">
					<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
					<li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
					<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
				</ul>
				</nav>
			</div>
		</div>

	</div>
	<!-- end container  --> </main>

	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
