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
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>
</head>

<script>
function fn_UpdateReBook(){
	var form = {};
	form.rebounq = $("#rebounq").val();
	form.fixedPrice = $("#fixedPrice").val();
	$.ajax({
		type: 'POST',
		data: form,
		url: "/UpdateReBook.do",
		
		success: function(data) {
			
			if(data.result > 0) {
				alert("중고도서 가격이 수정되었습니다.");
				opener.fn_Reload();
				self.close();
			} else {
				alert("중고도서 수정에 실패하였습니다.");
			}
		},
		error: function () {
			alert("오류가 발생하였습니다. 관리자에게 문의하십시오.");
		}
	}); 
}
</script>

<body>
	<h2 style="text-align: center">중고도서 정보 수정</h2>
	<form id="frm_UpdateReBook" name="frm_UpdateReBook" action="javascript:fn_UpdateReBook()">
		<table class="table table-bordered" id="target-table" style="margin-bottom: 0px;">
			<thead>
				<tr>
					<th width="30%" style="text-align: center; vertical-align: middle;">표지</th>
					<th width="70%" style="text-align: center; vertical-align: middle;">정보</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td style="text-align: center; vertical-align: middle;">
						<img src="/images/poster/${img}" class="img-responsive" alt="Responsive image" style="width: 200px; height: auto;">
					</td>
					<td style="text-align: center; vertical-align: middle; font-size: 20px;"><br>
					제목: ${name}<br>
					중고가격: ${price}원<br><br>
					희망가격: <input type="number" min="0" placeholder="1000원" id="fixedPrice" name="fixedPrice" style="width: 150px;" required>원<br><br>
					<input type="hidden" id="rebounq" name="rebounq" value="${rebounq}">
					<button type="submit" class="btn btn-success btn-lg" style="margin-top: 0px;">수정하기</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>