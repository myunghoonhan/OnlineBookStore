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
<title>관리자 영업점 공지사항 수정</title>

<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
		var st =  ${stnotidetail.storenoticestore};
		$("#storenoticestore").val(st).prop("selected", true);
	});

	
	
	//영업점 공지사항 수정
	function fn_stnotiupdate() {

		var form = {};
		
		form.storenoticeunq = document.stnotiform.storenoticeunq.value;
		form.storenoticestore = stnotiform.storenoticestore.value;
		form.storenoticetitle = stnotiform.storenoticetitle.value;
		form.storenoticecontent = stnotiform.storenoticecontent.value;
		form.storenoticeroom = stnotiform.storenoticeroom.value;
		form.sdate=stnotiform.sdate.value;
		form.edate=stnotiform.edate.value; 
		
		if (confirm("수정 하시겠습니까?")) {

			$.ajax({
				type : 'POST',
				data : form,
				url : "/bookstModify.do",
			
				success : function(data) {
					if (data.result > 0) {
						alert("수정 되었습니다.");
						location.href = "<c:url value="/bookMangerStore.do"/>";
					} else {
						alert("수정 실패했습니다. 다시 시도해 주세요.");
					}
				},
				error : function() {
					alert("오류발생 ");
				}
			});
		}
	}
	
	
	
	 function fn_stnotidel() {

		
		var form = {};
		form.storenoticeunq = stnotiform.storenoticeunq.value;
		
		
		if (confirm("게시글을 삭제 하시겠습니까?")) {

			$.ajax({
				type : 'POST',
				data : form,
				url : "/bookstnotiDelete.do",
			
				success : function(data) {
					if (data.result > 0) {
						alert("삭제 되었습니다.");
						location.href = "<c:url value="/bookMangerStore.do"/>";
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
	
	

	 $( function() {
		   $( "#sdate" ).datepicker();
		   $( "#edate" ).datepicker();
		 } );
	</script>
<body>
<jsp:include page="bookManagerheader.jsp"/>

	<form name="stnotiform">
		<center>


			<h1>영업점 공지사항 수정</h1>
			<table>
				<tr>
					
					<td>
						<select name="storenoticestore" id="storenoticestore">
							<option value="2">강남점</option>
							<option value="3">디큐브시티 바로드림센터</option>
							<option value="4">수유점</option>
							<option value="5">잠실점</option>

						</select>
					</td>
				
				<tr>
					<td>제목</td>
					<td><input type="text" name="storenoticetitle" id="stnotititle"  value="${stnotidetail.storenoticetitle}"/></td>
				</tr>
				<tr>
					<td>장소</td>
					<td><input type="text" name="storenoticeroom" id="stnotiroom" value="${stnotidetail.storenoticeroom}"/></td>
					<td>기간</td>
					<td>
							<input type="text" name="sdate" id="sdate" value="${stnotidetail.sbsdate }"/>~
							<input type="text" name="edate" id="edate" value="${stnotidetail.sbedate }"/>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="storenoticecontent" id="stnoticontent">${stnotidetail.storenoticecontent}</textarea></td>
					
				</tr>
				
			
			</table>

			<br> 
			<input type="hidden" name="storenoticeunq" id="storenoticeunq" value="${stnotidetail.storenoticeunq }"/>
		
			<input type="button" name="mfbtn" value="수정" onclick="fn_stnotiupdate()" /> 
			<input type="button" name="delbtn" value="삭제" onclick="fn_stnotidel()" />
			<a href="/bookMangerStore.do"><input type="button" name="listbtn" value="목록으로"/></a>
		</center>
	</form>

</body>
</html>