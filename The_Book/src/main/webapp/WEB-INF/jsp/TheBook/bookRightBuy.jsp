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
<title>bookRightBuy.jsp</title>

<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>

<!-- 아임포트 결제 라이브러리 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
function Payment(){
	
	if($("#buyname").val() == ""){
		alert('받으시는 분 성함을 입력해주세요.')
		return;
	}
	if($("#buyphone1").val() == "" || $("#buyphone2").val() == "" || $("#buyphone3").val() == ""){
		alert('휴대폰 번호를 입력해주세요.')
		return;
	}
	if($("#buyzip").val() == "" || $("#buyaddr1").val() == "" || $("#buyaddr2").val() == ""){
		alert('배송 주소를 입력해주세요.')
		return;
	}
	
	var bookunqs = [];
	$("input[name='bookunq']").each(function(i){
		bookunqs.push($(this).val());
	});
	
	var booknames = [];
	$("input[name='bookname']").each(function(i){
		booknames.push($(this).val());
	});
	
	var bookprices = [];
	$("input[name='bookprice']").each(function(i){
		bookprices.push($(this).val());
	});
	
	var bookcnts = [];
	$("input[name='bookcnt']").each(function(i){
		bookcnts.push($(this).val());
	});
	
	var bookimgs = [];
	$("input[name='bookimg']").each(function(i){
		bookimgs.push($(this).val());
	});
	
	$("#bookunqs").val(bookunqs);
	$("#booknames").val(booknames);
	$("#bookprices").val(bookprices);
	$("#bookcnts").val(bookcnts);
	$("#bookimgs").val(bookimgs);
	
	var bookunqs= $("#bookunqs").val();
	var booknames = $("#booknames").val();
    var totalprice = $("#totalPrice").text();
    var buyname = $("#buyname").val();
    var buyphone = $("#buyphone1").val() + "-" + $("#buyphone2").val() + "-" + $("#buyphone3").val();
    var buyaddr= $("#buyaddr1").val()+" "+$("#buyaddr2").val();
    var buyzip = $("#buyzip").val();
	
	var IMP = window.IMP; // 생략가능
	IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : bookunqs + new Date().getTime(),
	    name : booknames,
	    amount : totalprice,
	    buyer_name : buyname,
	    buyer_tel : buyphone,
	    buyer_addr : buyaddr,
	    buyer_postcode : buyzip,
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}
</script>

</head>

<script type="text/javascript">

	$(document).ready(function(){		

		$("#buyzip").prop('disabled', true);
		$("#buyaddr1").prop('disabled', true);
			
		if($("#totalBook").text() > 50000){
			$("#totalDelivery").text(0);
		}else{
			$("#totalDelivery").text(2500);
		}
		
		$("#usedPoint").keyup(function(){
			var usedPoint = Number($("#usedPoint").val());
			var memPoint = Number($("#memPoint").val());
			if(usedPoint > memPoint || usedPoint < 0){
				alert('사용 가능한 금액을 초과했습니다.');
				$("#usedPoint").val($("#memPoint").val());
				$("#totalUsedPoint").text($("#memPoint").val());
			}else{
				$("#totalUsedPoint").text($("#usedPoint").val());				
			}
			
			var totalBook = Number($("#totalBook").text());
			var totalUsedPoint = Number($("#totalUsedPoint").text());
			var totalDelivery = Number($("#totalDelivery").text());
			$("#totalPrice").text(totalBook - totalUsedPoint + totalDelivery);
		});
		
		//포인트 모두사용 체크박스 클릭 시,
		$("#memPoint").click(function(){
	        //클릭 되었으면
	        if($("#memPoint").prop("checked")){
	            $("#usedPoint").val($("#memPoint").val());
	            $("#usedPoint").prop('disabled', true);
	        //클릭이 안되있으면
	        }else{
	        	$("#usedPoint").val(0);
	        	$("#usedPoint").prop('disabled', false);
	        }
	        $("#totalUsedPoint").text($("#usedPoint").val());
	        
	        var totalBook = Number($("#totalBook").text());
			var totalUsedPoint = Number($("#totalUsedPoint").text());
			var totalDelivery = Number($("#totalDelivery").text());
	        $("#totalPrice").text(totalBook - totalUsedPoint + totalDelivery);
		});
		
		var totalBook = Number($("#totalBook").text());
		var totalUsedPoint = Number($("#totalUsedPoint").text());
		var totalDelivery = Number($("#totalDelivery").text());
		$("#totalPrice").text(totalBook - totalUsedPoint + totalDelivery);
	});
	
	function fn_sameAddr(){
		$("#buyname").val($("#memname").val());
		
		var phone = $("#memphone").val().split('-');
		$("#buyphone1").val(phone[0]);
		$("#buyphone2").val(phone[1]);
		$("#buyphone3").val(phone[2]);
		
		$("#buyzip").val($("#memzip").val());
		$("#buyaddr1").val($("#memaddr1").val());
		$("#buyaddr2").val($("#memaddr2").val());
	}
	
	function fn_newAddr(){
		$("#buyname").val("");
		$("#buyphone1").val("");
		$("#buyphone2").val("");
		$("#buyphone3").val("");
		$("#buyzip").val("");
		$("#buyaddr1").val("");
		$("#buyaddr2").val("");
	}
	
	function fn_buy(){
		
		if($("#buyname").val() == ""){
			alert('받으시는 분 성함을 입력해주세요.')
			return;
		}
		if($("#buyphone1").val() == "" || $("#buyphone2").val() == "" || $("#buyphone3").val() == ""){
			alert('휴대폰 번호를 입력해주세요.')
			return;
		}
		if($("#buyzip").val() == "" || $("#buyaddr1").val() == "" || $("#buyaddr2").val() == ""){
			alert('배송 주소를 입력해주세요.')
			return;
		}
		
		var bookunqs = [];
		$("input[name='bookunq']").each(function(i){
			bookunqs.push($(this).val());
		});
		
		var booknames = [];
		$("input[name='bookname']").each(function(i){
			booknames.push($(this).val());
		});
		
		var bookprices = [];
		$("input[name='bookprice']").each(function(i){
			bookprices.push($(this).val());
		});
		
		var bookcnts = [];
		$("input[name='bookcnt']").each(function(i){
			bookcnts.push($(this).val());
		});
		
		var bookimgs = [];
		$("input[name='bookimg']").each(function(i){
			bookimgs.push($(this).val());
		});
		
		$("#bookunqs").val(bookunqs);
		$("#booknames").val(booknames);
		$("#bookprices").val(bookprices);
		$("#bookcnts").val(bookcnts);
		$("#bookimgs").val(bookimgs);
		
		var buydeliveryprice = $("#totalDelivery").text();
		var buycash = $("#totalPrice").text() - buydeliveryprice;
		
		var form = {};
		form.buyname = $("#buyname").val();
		form.buyphone = $("#buyphone1").val() + "-" + $("#buyphone2").val() + "-" + $("#buyphone3").val();
		form.buyzip = $("#buyzip").val();
		form.buyaddr1 = $("#buyaddr1").val();
		form.buyaddr2 = $("#buyaddr2").val();
		form.buypoint = $("#usedPoint").val();
		form.buycash = buycash;
		form.buydeliveryprice = buydeliveryprice;
		form.bookunqs = $("#bookunqs").val();
		form.booknames = $("#booknames").val();
		form.bookprices = $("#bookprices").val();
		form.bookcnts = $("#bookcnts").val();
		form.bookimgs = $("#bookimgs").val();
		
		if (confirm("결제하시겠습니까?")) {

			$.ajax({
				type : 'POST',
				data : form,
				url : "/buyNow.do",

				success : function(data) {
					if (data.result == "ok" && data.result2) {
						alert("결제완료!");
						location.href = "<c:url value="/main.do"/>";
					} else {
						alert("결제 실패했습니다. 다시 시도해 주세요.");
					}
				},
				error : function() {
					alert("오류발생 ");
				}
			});
		}
	}
	
	function fn_post(){
		var url = "<c:url value='/bookPost.do'/>";
		window.open(url, 'poll', 'width=700, height=500');
	}
	
	function fn_writepost1(addr1, zip){
		var memzip_reg = zip.toString();
		document.getElementById('buyaddr1').value=addr1;
		document.getElementById('buyzip').value=memzip_reg.substring(0,3)+'-'+memzip_reg.substring(3);
	}
	
	function fn_checkStock(){
		
		var bookunqs = [];
		
		$("input[name='bookunq']").each(function(i){
			bookunqs.push($(this).val());
		});
		
		var bookcnts = [];
		$("input[name='bookcnt']").each(function(i){
			bookcnts.push($(this).val());
		});

    	$("#bookunqs").val(bookunqs);
    	$("#bookcnts").val(bookcnts);
		
		var form = {};
		form.checkStock = $("#bookunqs").val();
		form.bookCnts = $("#bookcnts").val();
		
		$.ajax({
			type : 'POST',
			data : form,
			url : "/baguniCheckStock.do",
			
			success : function(data) {
				if (data.result == "ok") {
					//선택한 상품의 재고가 있는 경우
					fn_buy();
				}else {
					alert("재고 수량이 부족한 상품이 있습니다. 다시 확인해주세요.");
					//location.href = "<c:url value="/main.do"/>";
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
		<jsp:param value="navbar-fixed-top" name="navbar_style" />
	</jsp:include>
	
	<input type="hidden" name="memname" id="memname" value="${memberInfo.memname }">
	<input type="hidden" name="memphone" id="memphone" value="${memberInfo.memphone }">
	<input type="hidden" name="memzip" id="memzip" value="${memberInfo.memzip }">
	<input type="hidden" name="memaddr1" id="memaddr1" value="${memberInfo.memaddr1 }">
	<input type="hidden" name="memaddr2" id="memaddr2" value="${memberInfo.memaddr2 }">
	
	
	<main>
		<div class="container">
	       	<div class="row">
				<div class="col-xs-12">
		          <h2>주문/결제 <font style="font-size: 20px;">
		          
		          <c:if test="${memberInfo ne null }">
		          	<font style="color: blue; font-weight: bold;">&nbsp;&nbsp;
		          		${memberInfo.memname }</font>님의 적립금:
		          	<font style="color: blue; font-weight: bold;">
		          		<fmt:formatNumber value="${memberInfo.mempoint }" type="number" />P
		          	</font></font></h2>
		          </c:if>
		          		
		          <br><br>
		          <h3>01. 주문상품 정보 </h3><br>
			      <table class="table table-hover">
			          <thead>
			            <tr>
			              <th width="80px;" style="text-align: center; vertical-align:middle;">상품정보</th>
			              <th></th>
			              <th width="110px;" style="text-align: center; vertical-align:middle;">판매가</th>
			              <th width="110px;" style="text-align: center; vertical-align:middle;">수량</th>
			              <th width="110px;" style="text-align: center; vertical-align:middle;">합계</th>
			            </tr>
			          </thead>
			          
			          <c:set var="totalBook" value="0" />
			          <c:forEach var="list" items="${buyList }" varStatus="num">
				          <tbody>
				          	<tr>
				          		<td style="text-align: center; vertical-align:middle;"><a href="bookDetail.do?bounq=${list.bagunibookunq }" target="_blank"><img src="/images/poster/${list.boimg }" class="img-responsive" alt="Responsive image"></a></td>
				          		<td style="vertical-align:middle; padding-left: 50px;"><a href="bookDetail.do?bounq=${list.bagunibookunq }" target="_blank"><h4>${list.bagunibookname }</h4></a></td>
				          		<td style="text-align: center; vertical-align:middle;">
				          			<fmt:formatNumber value="${list.baguniprice }" type="number" />원
				          			
				          			<c:if test="${buyRoute == 1 }">
				          				<c:set var="totalBook" value="${totalBook + (list.baguniprice * bocnt) }" />				          			
				          			</c:if>				          			
				          			<c:if test="${buyRoute == 0 }">
				          				<c:set var="totalBook" value="${totalBook + (list.baguniprice * list.bagunitotal) }" />
				          			</c:if>				          			
				          			
				          			<c:set var="point" value="${list.baguniprice * memberInfo.memgrade * 0.01 }" /><br>
				          			(<fmt:formatNumber value="${point }" type="number" />P)
				          		</td>
				          			
				          			<c:if test="${buyRoute == 1 }">
				          				<td style="text-align: center; vertical-align:middle;">${bocnt }</td>
				          				<td style="text-align: center; vertical-align:middle;">
				          					<fmt:formatNumber value="${list.baguniprice * bocnt }" type="number" />원
				          				</td>			          			
				          			</c:if>				          			
				          			<c:if test="${buyRoute == 0 }">
				          				<td style="text-align: center; vertical-align:middle;">${list.bagunitotal }</td>
				          				<td style="text-align: center; vertical-align:middle;">
						          			<fmt:formatNumber value="${list.baguniprice * list.bagunitotal }" type="number" />원
						          		</td>
				          			</c:if>			          		
				          	</tr>
				          </tbody>
				          
				          <!-- 선택한 책번호,책제목,가격,수량,메인사진을 넘기는 부분 -->
				          <c:if test="${buyRoute == 1 }">
	          				  <input type="hidden" name="bookunq" id="bookunq" value="${list.bagunibookunq }">				          			
		          		  </c:if>				          			
		          		  <c:if test="${buyRoute == 0 }">
			          		  <c:if test="${list.bagunirebounq == null }">
					          <input type="hidden" name="bookunq" id="bookunq" value="${list.bagunibookunq }">
					          </c:if>
					          <c:if test="${list.bagunirebounq ne null }">
					          	<input type="hidden" name="bookunq" id="bookunq" value="${list.bagunirebounq }">
					          </c:if>
		          		  </c:if>			          
				          
				          <input type="hidden" name="bookname" id="bookname" value="${list.bagunibookname }">
				          <input type="hidden" name="bookprice" id="bookprice" value="${list.baguniprice }">			         
				          <input type="hidden" name="bookimg" id="bookimg" value="${list.boimg }">			          
				          <c:if test="${buyRoute == 1 }">
	          				 <input type="hidden" name="bookcnt" id="bookcnt" value="${bocnt }">			          			
	          			  </c:if>				          			
	          			  <c:if test="${buyRoute == 0 }">
	          				 <input type="hidden" name="bookcnt" id="bookcnt" value="${list.bagunitotal }">
	          			  </c:if>	
				          
			          </c:forEach>			          
			       	</table>
		    	</div>
	       	</div>
	       	
	       	
	<form name="frm" id="frm">	       	
	       	<div class="row">
				<div class="col-xs-12"><br>
		          <h3>02. 배송지 </h3><br>
			      <table class="table table-bordered">
			          <thead>
			            <tr>
			              <th width="200px;" style="text-align: center; vertical-align:middle;">주문자정보</th>
			              <th style="vertical-align:middle;">${memberInfo.memname }&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${memberInfo.mememail }&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${memberInfo.memphone }</th>
			            </tr>
			          </thead>
			          <tbody>
			          	<tr>
			          		<td style="text-align: center; vertical-align:middle;">배송지 정보</td>
			          		<td style="vertical-align:middle;">
			          			<button type="button" class="btn btn-default btn-xs" style="border-radius: 0px" onclick="fn_sameAddr()">회원정보동일</button>
			          			<button type="button" class="btn btn-default btn-xs" style="border-radius: 0px" onclick="fn_newAddr()">신규입력</button>
			          			<table class="table" style="margin: 0px;">
						          <tbody>
						          	<tr>						          	
						          		<td style="text-align: center; vertical-align:middle;">받으시는 분</td>
						          		<td style="vertical-align:middle;">
						          			<input type="text" name="buyname" id="buyname" class="form-control input-sm" placeholder="" required style="width: 100px;">
						          		</td>
						          	</tr>
						          	<tr>
						          		<td style="text-align: center; vertical-align:middle;">휴대폰 번호</td>
						          		<td style="vertical-align:middle;">
						          			<input type="text" name="buyphone1" id="buyphone1" class="form-control input-sm" placeholder="" required style="width: 80px; display: inline;"> ㅡ
						          			<input type="text" name="buyphone2" id="buyphone2" class="form-control input-sm" placeholder="" required style="width: 80px; display: inline;"> ㅡ
						          			<input type="text" name="buyphone3" id="buyphone3" class="form-control input-sm" placeholder="" required style="width: 80px; display: inline;">
						          		</td>
						          	</tr>
						          	<tr>
						          		<td style="text-align: center; vertical-align:middle;">배송 주소</td>
						          		<td style="vertical-align:middle;">
						          			<input type="text" name="buyzip" id="buyzip" class="form-control input-sm" placeholder="" required style="width: 150px; display: inline;">
						          			<button type="button" class="btn btn-default" style="border-radius: 0px" onclick="fn_post()">우편번호</button>
						          			<input type="text" name="buyaddr1" id="buyaddr1" class="form-control input-sm" placeholder="" required style="width: 400px;">
						          			<input type="text" name="buyaddr2" id="buyaddr2" class="form-control input-sm" placeholder="상세주소를 입력하세요." required style="width: 400px;">
						          		</td>						   				
						          	</tr>
						          </tbody>
						       	</table>
			          		</td>
			          	</tr>
			          </tbody>
			       	</table>
		    	</div>
	       	</div>
	       	
	       	<div class="row">
				<div class="col-xs-12"><br>
		          <h3>03. 할인/적립 </h3><br>
			      <table class="table table-bordered">
			          <tbody>
			          	<tr>
			          		<td style="text-align: center; vertical-align:middle;">적립금</td>
			          		<td style="vertical-align:middle;">
			          			<input type="number" name="usedPoint" id="usedPoint" value="0" min="0" class="form-control input-sm" required style="width: 150px; display: inline; text-align: right;">원&nbsp;&nbsp;&nbsp;|
			          			&nbsp;&nbsp;&nbsp;보유금액: ${memberInfo.mempoint }P&nbsp;&nbsp;&nbsp;|
			          			&nbsp;&nbsp;&nbsp;
			          			<div class="checkbox" style="display: inline;">
									<label>
									    <input type="checkbox" name="memPoint" id="memPoint" value="${memberInfo.mempoint }" aria-label="...">
									 </label>
								</div>모두사용
			          		</td>
			          	</tr>
			          </tbody>
			       	</table>
		    	</div>
	       	</div>
	       	
	       	<br><br>
	       	<div class="row">
				<div class="col-xs-12">
			      <table class="table">
			          <thead>
			            <tr class="success">
			              <th style="text-align: center; vertical-align:middle;">상품금액</th>
			              <th style="text-align: center; vertical-align:middle;"></th>
			              <th style="text-align: center; vertical-align:middle;">할인금액</th>
			              <th style="text-align: center; vertical-align:middle;"></th>
			              <th style="text-align: center; vertical-align:middle;">배송비</th>
			              <th style="text-align: center; vertical-align:middle;"></th>
			              <th style="text-align: center; vertical-align:middle;">결제 예상 금액</th>
			              <th style="text-align: center; vertical-align:middle;">적립예정</th>
			            </tr>
			          </thead>
			          <tbody>
			          	<tr>
			          		<td style="text-align: center; vertical-align:middle;"><h2><font id="totalBook">${totalBook }</font>원</h2></td>
			          		<td style="text-align: center; vertical-align:middle;"><img alt="" src="images/minus.jpg" width="40" height="40"></td>
			          		<td style="text-align: center; vertical-align:middle;"><h2><font id="totalUsedPoint"> 0</font>원</h2></td>
			          		<td style="text-align: center; vertical-align:middle;"><img alt="" src="images/plus.jpg" width="50" height="45"></td>
			          		<td style="text-align: center; vertical-align:middle;"><h2><font id="totalDelivery"></font>원</h2></td>
			          		<td style="text-align: center; vertical-align:middle;"><img alt="" src="images/equal.jpg" width="40" height="40"></td>
			          		<td style="text-align: center; vertical-align:middle;"><h2 style="color: red"><font id="totalPrice"> 0</font>원</h2></td>
			          		<td style="text-align: center; vertical-align:middle; color: blue;">
			          			<h3 style="color: blue"><fmt:formatNumber value="${totalBook * memberInfo.memgrade * 0.01 }" type="number" />P</h3>
			          		</td>
			          	</tr>
			          </tbo우dy>			          
			       	</table>
		    	</div>
	       	</div>
	       	
	       		<input type="hidden" name="bookunqs" id="bookunqs" value="">
	       		<input type="hidden" name="booknames" id="booknames" value="">
	       		<input type="hidden" name="bookprices" id="bookprices" value="">
	       		<input type="hidden" name="bookcnts" id="bookcnts" value="">
	       		<input type="hidden" name="bookimgs" id="bookimgs" value="">
	       	
	       	<br>
	       	<div class="row">
				<div class="col-xs-12" align="right">
					<a href="main.do">
				    <button type="button" class="btn btn-default btn-lg" style="border-radius: 0px">쇼핑계속하기</button></a>
				    <button type="button" class="btn btn-success btn-lg" style="border-radius: 0px" onclick="fn_checkStock()">일반 결제하기</button>
				    <button type="button" class="btn btn-success btn-lg" style="border-radius: 0px" onclick="Payment()">PG사 결제하기</button>
		    	</div>
	       	</div>
	</form>
			
		</div><!-- end container  -->
	</main>
	
	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
