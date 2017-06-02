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

	<jsp:include page="header2.jsp">
		<jsp:param value="navbar-fixed-top" name="navbar_style" />
	</jsp:include>
	
	<main>
		<div class="container">
	       	<div class="row">
	       		<div class="col-xs-3">
					<a href="main.do"><img src="/images/thebooklogo2.jpg" class="img-responsive" alt="Responsive image"></a>
		    	</div>
		    </div>
		   
		    <div class="row">
				<div class="col-xs-12">
					<nav class="navbar navbar-default">
					  <div class="container-fluid">
					    <!-- Brand and toggle get grouped for better mobile display -->
					    <div class="navbar-header">
					      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					      </button>
					      <a class="navbar-brand" style="font-size: 30px;" href="/bookStoreInfo.do?storeunq=${selectVO.storeunq}">The Book ${selectVO.storename }</a>
					    </div>
					
					    <!-- Collect the nav links, forms, and other content for toggling -->
					    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					      <ul class="nav navbar-nav">
					     	<li class=""><a href="/bookStoreInfo.do?storeunq=${selectVO.storeunq}">기본정보</a></li>
					        <li class=""><a href="/bookStoreNotice.do?storeunq=${bookStoreVO.storeunq}">공지사항</a></li>
					        <li class=""><a href="/bookStoreMap.do?storeunq=${bookStoreVO.storeunq}">약도/주차</a></li>
					        <li class="active"><a href="/bookStoreInfoMap.do?storeunq=${bookStoreVO.storeunq}">안내도</a></li>
					      </ul>
					    </div><!-- /.navbar-collapse -->
					  </div><!-- /.container-fluid -->
					</nav>
		    	</div>
			</div>
			<center>
			<div class="row" style="margin-bottom: 20px;">
			 	<div class="col-xs-12">
			 		<img src="/images/storeinfo/${selectVO.storeinfo2}" class="img-responsive" alt="Responsive image">
				</div>
		   </div>
		   </center>
		   
		</div><!-- end container  -->
	</main>
	
	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
