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
 <style>


  
input, textarea { 
    padding: 5px; 
    border: solid 1px #E5E5E5; 
    outline: 0; 
    font: normal 13px/100% Verdana, Tahoma, sans-serif; 
    width: 200px; 
   
    box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 
    -moz-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 
    -webkit-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 
    } 
   
textarea { 
    width: 400px; 
    max-width: 400px; 
    height: 150px; 
    line-height: 150%; 
    } 
   
input:hover, textarea:hover, 
input:focus, textarea:focus { 
    border-color: #C9C9C9; 
    -webkit-box-shadow: rgba(0, 0, 0, 0.15) 0px 0px 8px; 
    } 
   
.form label { 
    margin-left: 10px; 
    color: #999999; 
    padding : 5px;
    } 
   
.submit input { 
    width: auto; 
    padding: 9px 15px; 
    background: #617798; 
    border: 0; 
    font-size: 14px; 
    color: #FFFFFF; 
    -moz-border-radius: 5px; 
    -webkit-border-radius: 5px; 
    }
   </style>
<script type="text/javascript">

	function fn_baljuInsert(){
		if($("#storeorderstoreunq").val() == ""){
			alert('영업점을 선택해주세요.');
			return;
		}
		if($("#storeorderstock").val() == 0 || $("#storeorderstock").val() == ""){
			alert('주문수량을 입력해주세요.');
			return;
		}
		var form = {};
		form.storeorderstoreunq = $("#storeorderstoreunq").val();
		form.storeorderbounq = $("#storeorderbounq").val();
		form.storeorderstock = $("#storeorderstock").val();
	
		$.ajax({
			type : 'POST',
			data : form,
			url : "/managerStockOrderInsert.do",

			success : function(data) {
				if (data.result == "ok") {
					alert("발주가 완료되었습니다.");
					location.href = "<c:url value="/managerStockOrderList.do"/>";
				}else {
					alert("발주요청을 실패했습니다. 다시 시도해 주세요.");
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
<h1>발주 요청</h1>

	<table cellpadding="5"  style="background-color:#FAFAFA">
		<tr>
			<br><br><br>
			<th>영업점</th>
			<td>
				<select name="storeorderstoreunq" id="storeorderstoreunq">
					<option value="">선택해주세요</option>
					<option value="2">강남점</option>
					<option value="3">디큐브시티 바로드림센터</option>
					<option value="4">수유점</option>
					<option value="5">잠실점</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>도서제목</th>
			<td>
				<input type="text" value="${bookname }" readonly="readonly">
				<input type="hidden" name="storeorderbounq" id="storeorderbounq" value="${bookunq }">
			</td>
		</tr>
		
		<tr>
			<th>주문수량</th>
			<td>
				<input type="number" id="storeorderstock" name="storeorderstock">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="발주요청" onclick="fn_baljuInsert()">
			</td>
		</tr>
	</table>
</center>
</body>
</html>