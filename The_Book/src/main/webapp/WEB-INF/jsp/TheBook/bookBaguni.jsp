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

<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>

<title></title>
</head>

<script type="text/javascript">

	$(document).ready(function(){
	    //전체 선택하는 체크박스 클릭
	    $("#all").click(function(){
	        //클릭 되었으면
	        if($("#all").prop("checked")){
	            //input태그의 name이 baguni인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=baguni]").prop("checked",true);
	        //클릭이 안되있으면
	        }else{
	            //input태그의 name이 baguni인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=baguni]").prop("checked",false);
	        }
	    });
	    //선택된 체크박스 갯수 100  20 + 50
//	    var aa = $("input[name=baguni]:checked").length;
	    //alert(aa);
	    
	    
	    
	    
	    
//	    var chk = document.getElementsByName("baguni");
	    
	    
//	    $("input[type=checkbox]").change(function(){
	    	// var baguniTotalPrice = [];
	    	 
	    	 //alert($("input[name='bagunitotalprice']").val());

	    	/*  $("input[name='baguni']:checked").each(function(i){
				//baguniTotalPrice.push($("#bagunitotalprice").val());
				//$("input[name='bagunitotalprice']").each(function(){
					var price = document.getElementsByName("bagunitotalprice")[i].getAttribute('value');
					var cc = $(this).val();
					alert(price);
				//});
			}); */
	    	 
//	    	 for(var i=0; i<chk.length; i++){
	 	    	
//	 	    	if(chk[i].checked == true){ 
//	 	    		var price = document.getElementsByName("bagunitotalprice")[i].getAttribute('value');
//	 	    		alert(price);
//	 	    	}
//	 	    }
			
			
			/* $("#priceHap").text();
			alert($("#priceHap").text()); */
//	    });
	    
	    /* var baguniTotalPrice = [];
	    $("#baguni").click(function(){
			$("input[name='baguni']:checked").each(function(i){
				baguniTotalPrice.push($("#bagunitotalprice").val());
				alert(baguniTotalPrice);
			});
	    }); */
	    
	    $("input[type=checkbox]").change(function(){
	    	var totalBook = 0;
	    	totalBook = Number(totalBook);
	    	var chk = document.getElementsByName("baguni");
	    	
	    	for(var i=0; i<chk.length; i++){
	    		if(chk[i].checked == true){
	    			var price = document.getElementsByName("bagunitotalprice")[i].getAttribute('value');
	    			price = Number(price);
	    			totalBook += price;
	    		}
	    	}
	    	$("#totalBook").text(totalBook);
	    	
	    	
	    	var totalCnt = $("input[name=baguni]:checked").length;
	    	$("#totalCnt").text(totalCnt);
	    	
	    	
	    	var totalPrice = 0;	    	
	    	
	    	if(totalBook > 50000){
	    		$("#totalDelivery").text(0);
	    		totalPrice = totalBook;
	    	}else if(totalBook == 0){
	    		$("#totalDelivery").text(0);
	    	}else{
	    		$("#totalDelivery").text(2500);
	    		totalPrice = totalBook + 2500;
	    	}
	    	
	    	$("#totalPrice").text(totalPrice);
	    	
	    	
	    	var memGrade = ${memberInfo.memgrade };	    	
	    	var totalPoint = totalBook * memGrade * 0.01;
	    	$("#totalPoint").text(totalPoint);
	    	
	    });
	});	

	function fn_change(form) {
			
		var total = form.bagunitotal.value;
		var baguniunq = form.baguniunq.value;
		var bagunibookunq = form.bagunibookunq.value;
		
		if(total == 0 || total == "" || total < 0){
			alert('변경할 수량을 입력해주세요.');
			return;
		}
				
		//var form = new FormData(document.getElementById(form));
		var form = {};
		form.bagunitotal = total;
		form.baguniunq = baguniunq;
		form.bagunibookunq = bagunibookunq;
	
		$.ajax({
			type : 'POST',
			data : form,
			url : "/baguniTotalChange.do",

			success : function(data) {
				if (data.result > 0) {
					alert("변경이 완료되었습니다.");
					location.href = "<c:url value="/baguni.do"/>";
				}else if(data.cntResult > 0){
					alert("재고 수량이 부족합니다.");
					location.href = "<c:url value="/baguni.do"/>";
				}else {
					alert("변경을 실패했습니다. 다시 시도해 주세요.");
				}
			},
			error : function() {
				alert("오류발생 ");
			}
		});
	}
	
	function fn_del(form) {
		
		var baguniunq = form.baguniunq.value;
				
		//var form = new FormData(document.getElementById(form));
		var form = {};
		form.baguniunq = baguniunq;
	
		if (confirm("삭제하시겠습니까?")) {
			$.ajax({
				type : 'POST',
				data : form,
				url : "/baguniDel.do",
	
				success : function(data) {
					if (data.result > 0) {
						alert("삭제가 완료되었습니다.");
						location.href = "<c:url value="/baguni.do"/>";
					} else {
						alert("삭제를 실패했습니다. 다시 시도해 주세요.");
					}
				},
				error : function() {
					alert("오류발생 ");
				}
			});
		}
	}
	
	/* function fn_buySelected(){
		
		//baguni 체크박스에서 선택된 값들만 배열에 넣기
		var checkedBaguni = [];
		$("input[name='baguni']:checked").each(function(i){
			checkedBaguni.push($(this).val());
		});
		
		var allData = { "checkedBaguni": checkedBaguni };
		
		$.ajax({
			type : 'POST',
			data : allData,
			url : "/buy.do",

			success : function(data) {
				alert('succes!');
				alert(data.aaa);
				location.href = "<c:url value="/soo.do"/>";
			},
			error : function() {
				alert("오류발생 ");
			}
		});		
		
	} */
	
	function fn_buySelected(){
		
		var checkedBaguni = [];
		$("input[name='baguni']:checked").each(function(i){
			checkedBaguni.push($(this).val());
		});
		
		document.getElementById("checkedBaguni").value = checkedBaguni;
		document.frm.submit();
	}
	
	function fn_buyAll(){
		
		var checkedBaguni = [];
		/* $("input[name='baguni']").each(function(i){
			checkedBaguni.push($(this).val());
		}); */
		
		$("input[name='stock']").each(function(i){
			var cnt = $(this).val();
			if(cnt != 0){
    			checkedBaguni.push(document.getElementsByName("baguni")[i].getAttribute('value'));
    		}
		});
		
		if(checkedBaguni == ""){
			alert('구매할 도서가 없습니다.');
			return;
		}
				
		document.getElementById("checkedBaguni").value = checkedBaguni;
		document.frm.submit();
	}
	
	function fn_buyDirect(form){
		var checkedBaguni = [];
		
		checkedBaguni.push(form.baguniunq.value);
		
		document.getElementById("checkedBaguni").value = checkedBaguni;
		document.frm.submit();
	}
	
	function fn_checkStock(form2, func){
				
		var checkedBaguni = [];
		var bookcnts = [];
		
		if(func == "buySelected"){
			var chk = document.getElementsByName("baguni");    	
	    	for(var i=0; i<chk.length; i++){
	    		if(chk[i].checked == true){
	    			checkedBaguni.push(document.getElementsByName("bagunibookunq")[i].getAttribute('value'));
	    			bookcnts.push(document.getElementsByName("bagunitotal")[i].getAttribute('value'));
	    		}
	    	}			
			if(checkedBaguni == ""){
				alert('구매할 도서를 선택해주세요.');
				return;
			}
		}
		
		if(func == "buyAll"){
			$("input[name='stock']").each(function(i){
				var cnt = $(this).val();
				if(cnt != 0){
	    			checkedBaguni.push(document.getElementsByName("bagunibookunq")[i].getAttribute('value'));
	    			bookcnts.push(document.getElementsByName("bagunitotal")[i].getAttribute('value'));
	    		}
			});
		}
		
		if(func == "buyDirect"){
			checkedBaguni.push(form2.bagunibookunq.value);
			bookcnts.push(form2.bagunitotal.value);
		}
		
		if(func == "buyChange"){
			checkedBaguni.push(form2.bagunibookunq.value);
			bookcnts.push(form2.bagunitotal.value);
		}
		
    	document.getElementById("checkedBaguni").value = checkedBaguni;	
    	document.getElementById("bookcnts").value = bookcnts;
		
		var form = {};
		form.checkStock = $("#checkedBaguni").val();
		form.bookCnts = $("#bookcnts").val();
		$.ajax({
			type : 'POST',
			data : form,
			url : "/baguniCheckStock.do",
			
			success : function(data) {
				if (data.result == "ok") {
					//선택한 상품의 재고가 있는 경우
					if(func == "buySelected"){
						fn_buySelected();
					}else if(func == "buyAll"){
						alert("품절된 상품을 제외하고 구매합니다.");
						fn_buyAll();
					}else if(func == "buyDirect"){
						fn_buyDirect(form2);
					}else if(func == "buyChange"){
						fn_change(form2);
					}
				}else {
					alert("재고 수량이 부족한 상품이 있습니다. 다시 확인해주세요.");
					location.href = "<c:url value="/baguni.do"/>";
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
		
		<div class="container">
	       	<div class="row">
				<div class="col-xs-12">
		          <h2>장바구니 <font style="font-size: 20px;"><font style="color: blue; font-weight: bold;">&nbsp;&nbsp;
		         		${memberInfo.memname }
		          </font>님의 적립금: <font style="color: blue; font-weight: bold;">
		          		<fmt:formatNumber value="${memberInfo.mempoint }" type="number" />P
		          </font></font></h2><br><br>
			      <table class="table table-hover">
			          <thead>
			            <tr>
			              <th width="80px;" style="text-align: center; vertical-align:middle;">
							<div class="checkbox" style="margin: 0px">
								<label>
								    <input type="checkbox" id="all" value="option1" aria-label="...">
								 </label>
							</div>			              
			              </th>
			              <th width="80px;" style="text-align: center; vertical-align:middle;">상품정보</th>
			              <th></th>
			              <th width="110px;" style="text-align: center; vertical-align:middle;">판매가</th>
			              <th width="90px;" style="text-align: center; vertical-align:middle;">수량</th>
			              <th width="80px;" style="text-align: center; vertical-align:middle;">합계</th>
			              <th width="150px;" style="text-align: center; vertical-align:middle;">도착예정일</th>
			              <th width="150px;" style="text-align: center; vertical-align:middle;">선택</th>
			            </tr>
			          </thead>
			          
			          <tbody>
			          
			          <c:if test="${baguniList.isEmpty() }">
			          	<tr>
			          		<td style="text-align: center; vertical-align:middle;" colspan="8">
			          			<br><br>
				          		담아둔 상품이 없습니다.
				          		<br>
							</td>
						</tr>
			          </c:if>			          
			          
			          <c:if test="${baguniList.isEmpty() == false }">
			          	<c:forEach var="baguniList" items="${baguniList }">
			          		<tr>
				          		<td style="text-align: center; vertical-align:middle;">
					          		<div class="checkbox">
									  <label>
									    <input type="checkbox" name="baguni" id="baguni" value="${baguniList.baguniunq }" aria-label="...">
									  </label>
									</div>
								</td>
				          		<td style="text-align: center; vertical-align:middle;"><a href="bookDetail.do?bounq=${baguniList.bounq }" target="_blank"><img src="/images/poster/${baguniList.boimg }" class="img-responsive" alt="Responsive image"></a></td>
				          		<td style="vertical-align:middle;"><a href="bookDetail.do?bounq=${baguniList.bounq }" target="_blank">${baguniList.bagunibookname }</a></td>
				          		<c:set var="point" value="${baguniList.baguniprice * memberInfo.memgrade * 0.01 }" />
				          		<td style="text-align: center; vertical-align:middle;">
				          			<fmt:formatNumber value="${baguniList.baguniprice }" type="number" />원<br>
				          			(<fmt:formatNumber value="${point }" type="number" />P)
				          		</td>
				          		<td style="text-align:center; vertical-align:middle;">
				          			<form id="${baguniList.baguniunq }">
					          			<input type="number" name="bagunitotal" class="form-control" min="0" style="margin: 0px; text-align:center;" id="bagunitotal" value="${baguniList.bagunitotal }">
					          			<input type="hidden" name="baguniunq" value="${baguniList.baguniunq }">
					          			
					          			<c:if test="${baguniList.bagunirebounq eq null }">
					          				<input type="hidden" name="bagunibookunq" value="${baguniList.bounq }">
					          			</c:if>
					          			<c:if test="${baguniList.bagunirebounq ne null }">
					          				<input type="hidden" name="bagunibookunq" value="${baguniList.bagunirebounq }">
					          			</c:if>
					          			
					          			<button type="button" class="btn btn-success btn-xs" style="width: 100%; height: auto" onclick="fn_checkStock(this.form, 'buyChange')">변경</button>
					          	</td>
				          		<td style="text-align: center; vertical-align:middle;">
				          			<fmt:formatNumber value="${baguniList.baguniprice * baguniList.bagunitotal }" type="number" />원
				          			<input type="hidden" name="bagunitotalprice" id="bagunitotalprice" value="${baguniList.baguniprice * baguniList.bagunitotal }">
				          		</td>
				          		<td style="text-align: center; vertical-align:middle;">
				          		
				          			<c:if test="${baguniList.bagunirebounq eq null }">
				          				<c:if test="${baguniList.stockstock ne 0 }">
				          					내일(${baguniList.day1 }일,${baguniList.day2 })
					          			</c:if>
					          			<c:if test="${baguniList.stockstock == 0 }">
					          				<font color="red">품절</font>
					          			</c:if>
				          			</c:if>
				          			<c:if test="${baguniList.bagunirebounq ne null }">
				          				<c:if test="${baguniList.rebostock ne 0 }">
				          					내일(${baguniList.day1 }일,${baguniList.day2 })
					          			</c:if>
					          			<c:if test="${baguniList.rebostock == 0 }">
					          				<font color="red">품절</font>
					          			</c:if>
				          			</c:if>				          			
				          			
				          		</td>
				          		<td style="text-align: center; vertical-align:middle;">
				          		
				          			<c:if test="${baguniList.bagunirebounq eq null }">
				          				<input type="hidden" name="stock" value="${baguniList.stockstock }">
				          			</c:if>
				          			<c:if test="${baguniList.bagunirebounq ne null }">
				          				<input type="hidden" name="stock" value="${baguniList.rebostock }">
				          			</c:if>				          			
				          				
					          			<button type="button" class="btn btn-danger" style="margin-bottom: 5px;" onclick="fn_checkStock(this.form, 'buyDirect')">바로구매</button>
						              	<button type="button" class="btn btn-success" style="width: 82px; height: auto" onclick="fn_del(this.form)">삭제</button>
						            </form>
					            </td>
				          	</tr>
			          	</c:forEach>
			         </c:if>
			          
<!-- 			          	
			          	<tr>
			          		<td style="text-align: center; vertical-align:middle;">
				          		<div class="checkbox">
								  <label>
								    <input type="checkbox" id="blankCheckbox" value="option1" aria-label="...">
								  </label>
								</div>
							</td>
			          		<td style="text-align: center; vertical-align:middle;"><a href="TicketInfo.do?sno=d10"><img src="/images/poster/d10.jpg" class="img-responsive" alt="Responsive image"></a></td>
			          		<td style="vertical-align:middle;"><a href="#">[중고]해리포터<br>해리포터</a></td>
			          		<td style="text-align: center; vertical-align:middle;">12000원<br>(10p)</td>
			          		<td style="text-align: center; vertical-align:middle;">
			          			<input type="number" name="" class="form-control" placeholder="0" max="10" min="0" style="margin: 0px;">
			          			<button type="button" class="btn btn-success btn-xs" style="width: 100%; height: auto">변경</button></td>
			          		<td style="text-align: center; vertical-align:middle;">1</td>
			          		<td style="text-align: center; vertical-align:middle;">내일(22일,수)</td>
			          		<td style="text-align: center; vertical-align:middle;">
			          			<button type="button" class="btn btn-danger" style="margin-bottom: 5px;">바로구매</button>
				              	<button type="button" class="btn btn-success" style="width: 82px; height: auto">삭제</button>
				            </td>
			          	</tr>
 -->			        
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
			              <th style="text-align: center; vertical-align:middle;">상품금액/(<font id="totalCnt">0</font>개)</th>
			              <th style="text-align: center; vertical-align:middle;"></th>
			              <th style="text-align: center; vertical-align:middle;">배송비</th>
			              <th style="text-align: center; vertical-align:middle;"></th>
			              <th style="text-align: center; vertical-align:middle;">결제 예상금액</th>
			              <th style="text-align: center; vertical-align:middle;">적립예정</th>
			            </tr>
			          </thead>
			          <tbody>
			          	<tr>
			          		<td style="text-align: center; vertical-align:middle;"><h2><font id="totalBook">0</font>원</h2></td>
			          		<td style="text-align: center; vertical-align:middle;"><img alt="" src="images/plus.jpg" width="50" height="45"></td>
			          		<td style="text-align: center; vertical-align:middle;"><h2><font id="totalDelivery">0</font>원</h2></td>
			          		<td style="text-align: center; vertical-align:middle;"><img alt="" src="images/equal.jpg" width="40" height="40"></td>
			          		<td style="text-align: center; vertical-align:middle;"><h2 style="color: red"><font id="totalPrice"> 0</font>원</h2></td>
			          		<td style="text-align: center; vertical-align:middle; color: blue;"><h3 style="color: blue"><font id="totalPoint"> 0</font>P</h3></td>
			          	</tr>
			          </tbody>
			          
			       	</table>
		    	</div>
	       	</div>
	       	<p>
	       	<div class="row">
				<div class="col-xs-12" align="right">
					<form name="frm" id="frm" action="buy.do" method="post">
						<a href="main.do">
						<button type="button" class="btn btn-default btn-lg" style="border-radius: 0px">쇼핑계속하기</button></a>
						<input type="hidden" name="checkedBaguni" id="checkedBaguni" value="">
						<input type="hidden" name="bookcnts" id="bookcnts" value="">
						<input type="hidden" name="buyRoute" id="buyRoute" value="0">
					    <button type="button" class="btn btn-primary btn-lg" style="border-radius: 0px" onclick="fn_checkStock(this.form, 'buySelected')">선택주문</button>
					    <button type="button" class="btn btn-success btn-lg" style="border-radius: 0px" onclick="fn_checkStock(this.form, 'buyAll')">전체상품 주문하기</button>
				    </form>
		    	</div>
	       	</div>
			
		</div><!-- end container  -->
	</main>
	
	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
