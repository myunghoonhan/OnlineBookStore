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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title></title>
</head>
<script type="text/javascript">
	function fn_preview(unq){
	
		var url = "<c:url value='/bookPreview.do?bounq="+unq+"'/>";
		window.open(url, 'poll', 'width=700, height=500');
	}
	function fn_storeStock(unq){
		
		var url = "<c:url value='/bookStoreStock.do?bounq="+unq+"'/>";
		window.open(url, 'poll', 'width=700, height=500');
	}
	function fn_authorDetail(author){
		var url = "<c:url value='http://search.daum.net/search?w=tot&DA=YZR&t__nil_searchbox=btn&sug=&sugo=&q="+author+"'/>";
		window.open(url, 'poll', 'width=1000, height=1000');
	}
	

	
  	function fn_authorAdd(boauthor,bounq) {
  		if($("#checkid").val() == ""){
  			alert('로그인 하세요');
  			return;
  		}
		var form = {};
		form.bounq = bounq
		form.boauthor = boauthor
		
		if(confirm("저장하시겠습니까?")) {
			
			$.ajax({
				type: 'POST',
				data: form,
				url: "/authorAdd.do",
				success: function(data) {
					if(data.authorAdd == "ok") {
						alert("관식작가 등록.");
					} else {
						alert("저장 실패했습니다. 다시 시도해 주세요.");
					}
				},
				error: function () {
					alert("오류발생 ");
				}
			}); 
		}
	  	
  	}
  	function fn_review(bounq) {
  		if($("#checkid").val()==""){
  			alert('로그인 하세요');
  			return;
  		}
  		if( $(':radio[name="blankRadio"]:checked').val() == null){
			alert('별점을 선택해주세요')
			return;
		}
  		if($("#contents").val()==""){
			alert('내용을 입력해주세요')
			return;
		}
		
		var form = {};
		form.reviewcontent = $("#contents").val();
		form.reviewstar = $(':radio[name="blankRadio"]:checked').val();
		form.reviewbookunq = bounq;
	
		$.ajax({
			type: 'POST',
			data: form,
			url: "/bookReview.do",
			success: function(data) {
				if(data.bookReview == "ok") {
					alert("리뷰 등록.");
					location.href = "<c:url value='/bookDetail.do?bounq="+data.bookunq+"'/>";
				} else {
					alert("저장 실패했습니다. 다시 시도해 주세요.");
				}
			},
			error: function () {
				alert("오류발생 ");
			}
		}); 
		
	}
  	
  	function fn_junggoClick(bounq ,recnt){
  		if(recnt == 0){
  			alert('중고상품이 없습니다');
  			return;
  		}
  		
  		var form = document.junggo;
		
  		
  		form.rebobookunq.value = bounq;

		form.method ="post";
		form.action = "/clickJungoList.do";
		form.submit();
  	}
  	function fn_DetailBaguniAdd(bounq, boprice , boname){
			if($("#checkid").val() == ""){
			alert('로그인 후 이용가능합니다.');
			return;
			}
			if($("#total").val() == 0 || $("#total").val() < 0){
	  			alert('수량을 입력하세요');
	  			return;
	  		}
			var form = {};
		
			
			form.bagunibookunq = bounq;
			form.baguniprice = boprice;
			form.bagunibookname = boname;
			form.bagunitotal = $("#total").val()

			$.ajax({
			
			type: 'POST',
			data: form,
			url: "/baguniAdd.do",
			
			success: function(data) {
				alert("장바구니 등록완료");
				fn_GetCartCnt();
			},	
			error: function () {
				alert(" 오류발생 ");
			}
		}); 
	}

	function fn_buyAdd(bookunq){

		var checkedBaguni = [];

		checkedBaguni.push(bookunq);

		document.getElementById("checkedBaguni").value = checkedBaguni;
		document.getElementById("buydetailcnt").value = $("#total").val();
		document.buyFrm.submit();	
	}

	function fn_checkStock(bookunq){

		if($("#checkid").val() == ""){
			alert('로그인 후 이용가능합니다.');
			return;
		}
		if($("#total").val() == 0 || $("#total").val() < 0){
			alert('수량을 입력하세요');
			return;
		}

		var checkedBaguni = [];		
		checkedBaguni.push(bookunq);

		document.getElementById("checkedBaguni").value = checkedBaguni;		

		var form = {};
		form.checkStock = $("#checkedBaguni").val();
		form.bookCnts = $("#total").val();
		$.ajax({
			type : 'POST',
			data : form,
			url : "/baguniCheckStock.do",
	
			success : function(data) {
				if (data.result == "ok") {
					//선택한 상품의 재고가 있는 경우
					fn_buyAdd(bookunq);
				}else {
					alert("재고 수량이 부족합니다. 다시 확인해주세요.");
				}
			},
			error : function() {
				alert("오류발생 ");
			}
		});
	}
	
</script>
<body style="display: block;  padding-top: 51px;">

  <jsp:include page="header.jsp">
  	<jsp:param value="navbar-fixed-top" name="navbar_style"/>
  </jsp:include>
  
  <main>
  <form name="junggo">
  	<input type="hidden" name="rebobookunq">
  	<input type="hidden" id="recnt">
  </form>
  	<input type="hidden" name="checkid" id="checkid" value="${bookMemberInfo.memid}"> 
	
    <div class="container" id="detail_main">
    
      <div class="row" style="margin-bottom: 5px;">
      	<h4>
      		홈 <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span> 
      		${daejungso.dae} <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span> 
      		${daejungso.jung} <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span> 
      		${daejungso.so}
      	</h4>
      </div>
      <!--전체 ROW  -->
      <div class="row">

        <div class="col-xs-12"><!-- 왼쪽  -->
          <div class="row"  style="margin-bottom: 10px; border-style: solid; border-width: 1px; border-radius: 4px; border-color: #ddd; padding: 15px;">
            <div class="col-xs-12 col-md-4">
              <img src="/images/poster/${bookDetail.boimg}" class="img-responsive img-rounded" alt="Responsive image" style="width: 100%;">
            </div>

            <div class="col-xs-12 col-md-8">
              <ul>
                <li style="list-style: none;">
                  <h3><strong> ${bookDetail.boname }</strong></h3>
                </li>
                <li style="list-style: none; margin-bottom: 10px;">
                	${bookDetail.boauthor} 지음 | ${bookDetail.botrans} 옮김 | ${bookDetail.bocompany}| ${bookDetail.bopublish}
                </li>
                 
                <c:if test="${0 eq reviewTotal}">
                <li style="list-style: none; margin-bottom: 30px;">
                  	 리뷰${reviewTotal}개 	<a href="#tab3">리뷰쓰기</a>
                  	 <!-- <button type="button" class="btn btn-default btn-xs">리뷰쓰기</button> -->
                </li>
                </c:if>
 
 
                <c:if test="${reviewTotal != 0}">
                <fmt:parseNumber var="point" value="${reviewStar/reviewTotal}" pattern="0" />	       
                  	<c:forEach  begin="1"   end="${point}">
							<img src="/images/star.png" style="width: 20px; height: auto;">
					</c:forEach>
					  리뷰${reviewTotal}개  <a href="#tab3">리뷰쓰기</a>
					  <!-- <button type="button" class="btn btn-default btn-xs">리뷰쓰기</button> -->
                </c:if>
                <li style="list-style: none; margin-bottom: 10px;">
                	판매가:
                	<span style=" font-size: 30px; color: #d9534f;">
                	<c:set var="price" value="12000" />
					<fmt:formatNumber type="currency" currencySymbol="" value="${bookDetail.boprice}"/>원
					</span>
                </li>
                <c:if test="${null eq bookMemberInfo.memid}">
				<li style="list-style: none; margin-bottom: 30px;">
                <fmt:parseNumber var="point" value="${bookDetail.boprice*0.03}" pattern="0" />	
                	포인트: ${point}원 적립 | <a href="#" onclick="fn_junggoClick('${detailRebook.bounq}','${detailRebook.recnt}')" 
                	style="text-decoration: none">중고장터(${detailRebook.recnt}건)</a>
                </li>    			
				</c:if>
			
				<c:if test="${null ne bookMemberInfo.memid}">
				<li style="list-style: none; margin-bottom: 30px;">
                <fmt:parseNumber var="point" value="${bookDetail.boprice * memGradePoint}" pattern="0" />
                	포인트: ${point}원 적립 | <a href="#" onclick="fn_junggoClick('${detailRebook.bounq}','${detailRebook.recnt}')" 
                	style="text-decoration: none">중고장터(${detailRebook.recnt}건)</a>
				</li>
				</c:if>    
                <c:if test="${bookStockOrderDay.stockstock ne 0 }">
				 <li style="list-style: none; margin-bottom: 30px;">
                	도착예정일: 지금 주문하면 <font color="blue" size="4px" style="font-weight: bold;">${bookStockOrderDay.day1}일  ${bookStockOrderDay.day2}요일</font> 도착예정
                </li>       			
				</c:if>
				<c:if test="${bookStockOrderDay.stockstock == 0 }">
				        <font color="red">품절</font>
				 </c:if>
				 
              	<div class="input-group">
			      <span class="input-group-btn">
			        <button class="btn btn-default" type="button" style="margin-right: 10px;" onclick="fn_preview('${bookDetail.bounq}')">미리보기</button>
			        <button class="btn btn-default" type="button" onclick="fn_storeStock('${bookDetail.bounq}')">영업점 재고확인</button>
			      </span>
			    </div>
			    
                <hr>
                
				<li style="list-style: none; margin-bottom: 30px;">
                	주문수량: 
				    <div class="input-group">
				      <span class="input-group-btn">
				        <input type="number" name="total" id="total" class="form-control" placeholder="0" max="10" min="0" style="margin-bottom: 10px; width: 150px; display: inline;"><br>
				      </span>
				    </div>
				    
	             	<div class="input-group">
				      <span class="input-group-btn">
				        <button class="btn btn-primary btn-lg" style="width: 170px; height: auto; margin-right: 10px;" type="button" onclick="fn_checkStock('${bookDetail.bounq}')">바로구매</button>
				        <button class="btn btn-success btn-lg" style="width: 170px; height: auto;" onclick="fn_DetailBaguniAdd('${bookDetail.bounq}','${bookDetail.boprice}','${bookDetail.boname}')" type="button" >장바구니 담기</button>
				      </span>
				    </div>
             	</li>
             	
              </ul>

            </div>
          </div>
          
          <div class="row" style="margin-bottom: 15px;">
            <h3><strong>이 책과 같은 장르의 상품입니다</strong></h3>
			<c:forEach var="jungTotalList" items="${jungTotalList}">
				<div class="col-xs-4 col-sm-2">
	              <div class="thumbnail" style="padding: 0px">
	              <a href="bookDetail.do?bounq=${jungTotalList.bounq}"><img src="/images/poster/${jungTotalList.boimg }" alt="..."></a>
	                <div class="caption" style="padding: 0px; text-align: center">
	                  <div>${jungTotalList.boname}</div>
	            	  <span style="font-size: 20px; font-weight: 900; color: #d9534f; vertical-align:middle;">
		            	  <c:set var="price" value="${jungTotalList.boprice }" />
						  <fmt:formatNumber type="currency" currencySymbol="" value="${price}" />원
					  </span>
					  <span style="font-size: 15px; font-weight: 900; color: #d9534f; vertical-align:middle;">${jungTotalList.levelname} </span>
	                </div>
	              </div>
	            </div>
	          </c:forEach>		
          </div>
		  
          <div id="tab1" class="row" style="margin-bottom: 20px;"><!-- 도서정보 탭  -->
            <div class="col-xs-12">
				<ul class="nav nav-tabs nav-justified" style="margin-bottom: 20px;">
					<li role="presentation" class="active"><a href="#tab1" >도서정보</a></li>
					<li role="presentation" class=""><a href="#tab2">저자소개</a></li>
					<li role="presentation" class=""><a href="#tab3">회원리뷰(0)</a></li>
					<li role="presentation" class=""><a href="#tab4">교환/반품/품절</a></li>
				</ul>
				
				<button type="button" class="btn btn-default btn-xs" style="float: right" onclick="location.href='/bookgogekQnaList.do'">도서상품 1:1 문의</button>
				
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td style="text-align: center; vertical-align:middle; width: 30px;">쪽수</td>
							<td style="text-align: center; vertical-align:middle; width: 100px;">${bookDetail.bopage}</td>
						</tr>
						<tr>
							<td style="text-align: center; vertical-align:middle; width: 30px;">크기</td>
							<td style="text-align: center; vertical-align:middle; width: 100px;">${bookDetail.bosize}</td>
						</tr>
					</tbody>
				</table>
				
				<h4><strong>책소개</strong></h4>
				${bookDetail.boinfo1}
            </div>
          </div>
          
          <div id="tab2" class="row" style="margin-bottom: 20px;"><!-- 저자정보 탭  -->
            <div class="col-xs-12">
				<ul class="nav nav-tabs nav-justified" style="margin-bottom: 20px;">
					<li role="presentation" class=""><a href="#tab1" >도서정보</a></li>
					<li role="presentation" class="active"><a href="#tab2">저자소개</a></li>
					<li role="presentation" class=""><a href="#tab3">회원리뷰(0)</a></li>
					<li role="presentation" class=""><a href="#tab4">교환/반품/품절</a></li>
				</ul>
				
				<h4><strong>저자소개</strong></h4>
				<div class="breadcrumb" style="margin-bottom: 10px;">
					저자: ${bookDetail.boinfo2}
					<button type="button" onclick="fn_authorDetail('${bookDetail.boauthor}')" class="btn btn-default btn-xs" style="float: right">작가 자세히 보기</button>
					<button type="button" onclick="fn_authorAdd('${bookDetail.boauthor}','${bookDetail.bounq}')" class="btn btn-default btn-xs" style="float: right">관심작가 등록</button>
				</div>
            </div>
          </div>
          
          <div id="tab3" class="row"><!-- 회원리뷰탭  -->
            <div class="col-xs-12">
				<ul class="nav nav-tabs nav-justified" style="margin-bottom: 20px;">
					<li role="presentation" class=""><a href="#tab1" >도서정보</a></li>
					<li role="presentation" class=""><a href="#tab2">저자소개</a></li>
					<li role="presentation" class="active"><a href="#tab3">회원리뷰(0)</a></li>
					<li role="presentation" class=""><a href="#tab4">교환/반품/품절</a></li>
				</ul>
				<h4><strong>회원리뷰(0)</strong></h4>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td style="width: 30px; vertical-align: middle;">
								<img src="/images/star.png" style="width: 30px; height: auto;">
								<img src="/images/star.png" style="width: 30px; height: auto;">
								<img src="/images/star.png" style="width: 30px; height: auto;">
								<img src="/images/star.png" style="width: 30px; height: auto;">
								<img src="/images/star.png" style="width: 30px; height: auto;">
								<input type="radio" name="blankRadio" id="blankRadio1" value="5" aria-label="..." style="float: right">
							</td>
							<td style="width: 100px; vertical-align: middle;" rowspan="5">
								<textarea class="form-control" id="contents" name="contents" rows="6" style="resize: none" onfocus="clean(this)"></textarea>
								<button type="button" class="btn btn-info btn-lg" onclick="fn_review('${bookDetail.bounq}')" style="width: 100%">리뷰 쓰기</button>
							</td>
						</tr>
							<tr>
							<td style="width: 30px;">
								<img src="/images/star.png" style="width: 27px; height: auto;">
								<img src="/images/star.png" style="width: 27px; height: auto;">
								<img src="/images/star.png" style="width: 27px; height: auto;">
								<img src="/images/star.png" style="width: 27px; height: auto;">
								<input type="radio" name="blankRadio" id="blankRadio" value="4" aria-label="..." style="float: right">
							</td>
						</tr>
						<tr>
							<td style="width: 30px;">
								<img src="/images/star.png" style="width: 24px; height: auto;">
								<img src="/images/star.png" style="width: 24px; height: auto;">
								<img src="/images/star.png" style="width: 24px; height: auto;">
								<input type="radio" name="blankRadio" id="blankRadio" value="3" aria-label="..." style="float: right">
							</td>
						</tr>
						<tr>
							<td style="width: 30px;">
								<img src="/images/star.png" style="width: 22px; height: auto;">
								<img src="/images/star.png" style="width: 22px; height: auto;">
								<input type="radio" name="blankRadio" id="blankRadio" value="2" aria-label="..." style="float: right">
							</td>
						</tr>
						<tr>
							<td style="width: 30px;">
								<img src="/images/star.png" style="width: 20px; height: auto;">
								<input type="radio" name="blankRadio" id="blankRadio" value="1" aria-label="..." style="float: right">
							</td>
						</tr>
					</tbody>
				</table>
            </div>
          </div>
          
         <%--  <c:if test="${movedown == 1}">
			<script type="text/javascript">
				$(function() {
					$('html,body').animate({scrollTop:'10000'},1100);
					document.reviewForm.contents.focus();
				});
			</script>
		  </c:if>  --%>

		<div class="row" style="margin-bottom: 20px;"><!-- 후기 리스트  -->
			<div class="col-xs-12">
				<table class="table table-bordered" style="margin: 0px;">
			         <c:forEach var="bookReviewList" items="${bookReviewList}" varStatus="status">
			        <tbody>
						<tr>
							<td width="80px" align="center">
								${bookReviewList.memname}
							</td>
							<td width="180px" align="center">
								${bookReviewList.reviewregdate}
							</td>
							<td>
								<c:forEach begin="1" end="${bookReviewList.reviewstar}">
								<img src="/images/star.png" style="width: 20px; height: auto;">
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td colspan="3">
									${bookReviewList.reviewcontent}
							</td>
						</tr>
					 </tbody>
					 </c:forEach>
				</table>
				
				<nav style="text-align: center;">
					<ul class="pagination">
					  <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
					  <li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
					<!--   <li><a href="#">2</a></li>
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
		</div>
		
		<div id="tab4" class="row"><!-- 교환환불 탭  -->
			<div class="col-xs-12">
				<ul class="nav nav-tabs nav-justified" style="margin-bottom: 20px;">
					<li role="presentation" class=""><a href="#tab1" >도서정보</a></li>
					<li role="presentation" class=""><a href="#tab2">저자소개</a></li>
					<li role="presentation" class=""><a href="#tab3">회원리뷰(0)</a></li>
					<li role="presentation" class="active"><a href="#tab4">교환/반품/품절</a></li>
				</ul>
			
				<h4><strong>교환/반품/품절</strong></h4>
				<img src="/images/returnImg.jpg" class="img-responsive" alt="Responsive image" style="margin: 0 auto;">
			</div>
		</div>
		  
        </div> <!-- end div(class="col-xs-12") 왼쪽창  -->
      </div> <!-- end div(class="row") 전체행  -->
    </div> <!-- end container  -->
  </main>
  
  <form name="buyFrm" id="buyFrm" action="buy.do" method="post">
		<input type="hidden" name="checkedBaguni" id="checkedBaguni" value="">
		<input type="hidden" name="buyRoute" id="buyRoute" value="1">
		<input type="hidden" name="buydetailcnt" id="buydetailcnt" value="">
  </form>
  
  <jsp:include page="sidebar.jsp"></jsp:include>
  <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>


