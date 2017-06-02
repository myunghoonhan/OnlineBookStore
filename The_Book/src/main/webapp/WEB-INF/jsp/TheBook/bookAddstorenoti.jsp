
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
<title>관리자 영업점 공지사항 등록</title>

<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	
	
	//영업점 공지사항 등록
	function fn_stinsert() {
	
		var form = {};
		
	 //영업점 공지사항 unq
		form.storenoticestore = $("#storenoticestore").val(); //영업점 unq
		form.storenoticetitle = $("#stnotititle").val(); 
		form.storenoticecontent = $("#stnoticontent").val();
		form.storenoticeroom = $("#stnotiroom").val(); //장소
		form.sdate=$("#sdate").val(); //시작날짜
		form.edate=$("#edate").val();//끝나는날짜
		form.storenoticeing = $("#stnotiing").val(); //기간
		//form.storenoticeregdate = $("#stnotiregdate").val(); //등록날짜
		
		if (confirm("영업점 공지사항을 등록 하시겠습니까?")) {
	
			$.ajax({
				type : 'POST',
				data : form,
				url : "/bookAddstnotice.do",
			
				success : function(data) {
					if (data.result =="ok") {
						alert("등록 되었습니다.");
						location.href = "<c:url value="/bookMangerStore.do"/>";
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
	
	
	function fn_stnolist(){
		
		
		document.stnotiform.action = "/bookMangerStore.do";
		document.stnotiform.submit();
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


			<h1>영업점 공지사항 등록</h1>
			<br><br><br>
			<table style="background-color:#FAFAFA"; cellpadding="10">
				<tr>
				<td>지점 : </td>
					
					<td>
						<select name="storenoticestore" id="storenoticestore">
							<option value="2">강남점</option>
							<option value="3">디큐브시티 바로드림센터</option>
							<option value="4">수유점</option>
							<option value="5">잠실점</option>

						</select>
					</td>
				</tr>
				
				<tr>
					<td>제목 : </td>
					<td><input type="text" name="storenoticetitle" id="stnotititle" /></td>
				</tr>
				<tr>
					<td>장소 : </td>
					<td><input type="text" name="storenoticeroom" id="stnotiroom" /></td>
					<td>기간 : </td>
					<td><input type="text" name="sdate" id="sdate"/>~<input type="text" name="edate" id="edate"/></td>
				</tr>
				<tr>
					<td>내용 : </td>
					<td><textarea name="storenoticecontent" id="stnoticontent"></textarea></td>
					
				</tr>
				
			
			</table>
		
			<br> <input type="button" name="okbtn" value="등록하기" onclick="fn_stinsert()" /> 
			<a href="/bookMangerStore.do"><input type="button" name="listbtn" value="목록으로" /></a>
		</center>
	</form>





</body>
</html>