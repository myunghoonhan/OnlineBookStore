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
			#th1, #td1, #th2, #td2, #th7, #td7 {
				width: 5em;
			}
			
			#th3, #td{
				width:20em;
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
		
		var stockstoreunq = $("#ssu").val();
		$("input:radio[name='stockstoreunq'][value='" + stockstoreunq + "']").prop('checked', true);
		
		var seltype = $("#st").val();
		$("#seltype").val("" + seltype + "").prop('selected', true);
		
		var selname = $("#sn").val();
		$("#selname").val(selname);
		
	});
	
	function fn_search(form){
		
		form.submit();
	}
	
	function fn_balju(form){
		
		form.submit();
	}

</script>


<body>

<jsp:include page="bookManagerheader.jsp"/>
<center>
<h1>영업점별 발주 요청</h1>
<form id="frm" name="frm" action="managerStockList.do" method="post">
	<br><br><br>
	<input type="radio" name="stockstoreunq" value="1">전체 &nbsp;&nbsp;
	<input type="radio" name="stockstoreunq" value="2">강남점 &nbsp;&nbsp;
	<input type="radio" name="stockstoreunq" value="3">디큐브시티 바로드림센터 &nbsp;&nbsp;
	<input type="radio" name="stockstoreunq" value="4">수유점 &nbsp;&nbsp;
	<input type="radio" name="stockstoreunq" value="5">잠실점
	
	<br><br>
	<select name="seltype" id="seltype">
		<option value="">선택하세요</option>
		<option value="bounq">도서번호</option>
		<option value="boname">도서제목</option>
	</select>
	<input type="text" size="30" name="selname" id="selname">
	<input type="button" name="selbtn" id="selbtn" value="검색" onclick="fn_search(this.form)">
</form>
	
	<br><br><br>
	<table width="1500"  cellpadding="3" cellspacing="3">
		<tr>
			<th id="th1">도서번호</th>
			<th id="th2">분류번호</th>
			<th id="th3">도서제목</th>
			<th id="th4">저자</th>
			<th id="th5">출판사</th>
			<th id="th6">영업점이름</th>
			<th id="th7">재고수량</th>
			<th id="th8"></th>
		</tr>
				
		<c:forEach var="list" items="${list }">
		<form action="managerStockOrder.do" method="post">
			<tr>
				<td id="td1">${list.bounq }</td>
				<td  id="td2">${list.bocode }</td>
				<td  id="td3">${list.boname }</td>
				<td  id="td4">${list.boauthor }</td>
				<td  id="td5">${list.bocompany }</td>
				<td  id="td6">${list.stockstoreunq }</td>
				<td  id="td7" >${list.stockstock }</td>
				<td id="td8">
					<input type="hidden" name="storeorderbounq" id="storeorderbounq" value="${list.bounq }">
					<input type="hidden" name="bookname" id="bookname" value="${list.boname }">
					<input type="button" name="balju" id="balju" value="발주하기" onclick="fn_balju(this.form)">
				</td>
			</tr>
		</form>
		</c:forEach>

	</table>
	<input type="hidden" name="ssu" id="ssu" value="${stockstoreunq }">
	<input type="hidden" name="st" id="st" value="${seltype }">
	<input type="hidden" name="sn" id="sn" value="${selname }">

</center>
</body>
</html>