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
function fn_writepost1(addr1, zip){
	var memzip_modify = zip.toString();
	document.getElementById ('memaddr1_modify').value=addr1;
	document.getElementById ('memzip_modify').value=memzip_modify.substring(0,3)+'-'+memzip_modify.substring(3);
}
	
function fn_MemModify(frm){
		
		var form = {};
		form.memid = frm.memid_modify.value;
		form.mempwd = frm.mempwd_modify.value;
		form.memphone = frm.memphone1_modify.value +"-"+ frm.memphone2_modify.value +"-"+ frm.memphone3_modify.value;
		form.mememail = frm.mememail_modify.value;
		form.memzip = frm.memzip_modify.value;
		form.memaddr1 = frm.memaddr1_modify.value;
		form.memaddr2 = frm.memaddr2_modify.value;
		form.memfavorite = frm.memfavorite_modify.value;
			
		$.ajax({
			type: 'POST',
			data: form,
			url: "/bookMemModify.do",
			
			success: function(data) {
				
				if(data.result > 0) {
					alert("회원님의 정보를 수정 하였습니다.");
					location.href="/bookMyPage.do";
				} else {
					alert("회원 정보수정 실패. 다시 시도하여 주십시오.");
					location.reload(true);;
				}
			},
			error: function () {
				alert("문제가 발샐하였습니다. 관리자에게 문의하시기 바랍니다.");
				location.reload(true);
			}
		}); 
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
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="#" onclick="fn_modifORdelete()" style="text-decoration: none;">- 회원탈퇴</a></li>
				</div>
			</div>
			
			<form name="frm_modifORdelete" id="frm_modifORdelete">
				<input type="hidden" name="modifORdelete" id="modifORdelete" value="1">
			</form>

			<div class="col-xs-10">
				
				<div class="row" style="margin-bottom: 30px;">
					<div class="col-xs-12">
						<h3 style="margin: 0px 0px 30px 0px;">회원정보수정</h3>
						
						<form class="form-horizontal" name="frm_MemberModify" id="frm_MemberModify" action="javascript:fn_MemModify(document.frm_MemberModify)">
							<div class="form-group">
								<div class="row">
									<label for="exampleInputName2" class="col-xs-2 control-label">아이디</label>
									<div class="col-xs-6">
									    <input type="text" class="form-control" id="memid_modify" name="memid_modify" value="${bookMemberVO.memid}" disabled="disabled" required><!-- 회원가입 아이디  -->
								    </div>
							    </div>
							</div>
							
							<div class="form-group">
								<div class="row">
									<label for="exampleInputName2" class="col-xs-2 control-label">새 비밀번호</label>
									<div class="col-xs-6">
									    <input type="password" class="form-control" placeholder="" id="mempwd_modify" name="mempwd_modify" required><!--회원가입 비밀번호  -->
								    </div>
							    </div>
							</div>
							
							<div class="form-group">
								<div class="row">
									<label for="exampleInputName2" class="col-xs-2 control-label" style="padding: 7px 0px;">새 비밀번호 확인</label>
									<div class="col-xs-6">
									    <input type="password" class="form-control" placeholder="" id="memrepwd_modify" name="memrepwd_modify" required><!-- 회원가입 비밀번호 확인  -->
								    </div>
							    </div>
							</div>
							
							<hr>
							
							<div class="form-group">
							    <div class="row">
									<label for="exampleInputName2" class="col-xs-2 control-label">이름</label>
									<div class="col-xs-6">
										<input type="text" class="form-control" placeholder="홍길동" id="memname_modify" name="memname_modify" value="${bookMemberVO.memname}" disabled="disabled" required> 
								    </div>
							    </div>
							</div>
							
							<div class="form-group">
							    <div class="row">
									<label for="exampleInputName2" class="col-xs-2 control-label">성별</label>
									<div class="col-xs-6">
										<input type="text" class="form-control" id="memsex_modify" name="memsex_modify" value="${bookMemberVO.memsex}성" disabled="disabled" required> 
								    </div>
							    </div>
							</div>
							
							<div class="form-group">
							    <div class="row">
									<label for="exampleInputName2" class="col-xs-2 control-label">생년월일</label>
									<div class="col-xs-6">
										<input type="text" class="form-control" id="memsex_modify" name="memsex_modify" value="${bookMemberVO.membirth}" disabled="disabled" required> 
								    </div>
							    </div>
							</div>
							
							<div class="form-group">
							    <div class="row">
									<label for="exampleInputName2" class="col-xs-2 control-label">핸드폰</label>
									<div class="col-xs-6">
										<div class="col-xs-4" style="padding: 2px;">
									      	<select class="form-control" id="memphone1_modify" name="memphone1_modify"><!-- 회원가입 핸드폰1 -->
											  <option>010</option>
											  <option>011</option>
											  <option>019</option>
											</select>
										</div>
										<div class="col-xs-4" style="padding: 2px;">
											<input type="text" class="form-control" placeholder="" id="memphone2_modify" name="memphone2_modify" required><!-- 회원가입 핸드폰2 -->
										</div>
										<div class="col-xs-4" style="padding: 2px;">
											<input type="text" class="form-control" placeholder="" id="memphone3_modify" name="memphone3_modify" required><!-- 회원가입 핸드폰3 -->
										</div>
										<small style="color: red">기존 핸드폰번호: ${bookMemberVO.memphone}</small>
								    </div>
								   
							    </div>
							</div>
							
							<div class="form-group">
							    <div class="row">
									<label for="exampleInputName2" class="col-xs-2 control-label">이메일</label>
									<div class="col-xs-6">
										<input type="email" class="form-control" placeholder="example@example.com" id="mememail_modify" name="mememail_modify" value="${bookMemberVO.mememail}" required><!-- 회원가입 이메일 -->
										<small style="color: red">기존 이메일: ${bookMemberVO.mememail}</small>
								    </div>
							    </div>
							</div>
							
							<hr>
						
							<div class="form-group">
							    <div class="row">
									<label for="exampleInputName2" class="col-xs-2 control-label">주소</label>
							    	<div class="col-xs-6">
										<div class="input-group">
									    	<input type="text" class="form-control" placeholder="" id="memzip_modify" name="memzip_modify" value="${bookMemberVO.memzip}" required><!-- 회원가입 우편번호 -->
									    	<span class="input-group-btn">
										        <button class="btn btn-default" type="button" onclick="fn_Post()">우편번호 검색</button><!-- 회원가입 우편번호 검색버튼 -->
										    </span>
										</div>
									</div>	
							    </div>
							</div>
							
							<div class="form-group">
							    <div class="row">
									<label for="exampleInputName2" class="col-xs-2 control-label"></label>
									<div class="col-xs-6">
										<input type="text" class="form-control" placeholder="주소" id="memaddr1_modify" name="memaddr1_modify" value="${bookMemberVO.memaddr1}" required><!-- 회원가입 주소1 -->
								    </div>
							    </div>
							</div>
							
							<div class="form-group">
							    <div class="row">
									<label for="exampleInputName2" class="col-xs-2 control-label"></label>
									<div class="col-xs-6">
										<input type="text" class="form-control" placeholder="상세주소" id="memaddr2_modify" name="memaddr2_modify" value="${bookMemberVO.memaddr2}"><!-- 회원가입 주소2 -->
								    </div>
							    </div>
							</div>
					
							<hr>
					
							<div class="form-group">
								<div class="row">
									<label for="exampleInputName2" class="col-xs-2 control-label">관심분야</label>
									<div class="col-xs-6">
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_modify" id="inlineRadio1" value="어린이" required> 어린이
										</label>
										<label class="radio-inline">
											  <input type="radio" name="memfavorite_modify" id="inlineRadio2" value="문학" required> 문학
										</label>
									</div>
								</div>
							</div><!-- End row 관심사  -->
							
							<hr>
							
							<div class="form-group">
								<div class="row">
									<div class="col-xs-2">
									</div>
									<div class="col-xs-6">
										<button type="submit" class="btn btn-danger btn-lg" style="width: 100%; height: auto;">수정완료</button>
									</div>
								</div>
							</div><!-- End row 관심사  -->
							
						</form>
						
					</div><!-- col-xs-12 -->
				</div><!-- 회원정보수정 재확인 row -->

			</div><!-- col-xs-10 -->
		</div><!-- row -->
		
	</div><!-- end container  --> 
	
	</main>

	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
