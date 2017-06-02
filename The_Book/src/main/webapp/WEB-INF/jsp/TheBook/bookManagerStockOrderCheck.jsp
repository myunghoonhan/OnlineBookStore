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

<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>

<title>Insert title here</title>
</head>
	<style type="text/css">
			table {
				font-family: "Lato", "sans-serif";
				 font-size:10pt
			} /* added custom font-family  */
			table.one {
				margin-bottom: 3em;
				border-collapse: collapse;
			}
			td { /* removed the border from the table data rows  */
				text-align: center;
				width: 10em;
			}
			
			th { /* removed the border from the table heading row  */
				text-align: center;
				width: 10em;
				padding: 1em;
				background-color: #e8503a;
				/* text-align: center;                
					padding: 1em;
					background-color: #e8503a;       /* added a red background color to the heading cells  */
				color: white;
				*/
			} /* added a white font color to the heading text */
			#th1, #td1,#th7, #td7 {
				width: 5em;
			}
			
			#th2, #td2{
				width:15em;
			}
			#th4, #td4{
				width:15em;
			}
			tr {
			
				background-color: #eee;
			}
			#ud {
				background-color:#ffffff
			}
			

				
</style>
<script type="text/javascript">

	$(document).ready(function(){
		
		var storeorderstoreunq = $("#ssu").val();
		$("input:radio[name='storeorderstoreunq'][value='" + storeorderstoreunq + "']").prop('checked', true);
		
		var seltype = $("#st").val();
		$("#seltype").val("" + seltype + "").prop('selected', true);
		
		var selname = $("#sn").val();
		$("#selname").val(selname);
		
		var storeordercheck = $("#soc").val();
		$("input:radio[name='storeordercheck'][value='" + storeordercheck + "']").prop('checked', true);
		
	});
	
	function fn_search(form){
		
		form.submit();
	}
	
	function fn_baljuCheck(orderunq, orderstock, orderbounq, stock){
		
		var stock = Number(stock);
		var orderstock = Number(orderstock);
		
		if(stock < orderstock){
			alert('재고가 부족합니다.')
			return;
		}
		
		var form = {};
		form.storeorderunq = orderunq;
		form.buydetailcnt = orderstock;
		form.buydetailbookunq = orderbounq;
	
		$.ajax({
			type : 'POST',
			data : form,
			url : "/managerStockOrderCheckSend.do",

			success : function(data) {
				if (data.result > 0 && data.result2 > 0) {
					alert("발주 수리가 완료되었습니다.");
					location.href = "<c:url value="/managerStockOrderCheck.do"/>";
				}else {
					alert("발주 수리를 실패했습니다. 다시 시도해 주세요.");
				}
			},
			error : function() {
				alert("오류발생 ");
			}
		});
	}

</script>


<body>
<jsp:include page="bookManagerheader.jsp"/>
<center>
<h1>발주 요청 리스트</h1>
<form id="frm" name="frm" action="managerStockOrderCheck.do" method="post">
	<br><br><br>
	<input type="radio" name="storeorderstoreunq" value="1">전체 &nbsp;&nbsp;
	<input type="radio" name="storeorderstoreunq" value="2">강남점 &nbsp;&nbsp;
	<input type="radio" name="storeorderstoreunq" value="3">디큐브시티 바로드림센터 &nbsp;&nbsp;
	<input type="radio" name="storeorderstoreunq" value="4">수유점 &nbsp;&nbsp;
	<input type="radio" name="storeorderstoreunq" value="5">잠실점
	
	<br><br>
	<input type="radio" name="storeordercheck" id="storeordercheck0" value="0">전체 &nbsp;
	<input type="radio" name="storeordercheck" id="storeordercheck1" value="1">확인 &nbsp;
	<input type="radio" name="storeordercheck" id="storeordercheck2" value="2">미확인 &nbsp;
	<select name="seltype" id="seltype">
		<option value="">선택하세요</option>
		<option value="storeorderbounq">도서번호</option>
		<option value="boname">도서제목</option>
	</select>
	<input type="text" size="30" name="selname" id="selname">
	<input type="button" name="selbtn" id="selbtn" value="검색" onclick="fn_search(this.form)">
</form>
	
	<br><br><br>
	<table cellpadding="5">
		<tr>
			<th id="th1">도서번호</th>
			<th id="th2">도서제목</th>
			<th id="th3">출판사</th>
			<th id="th4">영업점이름</th>
			<th id="th5">재고현황</th>
			<th id="th6">발주수량</th>
			<th id="th7">상태</th>
			<th></th>
		</tr>
				
		<c:forEach var="list" items="${list }">
		<form action="managerStockOrder.do" method="post">
			<tr>
				<td id="td1">${list.storeorderbounq }</td>
				<td id="td2">${list.boname }</td>
				<td id="td3">${list.bocompany }</td>
				<td id="td4">${list.storeorderstoreunq }</td>
				<td id="td5">
					<font color="orange"><b>${list.stockstock }</b></font>
				</td>
				<td>${list.storeorderstock }</td>
				<td id="td6">
					<c:if test="${list.storeordercheck eq '미확인'}">
						<font color="red"><b>미확인</b></font>
						</td>
						<td>
							<input type="button" value="발주수리" onclick="fn_baljuCheck('${list.storeorderunq }', '${list.storeorderstock }', '${list.storeorderbounq }', '${list.stockstock }')">
						</td>
					</c:if>
					<c:if test="${list.storeordercheck eq '확인'}">
						<font color="blue"><b>확인</b></font>
						</td>
						<td>
						</td>
					</c:if>
				
				
			</tr>
		</form>
		</c:forEach>

	</table>
	<input type="hidden" name="ssu" id="ssu" value="${stockstoreunq }">
	<input type="hidden" name="st" id="st" value="${seltype }">
	<input type="hidden" name="sn" id="sn" value="${selname }">
	<input type="hidden" name="soc" id="soc" value="${storeordercheck }">

</center>
</body>
</html>