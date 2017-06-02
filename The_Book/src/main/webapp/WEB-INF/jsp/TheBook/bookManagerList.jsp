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
<link href='/css/styleCart.css' rel='stylesheet' type='text/css'><!--현주 장바구기관련 CSS  -->
</head>

	<jsp:include page="header.jsp">
		<jsp:param value="navbar-fixed-top" name="navbar_style" />
	</jsp:include>

<body style="display: block; padding-top: 51px;">


	<main>

	<div class="container">
		<figure>
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
					<img src="/images/main1.jpg" class="carousel_img" alt="..." style="margin: 0 auto;">
					<div class="carousel-caption"></div>
				</div>

				<div class="item">
					<img src="/images/main2.jpg" class="carousel_img" alt="..." style="margin: 0 auto;">
					<div class="carousel-caption"></div>
				</div>

				<div class="item">
					<img src="/images/main3.jpg" class="carousel_img" alt="..." style="margin: 0 auto;">
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
		</figure>


		<div id="index_thumbnail">
			<h3>
				베스트셀러<img src="/images/hot2.gif">
			</h3>
			<div class="row" style="margin: 0 auto;">
				<div class="product">
					<div class="make3D">
						<div class="product-front">
							<div class="shadow"></div>
							<img src="/images/harry2.jpg" alt="" />
							<div class="image_overlay"></div>
							<div class="add_to_cart">장바구니 담기</div>
							<div class="view_gallery">상세보기</div>
							<div class="stats">
								<div class="stats-container">
									<span class="product_price">12000원</span> <span class="product_name">해리포터</span>
									<p>[외국도서]</p>

									<div class="product-options">
										<strong>책 정보</strong> <span>해리포터는 아주 재미있는 책이다</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="product">
					<div class="make3D">
						<div class="product-front">
							<div class="shadow"></div>
							<img src="/images/harry.jpg" alt="" />
							<div class="image_overlay"></div>
							<div class="add_to_cart">장바구니 담기</div>
							<div class="view_gallery">상세보기</div>
							<div class="stats">
								<div class="stats-container">
									<span class="product_price">12000원</span> <span class="product_name">해리포터</span>
									<p>[외국도서]</p>

									<div class="product-options">
										<strong>책 정보</strong> <span>해리포터는 아주 재미있는 책이다</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="product">
					<div class="make3D">
						<div class="product-front">
							<div class="shadow"></div>
							<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1.jpg" alt="" />
							<div class="image_overlay"></div>
							<div class="add_to_cart">장바구니 담기</div>
							<div class="view_gallery">상세보기</div>
							<div class="stats">
								<div class="stats-container">
									<span class="product_price">12000원</span> <span class="product_name">해리포터</span>
									<p>[외국도서]</p>

									<div class="product-options">
										<strong>책 정보</strong> <span>해리포터는 아주 재미있는 책이다</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="product">
					<div class="make3D">
						<div class="product-front">
							<div class="shadow"></div>
							<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1.jpg" alt="" />
							<div class="image_overlay"></div>
							<div class="add_to_cart">장바구니 담기</div>
							<div class="view_gallery">상세보기</div>
							<div class="stats">
								<div class="stats-container">
									<span class="product_price">12000원</span> <span class="product_name">해리포터</span>
									<p>[외국도서]</p>

									<div class="product-options">
										<strong>책 정보</strong> <span>해리포터는 아주 재미있는 책이다</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end div row table  -->
		</div>
		<!-- div id="index_thumbnail" -->

		<div id="index_thumbnail">
			<h3>화제의 신간<img src="/images/hot2.gif"></h3>
			<div class="row">
				<!-- table  -->
				<c:forEach var="bean" items="${top4}">
					<div class="col-xs-6 col-sm-3">
						<a href="TicketInfo.do?sno=${bean.sno}" class="thumbnail" style="text-decoration: none; text-align: center; padding: 40px 40px 20px 40px;">
							<img src="/images/poster/${bean.smainimg }" alt="..." style="margin-bottom: 10px;">
							<font size="2">[${bean.slocation}]</font>
							<br>
							<font size="3">${bean.sname}</font>
						</a>
					</div>
				</c:forEach>
			</div>
			<!-- end div row table  -->
		</div>
		<!-- div id="index_thumbnail" -->

		<div id="index_thumbnail">
			<h3>클릭! 실시간 추천<img src="/images/hot2.gif"></h3>
			<div class="row">
				<!-- table  -->
				<c:forEach var="bean" items="${top4}">
					<div class="col-xs-6 col-sm-3">
						<a href="TicketInfo.do?sno=${bean.sno}" class="thumbnail" style="text-decoration: none; text-align: center; padding: 40px 40px 20px 40px;">
							<img src="/images/poster/${bean.smainimg }" alt="..." style="margin-bottom: 10px;">
							<font size="2">[${bean.slocation}]</font>
							<br>
							<font size="3">${bean.sname}</font>
						</a>
					</div>
				</c:forEach>
			</div>
			<!-- end div row table  -->
		</div>
		<!-- div id="index_thumbnail" -->

	</div>
	
	
	
	<div class="list-group">
  
  <button type="button" class="list-group-item list-group-item-action active">
    HOME
  </button>
  <button type="button" class="list-group-item list-group-item-action">▶ 본사관리</button>
  <button type="button" class="list-group-item list-group-item-action">▶ 영업점관리</button>
  <button type="button" class="list-group-item list-group-item-action">▶ 배송관리</button>
  <button type="button" class="list-group-item list-group-item-action">▶ 상품관리</button>
  <button type="button" class="list-group-item list-group-item-action">▶ 게시판관리</button>
  
</div>
	</main>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script><!--현주 장바구니 JS-->
	<script language="javascript" src="/js/scriptCart.js"></script><!--현주 장바구니 JS-->

</body>

	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>

</html>
















<%-- 


<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
</head>

<body style="display: block; padding-top: 51px;">

	<jsp:include page="header.jsp">
		<jsp:param value="navbar-fixed-top" name="navbar_style" />
	</jsp:include>

	<main>
	<div class="container">
		<div class="row">
			<div class="col-xs-2">
				
				
				<div class="list-group">
  
			  <button type="button" class="list-group-item list-group-item-action active">
			    HOME
			  </button>
			  <button type="button" class="list-group-item list-group-item-action">▶ 본사관리</button>
			  <button type="button" class="list-group-item list-group-item-action">▶ 영업점관리</button>
			  <button type="button" class="list-group-item list-group-item-action">▶ 배송관리</button>
			  <button type="button" class="list-group-item list-group-item-action">▶ 상품관리</button>
			  <button type="button" class="list-group-item list-group-item-action">▶ 게시판관리</button>
			  
			</div>
			</div>

			<div class="col-xs-9">
				<div class="row">
					<div class="col-xs-12">
					<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
					</button> <a class="navbar-brand" href="#">Brand</a>
				</div>
				
				<div class="dropdown show">
  

  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    <a class="dropdown-item" href="#">Action</a>
    <a class="dropdown-item" href="#">Another action</a>
    <a class="dropdown-item" href="#">Something else here</a>
  </div>
</div>
			
						
						
						
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" />
						</div> 
						<button type="submit" class="btn btn-default">
							Submit
						</button>
					</form>
					
				</div>
				
			</nav>
		</div>
	</div>
</div>
					
					
					
					
					
						<h2 style="margin: 0px 0px 30px 0px;">
							<font style="color: blue; font-weight: bold;">심수민</font><font style="font-size: 20px;">님 (일반등급) 적립금: <font style="color: blue; font-weight: bold;">200P</font></font>
						</h2>
						<h3 style="margin: 0px;">나의 최근 주문현황</h3>
						<table class="table" style="border-bottom: 1px solid #eee; margin: 10px 0px 30px 0px;">
							<tr>
								<td style="text-align: center; vertical-align: middle; width: 100px; padding: 2px 8px;">
									결제완료(1)<br> <img src="/images/ship_card.png" class="img-responsive" alt="Responsive image" style="margin: 0 auto;">
								</td>
								<td style="text-align: center; vertical-align: middle; width: 150px; padding: 2px 8px;">
									<img src="/images/ship_arrow.png" class="img-responsive" alt="Responsive image" style="margin: 0 auto; padding: 0px 40px;">
								</td>
								<td style="text-align: center; vertical-align: middle; width: 110px; padding: 2px 8px;">
									상품준비중(1)<br> <img src="/images/ship_box.png" class="img-responsive" alt="Responsive image" style="margin: 0 auto;">
								</td>
								<td style="text-align: center; vertical-align: middle; width: 150px; padding: 2px 8px;">
									<img src="/images/ship_arrow.png" class="img-responsive" alt="Responsive image" style="margin: 0 auto; padding: 0px 40px;">
								</td>
								<td style="text-align: center; vertical-align: middle; width: 100px; padding: 2px 8px;">
									배송중(1)<br> <img src="/images/ship_truck.png" class="img-responsive" alt="Responsive image" style="margin: 0 auto;">
								</td>
								<td style="text-align: center; vertical-align: middle; width: 150px; padding: 2px 8px;">
									<img src="/images/ship_arrow.png" class="img-responsive" alt="Responsive image" style="margin: 0 auto; padding: 0px 40px;">
								</td>
								<td style="text-align: center; vertical-align: middle; width: 100px; padding: 2px 8px;">
									배송완료(1)<br> <img src="/images/ship_arrive.png" class="img-responsive" alt="Responsive image" style="margin: 0 auto;">
								</td>
							</tr>
						</table>
					</div>
					<!-- col-xs-12 -->
				</div>
				<!-- 나의 최근 주문현황 row -->

				<div class="row">
					<div class="col-xs-12">
						<h3 style="margin: 0px;">주문번호</h3>
						<br>
						<table class="table table-hover table-bordered" style="margin-bottom: 0px;">
							<thead>
								<tr>
									<th width="50px;" style="text-align: center; vertical-align: middle;"></th>
									<th width="80px" style="text-align: center; vertical-align: middle;">주문번호</th>
									<th style="text-align: center; vertical-align: middle;">상품정보</th>
									<th width="50x" style="text-align: center; vertical-align: middle;">수량</th>
									<th width="80px" style="text-align: center; vertical-align: middle;">주문금액</th>
									<th width="150px" style="text-align: center; vertical-align: middle;">주문상태</th>
									<th width="100px" style="text-align: center; vertical-align: middle;">주문변경</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td style="text-align: center; vertical-align: middle;">
										<div class="checkbox">
											<label> <input type="checkbox" id="blankCheckbox" value="option1" aria-label="...">
											</label>
										</div>
									</td>
									<td style="text-align: center; vertical-align: middle;">1</td>
									<td style="vertical-align: middle;">
										<a href="#">해리포터</a>
									</td>
									<td style="text-align: center; vertical-align: middle;">2</td>
									<td style="text-align: center; vertical-align: middle;">50,000원</td>
									<td style="text-align: center; vertical-align: middle;">결제완료</td>
									<td style="text-align: center; vertical-align: middle;">
										<button type="button" class="btn btn-danger btn-xs" style="margin-bottom: 5px;">구매확정</button>
										<button type="button" class="btn btn-success btn-xs">구매취소</button>
									</td>
								</tr>
							</tbody>
						</table>
						<nav style="text-align: center;">
						<ul class="pagination">
							<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
							<li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
							<!-- <li><a href="#">2</a></li>
							    <li><a href="#">3</a></li>
							    <li><a href="#">4</a></li>
							    <li><a href="#">5</a></li>
							    <li><a href="#">6</a></li>
							    <li><a href="#">7</a></li>
							    <li><a href="#">8</a></li>
							    <li><a href="#">9</a></li>
							    <li><a href="#">10</a></li> -->
							<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</ul>
						</nav>
					</div>
					<!-- col-xs-12 -->
				</div>
				<!-- 주문내역 row -->

				<div class="row">
					<div class="col-xs-12">
						<h3 style="margin: 0px;">관심작가</h3>
						<br>
						<table class="table table-hover table-bordered" style="margin-bottom: 30px;">
							<thead>
								<tr>
									<th style="text-align: center; vertical-align: middle;">저자</th>
									<th style="text-align: center; vertical-align: middle;">책이름</th>
									<th style="text-align: center; vertical-align: middle;">책정보</th>
									<th width="80px" style="text-align: center; vertical-align: middle;">가격</th>
									<th style="text-align: center; vertical-align: middle;">출판사</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td style="text-align: center; vertical-align: middle;">
										<a href="#">한명훈</a>
									</td>
									<td style="vertical-align: middle;">해리포터</td>
									<td style="vertical-align: middle;">이것은 책이고 책이다. 이책 좋고 좋다.</td>
									<td style="text-align: center; vertical-align: middle;">50,000원</td>
									<td style="text-align: center; vertical-align: middle;">금성출판사</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- col-xs-12 -->
				</div>
				<!-- 관심작가 row -->

				<div class="row">
					<div class="col-xs-12">
						<h3 style="margin: 0px;">주문 배송안내</h3>
						<br> <img src="/images/main1.jpg" class="img-responsive" alt="Responsive image" style="margin: 0 auto;">
					</div>
					<!-- col-xs-12 -->
				</div>
				<!-- 주문배송안내 row -->

			</div>
			<!-- col-xs-9 -->
		</div>
		<!-- row -->
	</div>
	<!-- end container  --> </main>

	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
 --%>
