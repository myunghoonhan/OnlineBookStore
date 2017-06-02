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
<title>관리자 책 리스트</title>
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
			#th1, #td1,#th2, #td2, #th8, #td8, #th9, #td9 {
				width: 5em;
			}
			
			#th3, #td3{
				width:17em;
			}
			#th4, #td4{
				width:12em;
			}
			tr {
			
				background-color: #eee;
			}
			#ud {
				background-color:#ffffff
			}
			

				
</style>
<script type="text/javascript">
	
		function fn_update(form){ // 수정하기 폼 넘김
			
			form.action = "/bookinfoform.do";
			form.submit();		
		}
		
		
		function fn_newbook(){  //아직컨트롤러안만듬
			
			document.bookform.action = "/bookAddform.do";
			document.bookform.submit();
		}
		
		
		function fn_search(){ 	// 검색하기
			
			var f = document.bookform;
			
			 if(f.search.value == "" ){
				alert("항목을 선택해 주세요");
			
			}else{
				f.action = "/bookList.do";
				f.submit();
			}
		}

	
	
		function fn_delete(dform) {

		
		var form = {};
		form.bounq = dform.bounq.value;
		form.stockbook= dform.bounq.value;
		
		if (confirm("게시글을 삭제 하시겠습니까?")) {

			$.ajax({
				type : 'POST',
				data : form,
				url : "/bookDelete.do",
			
				success : function(data) {
					if (data.result > 0 && data.result1 >0 ) {
						alert("삭제 되었습니다.");
						location.href = "<c:url value="/bookList.do"/>";
					} else {
						alert("삭제 실패했습니다. 다시 시도해 주세요.");
					}
				},
				error : function() {
					alert("오류발생 ");
				}
			});
		}
	} 
	
	
</script>
<body>
<jsp:include page="bookManagerheader.jsp"/>

	<form:form commandName="bookVO" id="bookform" name="bookform" method="post">
		<center>
		<h1>상품 관리</h1>
			<br><br><br> 
			<select name="search" id="search">
				<option value="">선택해주세요</option>
				<option value="boname">제목</option>
				<option value="boauthor">저자</option>
				<option value="bocompany">출판사</option>
			</select> 
			<input type="text" id="name" name="name"  placeholder="검색어를 입력해주세요" />
			<input type="button" id="srcbtn" name="srcbtn" value="검색하기" onClick="fn_search()">
			<a href="/bookList.do"><input type="button" id="all" name="all" value="전체목록보기"></a>
			<input type="button" name="nbook" value="책 등록" onClick="fn_newbook()">
			

		<br><br><br><br>
		
		
			<table width="1500" cellpadding="5">
				<tr>
				
					<th id="th1">분류번호</th>
					<th id="th2">도서번호</th>
					<th id="th3">제목</th>
					<th id="th4">저자</th>
					<th id="th5">출판사</th>
					<th id="th6">가격</th>
					<th id="th7">출간일</th>
					<th id="th8">재고</th>
					<th id="th9">판매량</th>
		
				</tr>

				<c:forEach var="book" items="${booklist}" varStatus="status">
					<form name="dform" id="dform"  method="post">
					<tr >
						<td id="td1" >${book.bocode}</td>
						<td id="td2" >${book.bounq}</td>
						<td id="td3">${book.boname}</td>
						<td id="td4">${book.boauthor}</td>
						<td id="td5">${book.bocompany}</td>
						<td id="td6">${book.boprice}</td>
						<td id="td7">${book.bopublish}</td>
						<td id="td8" id="stockstock" name="stockstock" value="${book.stockstock}">${book.stockstock}</td>
						<td id="td9">${book.bototal}</td>
					 	<td id="ud">
					 	<input type="hidden" name="bounq" id="bounq" value="${book.bounq }" />
						<input type="button" value="수정" onClick="fn_update(this.form)" /> <!-- 안에내용뿌려조 -->
						<input type="button" value="삭제" onClick="fn_delete(this.form)" /></td>
						
					</tr> 
						
					
					</form>
				</c:forEach>
			</table>
		</center>
	</form:form>
</body>
</html>
