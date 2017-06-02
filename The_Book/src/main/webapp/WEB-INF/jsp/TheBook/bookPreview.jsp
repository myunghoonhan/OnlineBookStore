<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>
</head>

<body>


	<main>
		<div class="container-fluid">
			<div class="row">
				
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="background-color: #e5e5e5">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>
		
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
		
						<div class="item active">
							<img src="/images/poster/${bookPreview.bopreview1}" class="carousel_img" alt="..." style="margin: 0 auto;">
							<div class="carousel-caption"></div>
						</div>
		
						<div class="item">
							<img src="/images/poster/${bookPreview.bopreview2}" class="carousel_img" alt="..." style="margin: 0 auto;">
							<div class="carousel-caption"></div>
						</div>
		
						<div class="item">
							<img src="/images/poster/${bookPreview.bopreview3}" class="carousel_img" alt="..." style="margin: 0 auto;">
							<div class="carousel-caption"></div>
						</div>
		
					</div>
		
					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
				
			</div>
		</div>
	</main>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script><!-- Bootstrap jQuery -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script><!-- Bootstrap JS -->
</body>
</html>
