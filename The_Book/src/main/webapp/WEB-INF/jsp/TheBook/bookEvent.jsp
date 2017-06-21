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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body style="display: block;  padding-top: 51px;">

	<jsp:include page="header.jsp">
		<jsp:param value="navbar-fixed-top" name="navbar_style" />
	</jsp:include>

	<main style="margin: -20px 0px -100px 0px;" >
		<div class="container-fluid" style="background-color: #ddf5f9">

		<div class="container">

			<div class="row">
				<div class="col-xs-12" style="margin-top: 50px; text-align: center;">
					<img src="/images/eventlogo.png" class="img-responsive"
						alt="Responsive image"
						style="margin: 0 auto; width: 500px; height: auto;">
					<h2>신규가입 시 포인트 적립과 다양한 혜택까지!</h2>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-12">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel" style="background-color: #e5e5e5">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">

							<div class="item active">
								<img src="/images/main4.jpg" class="carousel_img" alt="..."
									style="margin: 0 auto;">
								<div class="carousel-caption"></div>
							</div>

							<div class="item">
								<img src="/images/main5.jpg" class="carousel_img" alt="..."
									style="margin: 0 auto;">
								<div class="carousel-caption"></div>
							</div>

							<div class="item">
								<img src="/images/main6.jpg" class="carousel_img" alt="..."
									style="margin: 0 auto;">
								<div class="carousel-caption"></div>
							</div>

						</div>

						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic"
							role="button" data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"
							aria-hidden="true"></span> <span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-12" style="margin-top: 10px; text-align: center;">
					<div class="embed-responsive embed-responsive-16by9">
						<iframe class="embed-responsive-item"
							src="https://www.youtube.com/embed/3yRH9TgpLZU?amp;autoplay=1"
							frameborder="0" allowfullscreen></iframe>
					</div>
				</div>
			</div>

			<div class="row" style="padding-bottom: 100px;"></div>

		</div>
	</div>
	</main>

</body>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>


</html>
