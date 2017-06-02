<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
</head>

<script type="text/javascript">
	function fn_MemberCheck(){
		
		if(document.frm_MemberCheck.modiORdelete.value == "1"){
			if(confirm("정말로 계정을 삭제 하시겠습니까?")){
				var form = {};
				form.memid = document.frm_MemberCheck.memid_MemberCheck.value;
				form.mempwd = document.frm_MemberCheck.mempwd_MemberCheck.value;
					
				$.ajax({
					type: 'POST',
					data: form,
					url: "/bookMemberDelete.do",
					
					success: function(data) {
						if(data.result > 0) {
							alert("계정이 정상적으로 삭제 되었습니다.")
							location.href="/main.do";
						} else {
							alert("입력하신정보가 올바르지 않습니다.");
							location.reload(true);
						}
					},
					error: function () {
						alert("계정삭제 중 오류가 발생였습니다. 관리자에게 문의하세요.");
						location.reload(true);
					}
				});
			}
		}else{
		
			var form = {};
			form.memid = document.frm_MemberCheck.memid_MemberCheck.value;
			form.mempwd = document.frm_MemberCheck.mempwd_MemberCheck.value;
				
			$.ajax({
				type: 'POST',
				data: form,
				url: "/bookMemberCheck.do",
				
				success: function(data) {
					if(data.cnt > 0) {
						document.getElementById('isMemberCheck').value="1";
						document.frm_MemberCheck.method="POST";
						document.frm_MemberCheck.action = "/bookShowMemberForm.do";
					   	document.frm_MemberCheck.submit();
					} else {
						alert("입력하신 정보가 올바르지 않습니다.");
					}
				},
				error: function () {
					alert("비밀번호 재확인 오류발생");
					location.reload(true);
				}
			});
		}
	}
	
	function fn_modifORdelete(){
		document.frm_modifORdelete.method="post";
		document.frm_modifORdelete.action="/bookMyPageMember.do";
		document.frm_modifORdelete.submit();
	}
</script>

<body style="display: block; padding-top: 51px;">

	<jsp:include page="header.jsp">
		<jsp:param value="navbar-fixed-top" name="navbar_style" />
	</jsp:include>

	<main>
	
	<div class="container">
		<div class="row">
			<div class="col-xs-2">
				<div class="list-group">
					<style>
						.list-group-item:last-child {
						    margin-bottom: 0;
						    border-bottom-right-radius: 0px;
						    border-bottom-left-radius: 0px;
						}
					</style>
					<a href="#" class="list-group-item active">마이페이지</a>
					<a href="javascript:location.href='bookMyPage.do'" class="list-group-item">주문관리</a>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="javascript:location.href='bookMyPage.do'" style="text-decoration: none;">- 주문현황</a></li>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="javascript:location.href='bookMyPage.do'" style="text-decoration: none;">- 주문내역</a></li>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="javascript:location.href='bookMyPage.do'" style="text-decoration: none;">- 배송안내</a></li>
					
					<a href="javascript:location.href='bookMyPageContents.do'" class="list-group-item">나만의 콘텐츠</a>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="javascript:location.href='bookMyPageContents.do'" style="text-decoration: none;">- 관심작가</a></li>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="javascript:location.href='bookMyPageContents.do'" style="text-decoration: none;">- 문의내역</a></li>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="javascript:location.href='bookMyPageContents.do'" style="text-decoration: none;">- 나의 중고도서</a></li>
					
					<a href="javascript:location.href='bookMyPageMember.do'" class="list-group-item">회원정보 관리</a>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="javascript:location.href='bookMyPageMember.do'" style="text-decoration: none;">- 회원정보 수정</a></li>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="#" onclick="fn_modifORdelete()"  style="text-decoration: none;">- 회원탈퇴</a></li>
				</div>
			</div>
			
			<form name="frm_modifORdelete" id="frm_modifORdelete">
				<input type="hidden" name="modifORdelete" id="modifORdelete" value="1">
			</form>

			<div class="col-xs-10">
				
				<div class="row" style="margin-bottom: 30px;">
					<div class="col-xs-12">
						<h3 style="margin: 0px;">비밀번호 재확인</h3>
						<hr>
						<h5>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.<br>비밀번호는 다른 사람에게 노출되지 않도록 주의해주시기 바랍니다.</h5>
						<hr>
						
						<form class="form-horizontal" name="frm_MemberCheck" id="frm_MemberCheck" action="javascript:fn_MemberCheck()">
							<div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
							    <div class="col-sm-6">
							      <input type="text" class="form-control" id="memid_MemberCheck" name="memid_MemberCheck" required>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
							    <div class="col-sm-6">
							      <input type="password" class="form-control" id="mempwd_MemberCheck" name="mempwd_MemberCheck" required>
							    </div>
							  </div>
							  <div class="form-group">
							    <div class="col-sm-offset-2 col-sm-10">
							      <input type="hidden" class="form-control" id="isMemberCheck" name="isMemberCheck" value="0">
							      <input type="hidden" class="form-control" id="modiORdelete" name="modiORdelete" value="${modiORdelete}">
							      <button type="submit" class="btn btn-default">확인</button>
							    </div>
							  </div>
						  </form>
						
					</div><!-- col-xs-12 -->
				</div><!-- 비밀번호 재확인 row -->


			</div><!-- col-xs-9 -->
		</div><!-- row -->
	</div><!-- end container  --> 
	
	</main>

	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
