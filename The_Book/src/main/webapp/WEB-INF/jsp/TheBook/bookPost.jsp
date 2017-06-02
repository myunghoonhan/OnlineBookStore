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
	function fn_post(){
		var url = "<c:url value='/registerPost.do'/>";
		window.open(url, 'poll', 'width=700, height=500');
	}
	
	function fn_sido(){ //시 선택 -> 군 찾기
		
		var form = {};
		form.sido = $("#sido").val();
		
		$.ajax({
			type: 'POST',
			data: form,
			url: "/registerSido.do",
			
			success: function(data) {
				if(data.sigunList != null){
					$("#sigun").find("option").remove();
					$("#sigun").append("<option value=''>시/군</option>");
					$.each(data.sigunList, function(key, value){
						$("#sigun").append("<option value='"+value.sigun+"'>"+value.sigun+"</option>");
					});
				}
				if(data.sigunList == null){
					alert("실패");
				}
			},
			error: function () {
				alert(" 오류발생 ");
			}
		}); 
	}
	
	function fn_find() {  //상세주소검색
		var form = {};
		form.sido = $("#sido").val();
		form.sigun = $("#sigun").val();
		form.dong = $("#dong").val();
			
		$.ajax({
			type: 'POST',
			data: form,
			url: "/registerFindAddr.do",
			
			success: function(data) {
				if(data.addrList != null) {
					$("#addr").find("#addrTxt").remove();
					$("#addr").find("a").remove();
					$("#addr").find("br").remove();
					$.each(data.addrList, function(key, value){
						
						if(value.ri == null){
							value.ri = "";
						}
						if(value.bunji == null){
							value.bunji = "";
						}
						if(value.others == null){
							value.others = "";
						}
						var TotalAddr = value.sido+" "
							+value.sigun+" "
							+value.dong+" "
							+value.ri+" "
							+value.bunji+" "
							+value.others+" ";
						
						$("#addr").append("<a href='#' onClick=fn_send("+value.unq+","+value.post+")>"+TotalAddr+"</a><br>");
					});
					
				} else {
					alert("실패.");
				}
			},
			error: function () {
				alert("회원가입 오류발생 ");
			}
		}); 
	}
	var addr1;
	
	function fn_send(unq, zip){
		
		var form = {};
		form.unq = unq;
			
		$.ajax({
			type: 'POST',
			data: form,
			url: "/registerFindFromUnq.do",
			
			success: function(data) {
				
				if(data.addr1 != null) {
					addr1= data.addr1;
					opener.fn_writepost(addr1, zip);
					opener.fn_writepost1(addr1, zip);
					self.close();
				} else {
					alert("우편번호 검색 실패");
				}
			},
			error: function () {
				alert("우편번호 오류");
			}
		}); 
	}
</script>

<body>
	<center>
		<h2>주소검색</h2>
		<form id="frm" name="frm" method="post">
			<table width="500" border="1">
				<tr height="40">
					<td align="center" width="200">
						<select name="sido" id="sido" onchange="fn_sido()">
							<option value="">시/도</option>
							<option value="서울특별시">서울특별시</option>
							<option value="강원도">강원도</option>
							<option value="경기도">경기도</option>
							<option value="경상남도">경상남도</option>
							<option value="경상북도">경상북도</option>
							<option value="광주광역시">광주광역시</option>
							<option value="대구광역시">대구광역시</option>
							<option value="대전광역시">대전광역시</option>
							<option value="부산광역시">부산광역시</option>
							<option value="세종특별자치시">세종특별자치시</option>
							<option value="울산광역시">울산광역시</option>
							<option value="인천광역시">인천광역시</option>
							<option value="전라남도">전라남도</option>
							<option value="전라북도">전라북도</option>
							<option value="제주특별자치도">제주특별자치도</option>
							<option value="충정남도">충정남도</option>
							<option value="충정북도">충정북도</option>
						</select>
						
						<select name="sigun" id="sigun">
							<option value="">시/군</option>
						</select>
						
						<input type="text" name="dong" id="dong" size="20"><input type="button" value="검색" onClick="fn_find()">
					</td>
				</tr>
				
				<tr height="40">
					<td name="addr" id="addr" align="center" width="200">
						<div name="addrTxt" id="addrTxt">주소를 검색하십시오</div>
						<input type="hidden" name="aa" id="aa">
					</td>
				</tr>
				
			</table>
		</form>
	</center>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>