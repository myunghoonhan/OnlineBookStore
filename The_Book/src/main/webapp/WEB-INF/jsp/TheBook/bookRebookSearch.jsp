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
<script>
$(document).ready(function() {
	var reboGubun = ${reboGubun};
	var radio = document.getElementsByName("optionrebo");
	radio[reboGubun-1].checked=true;
});


function fn_reboGubun(){
	
	var form = document.reboSearch;
	form.reboGubun.value = $(':radio[name="optionrebo"]:checked').val();
	form.method ="post";
	form.action = "/reBookSearch.do";
	
	form.submit();
}
function fn_searchRebookBaguniAdd(bounq ,reboprice , reboname , rebounq){
	if($("#id").val() == ""){
		alert('로그인 하세요');
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

/* 	function fn_2(bounq){
		var form = document.DetailSearch;
		form.bounq.value = bounq;
		alert(form.bounq.value);
		form.method ="post";
		form.action = "/bookSearch.do";
		form.submit();
		
	} */
	

</script>
<body style="display: block;  padding-top: 51px;">

	<jsp:include page="header.jsp">
		<jsp:param value="navbar-fixed-top" name="navbar_style" />
	</jsp:include>
	<main>
		<form name="reboSearch">
		<input type="hidden" name="reboGubun">
		<input type="hidden" name="reboSearchName">
		<input type="hidden" name="id">
		</form>
		<div class="container">
			<div class="row" style="margin-bottom: 5px;">
				<div class="col-xs-12">

				<input type="radio" value="1" name="optionrebo" id="optionrebo" onClick="fn_reboGubun()" />중고등록일순</a>
				<input type="radio" value="2" name="optionrebo" id="optionrebo" onClick="fn_reboGubun()" />최저가순 </a> 
				<input type="radio" value="3" name="optionrebo" id="optionrebo" onClick="fn_reboGubun()" />최고가순</a> 
			
				</div>
			</div>
	      
			<div class="row">
				<div class="col-xs-12">
					<table class="table table-hover">
						<tbody>
					     	<c:forEach var="mainSearchRebook" items="${mainSearchRebook}">
					     	<tr>
								<td style="text-align: center; vertical-align:middle; width: 100px;">
									<a href="bookDetail.do?bounq=${mainSearchRebook.bounq}"><img src="/images/poster/${mainSearchRebook.boimg}" class="img-responsive" alt="Responsive image"></a>
								</td>
								<c:set var="sale" value="${(mainSearchRebook.boprice - mainSearchRebook.reboprice)*100/mainSearchRebook.boprice}"/>
								<%-- <c:set var="sale1" value="${mainSearchRebook.boprice - mainSearchRebook.reboprice}"/> --%>
					
								<td style="vertical-align:middle;"><h4 style="margin-bottom: 0px;">${mainSearchRebook.boname}</h4><br><h5>${mainSearchRebook.boauthor} 지음 | 
									<c:if test="${mainSearchRebook.botrans ne ' ' }">
										${mainSearchRebook.botrans} 옮김 |
									</c:if>
									${mainSearchRebook.bocompany} | ${mainSearchRebook.publish} <br>
									<font color="red"><b>${mainSearchRebook.reboprice}원(	${sale}% 할인)</b></font> | 
									상태: <font color="blue"><b>${mainSearchRebook.rebocondition}</b></font> | 등록일: ${mainSearchRebook.reboregdate}<br>판매자: ${mainSearchRebook.reboid}</h5></td>
								<td style="text-align: center;vertical-align:middle;  width: 200px;">
									<button type="button" class="btn btn-default btn-lg" style="margin-bottom: 10px;" onclick="fn_searchRebookBaguniAdd('${mainSearchRebook.rebobookunq}','${mainSearchRebook.reboprice}' ,'${mainSearchRebook.reboname}','${mainSearchRebook.rebounq}')">장바구니</button><br>
									<button type="button" class="btn btn-default btn-lg" onclick="fn_checkStock('${mainSearchRebook.rebounq }')">바로구매</button>
								</td>
							</tr>
							</c:forEach>
					     </tbody>
					</table>
				</div>
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
