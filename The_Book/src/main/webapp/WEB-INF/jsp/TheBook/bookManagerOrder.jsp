
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bookManagerOrder</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
			#th1, #td1, #th3, #td3, #th6, #td6, #th7, #td7, #th9, #td9 {
				width: 12em;
			}
			
			#th4, #td4 {
				width: 50em;
			}
			
			#th8, #td8 {
				width: 12em;
			}
			#th10, #td10 {
				width: 20em;
			}
			
			tr {
				height: 1em;
				background-color: #eee;
			}
			
			/* /* 
					table tr:nth-child(even) {            /* added all even rows a #eee color  
					    background-color: #eee;     }
					table tr:nth-child(odd) {            /* added all odd rows a #fff color  
					background-color:#fff;      } */
	
	</style>
	<script type="text/javascript">
	
		
		function fn_search(){ 	// 검색하기
			
			var f = document.srcform;
			
			 if(f.searchtype.value == "" ){
				alert("항목을 선택해 주세요");
			
			}else{
				f.action = "/bookManagerOrder.do";
				f.submit();
			}
		}
		
		function fn_all(){	//전체목록보기
			
			document.srcform.action = "/bookManagerOrder.do";
			document.srcform.submit();
		}
		
		
			
			function fn_update(idform) {

				var form = {};
				form.buydetailbuyunq = idform.buydetailbuyunq.value;
				form.buydetailcondition = idform.buydetailcondition.value;
				
				if (confirm("변경 하시겠습니까?")) {

					$.ajax({
						type : 'POST',
						data : form,
						url : "/bookMgcdupdate.do",
					
						success : function(data) {
							if (data.result > 0) {
								alert("변경 하였습니다.");
								location.href = "<c:url value="/bookManagerOrder.do"/>";
							} else {
								alert("변경 실패했습니다. 다시 시도해 주세요.");
							}
						},
						error : function() {
							alert("오류발생 ");
						}
					});
				}
			}
			
			
	
			

//////////////구매취소 -> 취소신청중


	</script>
<body>
<jsp:include page="bookManagerheader.jsp"/>

	<form:form commandName="orderVO" id="srcform" name="srcform" method="post">
		<center>
		<h1>배송관리</h1>
			<br><br><br>
			<select name="searchtype" id="searchtype">
				<option value="">선택해주세요</option>
				<option value="buydetailbuyunq">구매번호</option>
				<option value="buyid">아이디</option>
				<option value="buydetailbookname">도서명</option>
				<option value="buydetailcondition">배송여부</option>
			</select> 
			<input type="text" id="searchname" name="searchname"  value="" />
			<input type="button" id="srcbtn" name="srcbtn" value="검색하기" onClick="fn_search()">
			<input type="button" id="all" name="all" value="전체목록보기" onClick="fn_all()">

		<br><br><br><br>
		
		
			<table width="1300" cellpadding="5">
				<tr>
					<th id="th1">구매번호</th>
					<th>아이디</th>
					<th id="th3">도서번호</th>
					<th id="th4">도서명</th>
					<th id="th6">주문수량</th>
					<th id="th7">총 금액</th>
					<th id="th8">주문완료일</th>
					<th id="th9">배송여부</th>
					<th id="th10">배송여부 선택</th>
					<th>확인</th>
				</tr>
				
				<c:forEach var="order" items="${orderList}" varStatus="status">
				
					<tr>
					<form name="idform" id="idform">
						<td id="td1">${order.buydetailbuyunq }</td>  <!-- 구매번호 -->
						<td>${order.buyid }</td>
						<td id="td3">${order.buydetailbookunq }</td>
						<td id="td4">${order.buydetailbookname }</td>
						<td id="td6">${order.buydetailcnt }</td>
						<td id="td7"><fmt:formatNumber value="${order.buydetailtotalprice }" type="number" />원</td>
						<td id="td8">${order.buyregdate }</td>
						<td id="td9" >${order.buydetailcondition }</td>
						<td id="td10"><select name="buydetailcondition" id="buydetailcondition">
								<option value="결제완료">결제완료</option>
								<option value="상품준비중">상품준비중</option>
								<option value="배송중">배송중</option>
								<option value="배송완료">배송완료</option>
								<option value="구매확정">구매확정</option>
								<option value="취소신청중">취소신청중</option>
								<option value="취소완료">취소완료</option>
						</select></td>
						
					<td>	
					
						<input type="button" value="확인" onClick="fn_update(this.form)" />
						<input type="hidden" name="buydetailbuyunq" id="buydetailbuyunq" value="${order.buydetailbuyunq }" />
					
					</td>
					</form>
					</tr>
					
						

				</c:forEach>
			</table>
		</center>
	</form:form>
	
</body>
</html>


