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
	
	function fn_rebodetail(bounq){
		var form = document.rebo;
		form.bounq.value = bounq;
		form.method ="post";
		form.action = "/bookDetail.do";
		form.submit();
	}
	function fn_rebookAdd(){
		if($("#id").val() == ""){
  			alert('로그인 후 이용가능합니다.');
  			return;
  		}
		var url = "<c:url value='/rebookAdd.do'/>";
		window.open(url, 'poll', 'width=700, height=500');
	}

	function fn_rebookBaguniAdd(bounq ,reboprice , reboname , rebounq){
		if($("#id").val() == ""){
  			alert('로그인 후 이용가능합니다.');
  			return;
  		}

		var form = {};
	
		form.bagunibookunq = bounq;
		form.bagunirebounq = rebounq;
		form.bagunibookname = reboname;
		form.baguniprice = reboprice;

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


<body style="display: block;  padding-top: 51px;">

	<jsp:include page="header.jsp">
		<jsp:param value="navbar-fixed-top" name="navbar_style" />
	</jsp:include>
	
		<main>
		<form name="rebo">
		<input type="hidden" id="id" value="${id}">
		<input type="hidden"  name ="bounq" id="bounq">
		</form>
		
		<div class="container">
			<div class="row" style="margin-top: 20px;">
				<div class="col-xs-12">
					<h2 style="display: inline;">중고책으로 만나는 베스트 샐러</h2>
					<button type="button" class="btn btn-success btn-lg" onclick="fn_rebookAdd()" style="border-radius: 0px; float: right; display: inline;">중고도서 등록</button>
					<hr>
		    	</div>
			</div>
	       	
			<div class="row">
				<c:set var="count" value="0" />
				<c:forEach var="bestList" items="${bestList}">
					<c:if test="${count%4==0 }">
						<div class="clearfix"></div>
					</c:if>
					
					<div class="col-xs-3">
						<a class="thumbnail" style="text-decoration: none; text-align: center; padding: 40px 40px 20px 40px;">
							<img src="/images/poster/${bestList.boimg}" onclick="fn_rebodetail('${bestList.rebobookunq}')" alt="..." style="margin-bottom: 10px; width: 200px; height: 250px;">
							<font size="2">${bestList.reboname}</font>
							<br>
							<span style="font-size: 20px; font-weight: 900; color: #d9534f; vertical-align:middle;">
									<c:set var="price" value="${bestList.boprice}" />
									<fmt:formatNumber type="currency" currencySymbol="" value="${bestList.reboprice}" />
							</span>
							<c:set var="sale" value="${(bestList.boprice - bestList.reboprice)*100/bestList.boprice}"/>
							<span style="font-size: 15px; font-weight: 900; color: #d9534f; vertical-align:middle;">원[${sale}% 할인]</span>
							<div>상태: ${bestList.rebocondition }</div>
							<div class="btn-group" role="group" aria-label="...">
								<input type="button" class="btn btn-default" value="즉시구매" onclick="fn_checkStock('${bestList.rebounq }')">
								<input type="button" class="btn btn-default" value="장바구니" onclick="fn_rebookBaguniAdd('${bestList.rebobookunq}','${bestList.reboprice}' ,'${bestList.reboname}','${bestList.rebounq}')">
							</div>
						</a>
					</div>
					<c:set var="count" value="${count+1}" />
				</c:forEach>
			</div>
	       	
	       	<div class="row" style="margin-top: 20px;">
				<div class="col-xs-12">
					<h2 style="display: inline;">최저가 중고도서</h2>
					<hr>
		    	</div>
			</div>
	       	
	       	<div class="row">
				<c:set var="count" value="0" />
				<c:forEach var="lowPriceList" items="${lowPriceList}">
					<c:if test="${count%4==0 }">
						<div class="clearfix"></div>
					</c:if>
					
					<div class="col-xs-3">
						<a class="thumbnail" style="text-decoration: none; text-align: center; padding: 40px 40px 20px 40px;">
							<img src="/images/poster/${lowPriceList.boimg}" onclick="fn_rebodetail('${lowPriceList.rebobookunq}')" alt="..." style="margin-bottom: 10px; width: 200px; height: 250px;">
							<font size="2">${lowPriceList.reboname}</font>
							<br>
							<span style="font-size: 20px; font-weight: 900; color: #d9534f; vertical-align:middle;">
									<c:set var="price" value="${lowPriceList.boprice}" />
									<fmt:formatNumber type="currency" currencySymbol="" value="${lowPriceList.reboprice}" />
							</span>
							<c:set var="sale" value="${(lowPriceList.boprice - lowPriceList.reboprice)*100/lowPriceList.boprice}"/>
							<span style="font-size: 15px; font-weight: 900; color: #d9534f; vertical-align:middle;">원[${sale}% 할인]</span>
							<div>상태: ${lowPriceList.rebocondition}</div>
							<div class="btn-group" role="group" aria-label="...">
								<input type="button" class="btn btn-default" value="즉시구매" onclick="fn_checkStock('${lowPriceList.rebounq}')">
								<input type="button" class="btn btn-default" value="장바구니" onclick="fn_rebookBaguniAdd('${lowPriceList.rebobookunq}','${lowPriceList.reboprice}' ,'${lowPriceList.reboname}','${lowPriceList.rebounq}')">
							</div>
						</a>
					</div>
					<c:set var="count" value="${count+1}" />
				</c:forEach>
			</div>
	       	
		</div><!-- end container  -->
		
		<form name="buyFrm" id="buyFrm" action="buy.do" method="post">
			<input type="hidden" name="checkedBaguni" id="checkedBaguni" value="">
			<input type="hidden" name="buyRoute" id="buyRoute" value="1">
			<input type="hidden" name="buydetailcnt" id="buydetailcnt" value="1">
    	</form>
		
	</main>
	
	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
