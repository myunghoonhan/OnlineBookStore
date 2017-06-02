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
<script type="text/javascript">
	function fn_baguniAdd(bounq,boprice,boname){
		if($("#id").val() == ""){
  			alert('로그인 후 이용가능합니다.');
  			return;
  		}
		
		var form = {};
		
		form.bagunibookunq = bounq;
		form.baguniprice = boprice;
		form.bagunibookname = boname;
		
			$.ajax({
			
			type: 'POST',
			data: form,
			url: "/baguniAdd.do",
			
			success: function(data) {
				alert("장바구니에 등록되었습니다");
				fn_GetCartCnt();
			},	
			error: function () {
				alert(" 오류발생 ");
			}
		});
	}
	
	function fn_detail(bounq){
		var form = document.detail;
		form.bounq.value = bounq;
		form.method ="post";
		form.action = "/bookDetail.do";
		form.submit();
		
	}
	
	function fn_buyAdd(bookunq){
		
		var checkedBaguni = [];
		
		checkedBaguni.push(bookunq);
		
		document.getElementById("checkedBaguni").value = checkedBaguni;
		document.buyFrm.submit();	
	}
	
	function fn_checkStock(bookunq){
		
		if($("#id").val() == ""){
  			alert('로그인 후 이용가능합니다.');
  			return;
  		}
		
		var checkedBaguni = [];		
		checkedBaguni.push(bookunq);	
		
    	document.getElementById("checkedBaguni").value = checkedBaguni;		
		
		var form = {};
		form.checkStock = $("#checkedBaguni").val();
		form.bookCnts = $("#buydetailcnt").val();
		$.ajax({
			type : 'POST',
			data : form,
			url : "/baguniCheckStock.do",
			
			success : function(data) {
				if (data.result == "ok") {
					//선택한 상품의 재고가 있는 경우
					fn_buyAdd(bookunq);
				}else {
					alert("품절된 상품입니다. 다시 확인해주세요.");
				}
			},
			error : function() {
				alert("오류발생 ");
			}
		});
	}
	
</script>

	<jsp:include page="header.jsp">
		<jsp:param value="navbar-fixed-top" name="navbar_style" />
	</jsp:include>

<body style="display: block; padding-top: 51px;">


	<main>
	
	<form name="detail">
		<input type="hidden" id="id" value="${id}">
		<input type="hidden" name="bounq">
	</form>
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
			<h3>베스트셀러<img src="/images/hot2.gif">
			</h3>
			<div class="row">
				<c:forEach var="highPriceList" items="${highPriceList}">
					<div class="col-xs-6 col-sm-3">
						<a class="thumbnail" style="text-decoration: none; text-align: center; padding: 40px 40px 20px 40px;">
							<img src="/images/poster/${highPriceList.boimg}" onclick="fn_detail('${highPriceList.bounq}')" alt="..." style="margin-bottom: 10px; width: 200px; height: 250px;">
							<font size="2">[${highPriceList.levelname}]</font>
							<br>
							<font size="3">${highPriceList.boname}</font>
							<br>
							<div class="btn-group" role="group" aria-label="...">
								<input type="button" class="btn btn-default" value="즉시구매" onclick="fn_checkStock('${highPriceList.bounq}')">
								<input type="button" class="btn btn-default" value="장바구니" onclick="fn_baguniAdd('${highPriceList.bounq}','${highPriceList.boprice}' ,'${highPriceList.boname}' )">
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div><!-- div id="index_thumbnail" -->
		
		<div id="index_thumbnail">
			<h3>화제의 신간<img src="/images/hot2.gif"></h3>
			<div class="row">
				<!-- table  -->
				<c:forEach var="updateList" items="${updateList}">
					<div class="col-xs-6 col-sm-3">
						<a class="thumbnail" style="text-decoration: none; text-align: center; padding: 40px 40px 20px 40px;">
							<img src="/images/poster/${updateList.boimg}" onclick="fn_detail('${updateList.bounq}')" alt="..." style="margin-bottom: 10px; width: 200px; height: 250px;">
							<font size="2">[${updateList.levelname}]</font>
							<br>
							<font size="3">${updateList.boname}</font>
							<br>
							<div class="btn-group" role="group" aria-label="...">
								<input type="button" class="btn btn-default" value="즉시구매" onclick="fn_checkStock('${updateList.bounq}')">
								<input type="button" class="btn btn-default" value="장바구니" onclick="fn_baguniAdd('${updateList.bounq}','${updateList.boprice}' ,'${updateList.boname}' )">
							</div>
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
				<c:forEach var="favoriteBookList" items="${favoriteBookList}">
					<div class="col-xs-6 col-sm-3">
						<a class="thumbnail" style="text-decoration: none; text-align: center; padding: 40px 40px 20px 40px;">
							<img src="/images/poster/${favoriteBookList.boimg}" onclick="fn_detail('${favoriteBookList.bounq}')" alt="..." style="margin-bottom: 10px; width: 200px; height: 250px;">
							<font size="2">[${favoriteBookList.levelname}]</font>
							<br>
							<font size="3">${favoriteBookList.boname}</font>
							<br>
							<div class="btn-group" role="group" aria-label="...">
								<input type="button" class="btn btn-default" value="즉시구매" onclick="fn_checkStock('${favoriteBookList.bounq}')">
								<input type="button" class="btn btn-default" value="장바구니" onclick="fn_baguniAdd('${favoriteBookList.bounq}','${favoriteBookList.boprice}' ,'${favoriteBookList.boname}' )">
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
			<!-- end div row table  -->
		</div>
		<!-- div id="index_thumbnail" -->

	</div>
	
	</main>

	<form name="buyFrm" id="buyFrm" action="buy.do" method="post">
		<input type="hidden" name="checkedBaguni" id="checkedBaguni" value="">
		<input type="hidden" name="buyRoute" id="buyRoute" value="1">
		<input type="hidden" name="buydetailcnt" id="buydetailcnt" value="1">
    </form>
</body>

<jsp:include page="sidebar.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>

</html>
