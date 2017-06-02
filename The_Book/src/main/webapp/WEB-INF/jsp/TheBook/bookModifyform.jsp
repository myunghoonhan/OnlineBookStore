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
<title>관리자 홈페이지 공지사항 수정</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
</head>
	
	<script type="text/javascript">
	
	
	//공지사항
	function fn_insert() {
	
		var form = {};
		
		form.booknoticeunq = $("#notiunq").val();
		form.booknoticetitle = $("#notititle").val();
		form.booknoticecontent = $("#noticontent").val();
		
		
		if (confirm("공지사항을 등록 하시겠습니까?")) {
	
			$.ajax({
				type : 'POST',
				data : form,
				url : "/bookAddNotice.do",
			
				success : function(data) {
					if (data.result =="ok") {
						alert("등록 되었습니다.");
						location.href = "<c:url value="/bookManagerNotice.do"/>";
					} else {
						alert("등록 실패했습니다. 다시 시도해 주세요.");
					}
				},
				error : function() {
					alert("오류발생 ");
				}
			});
		}
	}
	
	
	

	function fn_notiupdate() {

		
		var form = {};
		form.booknoticeunq = notiform.booknoticeunq.value;
		form.booknoticetitle = notiform.booknoticetitle.value;
		form.booknoticecontent = notiform.booknoticecontent.value;
		
		if (confirm("수정 하시겠습니까?")) {

			$.ajax({
				type : 'POST',
				data : form,
				url : "/booknotiModify.do",
			
				success : function(data) {
					if (data.result > 0) {
						alert("수정 되었습니다.");
						location.href = "<c:url value="/bookManagerNotice.do"/>";
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
	
	
	
	function fn_notidel() {

		var form = {};
		form.booknoticeunq = notiform.booknoticeunq.value;
		
		
		if (confirm("게시글을 삭제 하시겠습니까?")) {

			$.ajax({
				type : 'POST',
				data : form,
				url : "/booknotiDelete.do",
			
				success : function(data) {
					if (data.result > 0) {
						alert("삭제 되었습니다.");
						location.href = "<c:url value="/bookManagerNotice.do"/>";
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
	
	

	function fn_notilist() { 

			document.notiform.action = "/bookManagerNotice.do";
			document.notiform.submit();
	}
	
	</script>
<body>

<jsp:include page="bookManagerheader.jsp"/>
	<form name="notiform" >
		<center>

		
		
			<h1>홈페이지 공지사항 수정 폼</h1>
		<table>
		
			<tr>
				<td>제목</td>
				<td><input type="text" name="booknoticetitle" id="notititle" value="${notidetail.booknoticetitle }"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="booknoticecontent" id="noticontent" >${notidetail.booknoticecontent }</textarea></td>
			</tr>
			
			 <input type="hidden" name="booknoticeunq" value="${notidetail.booknoticeunq }" />
			
		</table>
		<br>
		
		<input type="button" name="mfbtn" value="수정" onclick="fn_notiupdate()"/>
		<input type="button" name="delbtn" value="삭제" onclick="fn_notidel()"/>
		<a href="/bookManagerNotice.do"><input type="button" name="listbtn"  value="목록으로" onclick="fn_notilist()" /></a>
		<br>
		
		</center>
	</form>
	
</body>
</html>

