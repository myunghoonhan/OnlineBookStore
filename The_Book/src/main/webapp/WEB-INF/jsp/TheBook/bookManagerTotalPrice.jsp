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
				 font-size:12pt;
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
			#th1, #td1, #th3, #td3, #th6, #td6, #th7, #td7, #th9, #td9 {
				width: 12em;
			}
			
			#th4, #td4 {
				
			}
			
			#th8, #td8 {
				
			}
			#th10, #td10 {
				
			}
			
			tr {
			
				background-color: #eee;
			}
			#ud {
				background-color:#ffffff
			}
			
				
</style>
<body>
<jsp:include page="bookManagerheader.jsp"/>
<center>
<h1>총 매출 </h1>
<br><br><br>
	<table cellpadding="5" >
		<tr>
			<th>목표금액</th>
			<th>목표달성률</th>
			<th>구매확정 총금액</th>
			<th>구매취소 총금액</th>
		</tr>
		<tr>
			<td>
				<c:set var="goal" value="1000000" />
				<fmt:formatNumber value="${goal }" type="number" />원
			</td>	
			<c:forEach var="list" items="${list }" >
				<c:if test="${list.buydetailcondition eq '구매확정' }">
					<td>
						${ 100 * list.totalprice / goal }%
					</td>
					<td>
						<font color="blue"><b>
						<fmt:formatNumber value="${list.totalprice }" type="number" />원
						</b></font>
					</td>
				</c:if>
				<c:if test="${list.buydetailcondition eq '취소완료' }">
					<td>
						<font color="red"><b>
						<fmt:formatNumber value="${list.totalprice }" type="number" />원
						</b></font>
					</td>
				</c:if>
			</c:forEach>
		</tr>
	</table>
</center>
</body>
</html>