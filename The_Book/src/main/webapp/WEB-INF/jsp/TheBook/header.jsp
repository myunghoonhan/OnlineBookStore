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
<link rel="stylesheet" href="/css/style.css"><!--홈페이지 CSS  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"><!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"><!-- Bootstrap CSS -->
<script type="text/javascript"	src="/js/jquery-2.1.0.min.js"></script>
</head>

<script>
	$(function() {
		fn_GetCartCnt();
	});

	$(function() {
		$(".modal").on("hidden.bs.modal", function(){
		    $(this).find('form')[0].reset();
		});
		document.getElementById('memzip_reg').value="";
		document.getElementById('memaddr1_reg').value="";
		$("#target-table").rowspanizer({
			cols : [0, 4],
		    vertical_align: "middle"
		});
	});
	
	function fn_GetCartCnt(){
		var form = {};
		$.ajax({
			type: 'POST',
			data: form,
			url: "/baguniCnt.do",
			
			success: function(data) {
				if(data.result > 0) {
					$("#cartCnt").text(data.result);
				}
			},
			error: function () {
			}
		}); 
	}
	
	/* $(document).ready(function() {
		var searchCode = ${searchCode};
		var select = document.getElementsByName("selected");
		select.checked;
	});
	 */
	function fn_search(){
		var form = document.mainSearch;
		form.searchName.value = $("#searchName").val();
		form.searchCode.value = $("#searchCode option:selected").val();
		
		if(form.searchCode.value == 10){
		
		form.gubun.value = '1';
		form.method ="post";
		form.action = "/bookSearch.do";
		form.submit();
		}
		else if(form.searchCode.value ==20){
		
			form.gubun.value = '1';
			form.method ="post";
			form.action = "/bookSearch.do";
			form.submit();
		}
		else if(form.searchCode.value ==30){
		form.reboSearchCode.value = '30';
		form.reboSearchName.value = $("#searchName").val();
		form.reboGubun.value = '1';
		form.method ="post";
		form.action = "/reBookSearch.do";
		form.submit();
		}
	}
	
		
//  ajax 		
/* 	function fn_search(){
		var form = {};
		form.searchName = $("#searchName").val();
		form.searchCode = $("#searchCode option:selected").val();
		
			$.ajax({
			
			type: 'POST',
			data: form,
			url: "/bookSearch.do",
			success: function(data) {
				location.href = "<c:url value='/bookSearchMain.do?levelname="+data.levelname+"'/>";
			},	
			error: function () {
				alert(" 오류발생 ");
			}
		});
	} */
	
/* 	function fn_login(){
		
		var form = {};
		form.memid = document.frm_login.memid.value;
		form.mempwd = document.frm_login.mempwd.value;
			
		$.ajax({
			type: 'POST',
			data: form,
			url: "/bookLogin.do",
			
			success: function(data) {
				
				if(data.result == 0) {
					location.reload(true);
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				}
			},
			error: function () {
				alert("계정이 존재하지 않습니다.");
			}
		}); 
	} */
	
	function fn_login(){
		
		var form = {"memid" : document.frm_login.memid.value, "mempw" : document.frm_login.mempwd.value};
		
		$.ajax({
			type: 'POST',
			url: "/bookLogin.do",
			dataType: "json",
			data: form,
			
			success: function(data) {
				
				if(data.result == 0) {
					location.reload(true);
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				}
			},
			error: function () {
				alert("계정이 존재하지 않습니다.");
			}
		}); 
	}
	
	function fn_logout(){
		
		var form = {};
		$.ajax({
			type: 'POST',
			data: form,
			url: "/bookLogOut.do",
			
			success: function(data) {
				if(data.result == "ok") {
					location.reload(true);
				} else {
					alert("로그아웃 실패");
					location.reload(true);
				}
			},
			error: function () {
				alert("로그아웃 오류");
				location.reload(true);
			}
		}); 
	}
	
	var getIdChecked = 0; /*0:불가능 1:사용가능*/
	var isIdChecked = 0; /*0:미실행 1:실행*/
	
	function fn_regist(frm){
		
		if(isIdChecked==0){
			alert("아이디 중복체크를 하십시오.");
		}else if(isIdChecked==1 && getIdChecked==0){
			alert("이미 사용중인 아이디 입니다.");
			$("#memid_reg").focus();
		}else if(frm.membirthYear_reg.value == "" || frm.membirthMonth_reg.value == "" || frm.membirthDay_reg.value == ""){
			alert("생년월일을 선택하여 주십시오.");
		}else if(isIdChecked==1 && getIdChecked==1){
			
			var form = {};
			form.memid = frm.memid_reg.value;
			form.mempwd = frm.mempwd_reg.value;
			form.memname = frm.memname_reg.value;
			form.memsex = frm.memsex_reg.value;
			form.membirth = frm.membirthYear_reg.value +"."+ frm.membirthMonth_reg.value +"."+ frm.membirthDay_reg.value;
			form.memphone = frm.memphone1_reg.value +"-"+ frm.memphone2_reg.value +"-"+ frm.memphone3_reg.value;
			form.mememail = frm.mememail_reg.value;
			form.memzip = frm.memzip_reg.value;
			form.memaddr1 = frm.memaddr1_reg.value;
			form.memaddr2 = frm.memaddr2_reg.value;
			form.memfavorite = frm.memfavorite_reg.value;
				
			$.ajax({
				type: 'POST',
				data: form,
				url: "/bookRegister.do",
				
				success: function(data) {
					if(data.result == "ok") {
						alert("회원가입에 성공하셨습니다. 로그인 후 이용가능 합니다.");
						location.reload(true);
					} else {
						alert("회원가입에 실패하였습니다. 다시 시도하여 주십시오.");
					}
				},
				error: function () {
					alert("회원가입 도중 오류발생. 다시 시도하여 주십시오.");
					location.reload(true);
				}
			});
		}
	}
	
	function fn_registIdCheck(){
		
		if( $("#memid_reg").val() == "" ){
			alert("아이디를 입력하십이오.");
			$("#memid_reg").focus();
		}else{
			var form = {};
			form.memid = document.frm_regist.memid_reg.value;
			
			$.ajax({
				type: 'POST',
				data: form,
				url: "/bookRegisterIdCheck.do",
				
				success: function(data) {
					if(data.cnt == 0) {
						alert("사용가능한 아이디 입니다.");
						getIdChecked = 1;
						isIdChecked = 1;
					} else {
						alert("이미 사용중인 아이디 입니다.");
						getIdChecked = 0;
						isIdChecked = 1;
					}
				},
				error: function () {
					alert("아이디 확인 도중 오류발생. 다시 시도하여 주십시오.");
					location.reload(true);
				}
			});
		}
	}
	
	function fn_Post(){
		var url = "<c:url value='/bookPost.do'/>";
		window.open(url, 'poll', 'width=700, height=500');
	}
	
	function fn_writepost(addr1, zip){
		var memzip_reg = zip.toString();
		document.getElementById ('memaddr1_reg').value=addr1;
		document.getElementById ('memzip_reg').value=memzip_reg.substring(0,3)+'-'+memzip_reg.substring(3);
	}
</script>
<body>
	<form name="mainSearch">
		<input type="hidden" name="searchCode">
		<input type="hidden" name="searchName">
		<input type="hidden" name="reboSearchCode">
		<input type="hidden" name="reboSearchName">
		<input type="hidden" name="reboGubun">
		<input type="hidden" name="gubun">		
	</form>
	<header> 
		<nav id="header_navbar_default" class="navbar navbar-default ${param.navbar_style}" role="navigation" style="margin-bottom: 0px;">
			<div class="container-fluid">
		
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="main.do"> <img class="img_index" alt="Brand" src="/images/thebooklogo_banner.png">
					</a>
				</div>
		
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-left">
					
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">영업점 안내<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="bookStoreInfo.do?storeunq=2">강남점</a></li>
								<li><a href="bookStoreInfo.do?storeunq=3">디큐브시티점</a></li>
								<li><a href="bookStoreInfo.do?storeunq=4">수유점</a></li>
								<li><a href="bookStoreInfo.do?storeunq=5">잠실점</a></li>
							</ul>
						</li>
						<c:if test="${sessionScope.session_memid == 'master' }">
							<li><a href="bookManagerOrder.do">관리자 페이지</a></li>
						</c:if>
					</ul>
					
					<ul class="nav navbar-nav navbar-right">
						
						<c:if test="${sessionScope.session_memid != null }">
							<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false"> ${session_memid} 님 <span class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="bookMyPage.do">마이페이지</a></li>
								</ul></li>
							<li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="fn_logout()">로그아웃</a></li>
						</c:if>
		
						<c:if test="${sessionScope.session_memid==null }">
							<li><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
							<li><a href="#" data-toggle="modal" data-target="#registerModal">회원가입</a></li>
						</c:if>
						<li><a href="bookgogekNotice.do">고객센터</a></li>
						<c:if test="${sessionScope.session_memid != null }">
							<li><a href="bookMyPage.do">주문배송</a></li>
							<li><a href="baguni.do" style="padding-left: 0px;"><img src="/images/cart.png" style="width: 20px; height: 20px;"><span class="badge" id="cartCnt" style="background-color: red"></span></a></li>
						</c:if>
					</ul>
		
				</div>
				<!-- /.navbar-collapse -->
			</div>
		</nav> 
		
		<div class="container">
		
			<div class="row">
				<div class="col-xs-3">
					<a href="main.do">
						<img src="/images/thebooklogo2.jpg" class="img-responsive" alt="Responsive image"  style="margin: 0 auto;">
					</a>
				</div>
				<div class="col-xs-6" style="padding-top: 5%;">
						
					<div class="input-group input-group-lg">
						<span class="input-group input-group-lg" style="display: table-cell; width: 130px;">
							<select id="searchCode" name="searchCode" class="form-control" style="font-weight: bold;">
								<option value="10" id="selected" name="selected">국내도서</option>
								<option value="20" id="selected" name="selected">외국도서</option>
								<option value="30" id="selected" name="selected">중고도서</option>
							</select>
						</span>	
						<input type="text" class="form-control" id="searchName" name="searchName" placeholder="검색어를 입력하십시오" style="border-radius: 0px;">
						<span class="input-group-btn">
							<button class="btn btn-primary btn-lg" type="button" style="border-radius: 0px" onclick="fn_search()">검색</button>
						</span>
					</div>
					
				</div>
				<div class="col-xs-3" style="background-color: ">
					<a href="#">
						<!-- <img src="/images/kyobo.jpg" class="img-responsive" alt="Responsive image"  style="margin: 0 auto;"> -->
					</a>
				</div>
			</div>
		</div>
		<style>
		#index_nav_tabs a:hover{
			color: #b1d9e5;
		}
		</style>
		<div class="container-fluid" style="background-color: #337ab7; margin-top: 10px; margin-bottom: 20px;">
			<div class="row">
				<div class="container">
					<div class="row">
						<ul id="index_nav_tabs" class="nav nav-pills nav-justified">
					      	  <li role="presentation" class="active"><a href="searchgubun.do?levelcode=10" style="border-radius: 0px;">국내도서</a></li>
							  <li role="presentation" class="active"><a href="searchgubun.do?levelcode=20" style="border-radius: 0px">해외도서</a></li>
							  <li role="presentation" class="active"><a href="bookRebook.do" style="border-radius: 0px">중고장터</a></li>
							  <li role="presentation" class="active"><a href="bookEvent.do" style="border-radius: 0px">이벤트</a></li>
						  </ul>
					</div>
				</div>
			</div>
		</div>
	
	</header>

	<!-- 로그인 모달-->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">

			<form id="frm_login" name="frm_login" method="POST">
				<div class="form-group">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">로그인</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-sm-12" style="margin-bottom: 10px">
									<input type="text" class="form-control" placeholder="아이디" id="memid"name="memid" autocomplete="on" style="height: 50px" required>
								</div>
								<div class="col-sm-12" style="margin-bottom: 10px">
									<input type="password" name="mempwd" class="form-control" placeholder="비밀번호" style="height: 50px" required>
								</div>
								<div class="col-sm-12">
									<button type="button" class="btn btn-danger" onclick="fn_login()" style="height: 50px; width: 100%">로그인</button>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-success" data-dismiss="modal" data-toggle="modal" data-target="#registerModal">회원가입</button>
						</div>
					</div>
				</div>
			</form>

		</div>
	</div>
	
	<!-- 회원가입 모달-->
	<style>
		#registerModal .row{
			margin: 0px;
		}
	</style>
	
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
		
			<form class="form-horizontal" id="frm_regist" name="frm_regist" method="POST" action="javascript:fn_regist(document.frm_regist)">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">회원가입</h4>
					</div>

					<div class="modal-body">
						
						<div class="row">
						
							<div class="col-xs-12 col-md-6">
								<div class="form-group">
									<div class="row">
										<label for="exampleInputName2" class="col-xs-3 control-label">아이디</label>
										<div class="col-xs-9">
											<div class="input-group">
										    	<input type="text" class="form-control" placeholder="" id="memid_reg" name="memid_reg" onkeypress="javascript:getIdChecked=0, isIdChecked=0" required><!-- 회원가입 아이디  -->
										    	<span class="input-group-btn">
											        <button class="btn btn-default" type="button" onclick="fn_registIdCheck()">중복확인</button>
											    </span>
											</div>
									    </div>
								    </div>
								</div>
								
								<div class="form-group">
									<div class="row">
										<label for="exampleInputName2" class="col-xs-3 control-label">비밀번호</label>
										<div class="col-xs-9">
										    <input type="password" class="form-control" placeholder="" id="mempwd_reg" name="mempwd_reg" required><!--회원가입 비밀번호  -->
									    </div>
								    </div>
								</div>
								
								<div class="form-group">
									<div class="row">
										<label for="exampleInputName2" class="col-xs-3 control-label" style="padding: 7px 0px;">비밀번호 확인</label>
										<div class="col-xs-9">
										    <input type="password" class="form-control" placeholder="" id="memrepwd_reg" name="memrepwd_reg" required><!-- 회원가입 비밀번호 확인  -->
									    </div>
								    </div>
								</div>
								
							</div><!-- End div 아이디 -->
									
							<div class="col-xs-12 col-md-6">
								<div class="form-group">
								    <div class="row">
										<label for="exampleInputName2" class="col-xs-3 control-label">이름</label>
										<div class="col-xs-9" style="padding: 0px;">
											<input type="text" class="form-control" placeholder="홍길동" id="memname_reg" name="memname_reg" required><!-- 회원가입 이름  -->
									    </div>
								    </div>
								</div>
								
								<div class="form-group">
								    <div class="row">
										<label for="exampleInputName2" class="col-xs-3 control-label">성별</label>
										<div class="col-xs-9">
											<label class="radio-inline">
											  <input type="radio" name="memsex_reg" id="inlineRadio1" value="여성" required> 여성<!-- 회원가입 여성  -->
											</label>
											<label class="radio-inline">
											  <input type="radio" name="memsex_reg" id="inlineRadio2" value="남성" required> 남성<!-- 회원가입 남성  -->
											</label>
									    </div>
								    </div>
								</div>
								
								<div class="form-group">
								    <div class="row">
										<label for="exampleInputName2" class="col-xs-3 control-label">생년월일</label>
										<div class="col-xs-9" style="padding: 0px;">
											<div class="col-xs-4" style="padding: 2px;">
										      	<select class="form-control" id="membirthYear_reg" name="membirthYear_reg" ><!-- 회원가입 생년월일 년  -->
												  <option selected="" disabled="" hidden="" value="">년</option>
												  <c:forEach var="year" begin="1990" end="2010" step="1">
												  	<option value="${year}">${year}년</option>
												  </c:forEach>
												</select>
											</div>
											<div class="col-xs-4" style="padding: 2px;">
												<select class="form-control" id="membirthMonth_reg" name="membirthMonth_reg"><!-- 회원가입 생년월일 월  -->
												  <option selected="" disabled="" hidden="" value="">월</option>
												  <c:forEach var="month" begin="1" end="12" step="1">
												  	<option value="${month}">${month}월</option>
												  </c:forEach>
												</select>
											</div>
											<div class="col-xs-4" style="padding: 2px;">
												<select class="form-control" id="membirthDay_reg" name="membirthDay_reg"><!-- 회원가입 생년월일 일  -->
												  <option selected="" disabled="" hidden="" value="">일</option>
												  <c:forEach var="day" begin="1" end="31" step="1">
												  	<option value="${day}">${day}일</option>
												  </c:forEach>
												</select>
											</div>
									    </div>
								    </div>
								</div>
								
								<div class="form-group">
								    <div class="row">
										<label for="exampleInputName2" class="col-xs-3 control-label">핸드폰</label>
										<div class="col-xs-9" style="padding: 0px;">
											<div class="col-xs-4" style="padding: 2px;">
										      	<select class="form-control" id="memphone1_reg" name="memphone1_reg"><!-- 회원가입 핸드폰1 -->
												  <option>010</option>
												  <option>011</option>
												  <option>019</option>
												</select>
											</div>
											<div class="col-xs-4" style="padding: 2px;">
												<input type="text" class="form-control" placeholder="" id="memphone2_reg" name="memphone2_reg" required><!-- 회원가입 핸드폰2 -->
											</div>
											<div class="col-xs-4" style="padding: 2px;">
												<input type="text" class="form-control" placeholder="" id="memphone3_reg" name="memphone3_reg" required><!-- 회원가입 핸드폰3 -->
											</div>
									    </div>
								    </div>
								</div>
								
								<div class="form-group">
								    <div class="row">
										<label for="exampleInputName2" class="col-xs-3 control-label">이메일</label>
										<div class="col-xs-9" style="padding: 0px;">
											<input type="email" class="form-control" placeholder="example@example.com" id="mememail_reg" name="mememail_reg" required><!-- 회원가입 이메일 -->
									    </div>
								    </div>
								</div>
								
							</div><!-- End div 이름 -->
						</div><!-- End row 아아디,이름 -->
						
						<hr>
						
						<div class="row">
							<div class="col-xs-12">
							
								<div class="form-group">
								    <div class="row">
										<label for="exampleInputName2" class="col-xs-1 control-label">주소</label>
										<div class="input-group col-xs-6">
									    	<input type="text" class="form-control" placeholder="우편번호 검색을 하십시오." id="memzip_reg" name="memzip_reg"  style="" required><!-- 회원가입 우편번호 -->
									    	<span class="input-group-btn">
										        <button class="btn btn-default" type="button" onclick="fn_Post()">우편번호 검색</button><!-- 회원가입 우편번호 검색버튼 -->
										    </span>
										</div>
								    </div>
								</div>
								
								<div class="form-group">
								    <div class="row">
										<label for="exampleInputName2" class="col-xs-1 control-label"></label>
										<div class="col-xs-8" style="padding: 0px;">
											<input type="text" class="form-control" placeholder="주소" id="memaddr1_reg" name="memaddr1_reg" required><!-- 회원가입 주소1 -->
									    </div>
								    </div>
								</div>
								
								<div class="form-group">
								    <div class="row">
										<label for="exampleInputName2" class="col-xs-1 control-label"></label>
										<div class="col-xs-8" style="padding: 0px;">
											<input type="text" class="form-control" placeholder="상세주소" id="memaddr2_reg" name="memaddr2_reg"><!-- 회원가입 주소2 -->
									    </div>
								    </div>
								</div>
								
							</div>
						</div><!-- End row 주소  -->
						
						<hr>
						
						<div class="row">
							<div class="col-xs-12">
								<div class="form-group">
								    <div class="row">
								    	<div class="col-xs-1">
											<strong>관심<br>분야</strong>
										</div>
										<div class="col-xs-11">
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio1" value="한미소설" required> 한미소설
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="영미소설" required> 영미소설
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="기타소설" required> 기타소설
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="장르시" required> 장르시
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="테마에세이" required> 테마에세이
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="지혜/상식" required> 지혜/상식
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="성공/자기계발" required> 성공/자기계발
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="비즈니스" required> 비즈니스
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="인간관계" required> 인간관계
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="인문학일반" required> 인문학일반
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="심리학" required> 심리학
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="유아교육" required> 유아교육
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="유아" required> 유아
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="어린이" required> 어린이
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="참고서" required> 참고서
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="취업서/외국어" required> 취업서/외국어
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="육아" required> 육아
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="여행" required> 여행
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="요리/취미" required> 요리/취미
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="잡지" required> 잡지
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_reg" id="inlineRadio2" value="만화" required> 만화
										</label>
										</div>
								    </div>
								</div>
							</div>
						</div><!-- End row 관심사  -->
					</div><!-- End modal-body  -->

					<div class="modal-footer">
						<button type="submit" class="btn btn-danger" style="height: auto; width: 100%"><h4>회원가입</h4></button>
					</div><!-- End modal-footer  -->
				</div>
			</form><!-- End Form-->
			
		</div>
	</div><!-- End 회원가입 모달-->

</body>
</html>