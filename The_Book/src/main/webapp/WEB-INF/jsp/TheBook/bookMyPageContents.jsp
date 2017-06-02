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

<script>
	function fn_BookDetail(bounq){
		document.frm_bookDetail.bounq.value = bounq;
		document.frm_bookDetail.action = "<c:url value='/bookDetail.do'/>";
	   	document.frm_bookDetail.submit();
	}
	
	function fn_modifORdelete(){
		document.frm_modifORdelete.method="post";
		document.frm_modifORdelete.action="/bookMyPageMember.do";
		document.frm_modifORdelete.submit();
	}
	
	function fn_OpenUpdateReBook(rebounq, img, name, price){
		var myForm = document.popForm;
		var url = "<c:url value='/OpenUpdateReBook.do'/>";
		window.open("" ,"popForm", "toolbar=no, width=600, height=380, directories=no, status=no, scrollorbars=no, resizable=no"); 
		myForm.action =url; 
		myForm.method="post";
		myForm.target="popForm";
		myForm.rebounq.value = rebounq;
		myForm.img.value = img;
		myForm.name.value = name;
		myForm.price.value = price;
		myForm.submit();
	}
	
	function fn_Reload(){
		location.reload(true);
	}
	
	function fn_DeleteReBook(rebounq){
		if(confirm("정말로 삭제 하시겠습니까?")){
			var form = {};
			form.rebounq = rebounq;
				
			$.ajax({
				type: 'POST',
				data: form,
				url: "/DeleteReBook.do",
				
				success: function(data) {
					if(data.result > 0) {
						alert("중고도서가 삭제 되었습니다.")
						location.reload(true);
					} else {
						alert("중고도서 삭제를 실패하였습니다.");
						location.reload(true);
					}
				},
				error: function () {
					alert("오류가 발생하였습니다. 관리자에게 문의하새요.");
					location.reload(true);
				}
			});
		}
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
					<a href="javascript:location.href='bookMyPage.do'" class="list-group-item active">마이페이지</a>
					<a href="javascript:location.href='bookMyPage.do'" class="list-group-item">주문관리</a>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="javascript:location.href='bookMyPage.do'" style="text-decoration: none;">- 주문현황</a></li>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="javascript:location.href='bookMyPage.do'" style="text-decoration: none;">- 주문내역</a></li>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="javascript:location.href='bookMyPage.do'" style="text-decoration: none;">- 배송안내</a></li>
					
					<a href="javascript:location.href='bookMyPageContents.do'" class="list-group-item">나만의 콘텐츠</a>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="#ContentTab1" style="text-decoration: none;">- 관심작가</a></li>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="#ContentTab2" style="text-decoration: none;">- 문의내역</a></li>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="#ContentTab3" style="text-decoration: none;">- 나의 중고도서</a></li>
					
					<a href="javascript:location.href='bookMyPageMember.do'" class="list-group-item">회원정보 관리</a>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="javascript:location.href='bookMyPageMember.do'" style="text-decoration: none;">- 회원정보 수정</a></li>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="#" onclick="fn_modifORdelete()"  style="text-decoration: none;">- 회원탈퇴</a></li>
				</div>
			</div>
			
			<form name="frm_modifORdelete" id="frm_modifORdelete">
				<input type="hidden" name="modifORdelete" id="modifORdelete" value="1">
			</form>

			<div class="col-xs-10">
			
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-xs-12">
						<h2 style="margin: 0px 0px 30px 0px;">
							<font style="color: blue; font-weight: bold;">${bookMemberVO.memname}</font><font style="font-size: 20px;">님 (${bookMemberVO.memgrade}등급) 적립금: <font style="color: blue; font-weight: bold;">${bookMemberVO.mempoint}P</font></font>
						</h2>
					</div>
				</div>
				
				<div id="ContentTab1" class="row" style="margin-bottom: 30px;">
					<div class="col-xs-12">
						<h3 style="margin: 0px;">관심작가</h3>
						<br>
						<table class="table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10%" style="text-align: center; vertical-align: middle;">저자</th>
									<th width="10%" style="text-align: center; vertical-align: middle;">메인사진</th>
									<th width="40%" style="text-align: center; vertical-align: middle;">책이름</th>
									<th width="10%" style="text-align: center; vertical-align: middle;">가격</th>
									<th width="15%" style="text-align: center; vertical-align: middle;">출판사</th>
									<th width="15%" style="text-align: center; vertical-align: middle;">출간일</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="bookAuthor_List" items="${bookAuthor_List}">
									<tr>
										<td style="text-align: center; vertical-align: middle;">${bookAuthor_List.authorauthor}</td>
										<td style="text-align: center; vertical-align: middle;"><a href="javascript:fn_BookDetail('${bookAuthor_List.rebobookunq}')"><img src="/images/poster/${bookAuthor_List.boimg}" class="img-responsive" alt="Responsive image"></a></td>
										<td style="vertical-align: middle;">
											<a href="javascript:fn_BookDetail('${bookAuthor_List.bounq}')">${bookAuthor_List.boname}</a>
										</td>
										<td style="text-align: center; vertical-align: middle;">${bookAuthor_List.boprice}원</td>
										<td style="text-align: center; vertical-align: middle;">${bookAuthor_List.bocompany}</td>
										<td style="text-align: center; vertical-align: middle;">${bookAuthor_List.bopublish}</td>
									</tr>
								</c:forEach>
								<c:if test="${empty bookAuthor_List}">
									<tr>
										<td colspan="6" style="text-align: center; vertical-align: middle;">관심 작가를 등록하실 수 있습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div><!-- col-xs-12 -->
				</div><!-- 관심작가 row -->
				
				<form name="frm_bookDetail" id="frm_bookDetail" action="POST">
					<input type="hidden" name="bounq" id="bounq">
				</form>
				
				<div id="ContentTab2" class="row" style="margin-bottom: 30px;">
					<div class="col-xs-12">
						<h3 style="margin: 0px;">문의내역</h3>
						<br>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th width="10%" style="text-align: center; vertical-align: middle;">글번호</th>
									<th width="70%" style="text-align: center; vertical-align: middle;">제목</th>
									<th width="10%" style="text-align: center; vertical-align: middle;">업로드일자</th>
									<th width="10%" style="text-align: center; vertical-align: middle;">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bookQnaVO_List" items="${bookQnaVO_List}">
									<tr>
										<td style="text-align: center; vertical-align: middle;">${bookQnaVO_List.qnaunq}</td>
										<td style="vertical-align: middle;" data-toggle="collapse" aria-expanded="false" aria-controls="collapseExample" href="#${bookQnaVO_List.qnaunq}"><a>${bookQnaVO_List.qnatitle}</a></td>
										<td style="text-align: center; vertical-align: middle;">${bookQnaVO_List.qnaregdate}</td>
										<td style="text-align: center; vertical-align: middle;">${bookQnaVO_List.qnahit}</td>
									</tr>
									<tr class="collapse" id="${bookQnaVO_List.qnaunq}">
										<td style="vertical-align: middle;" colspan="4">
											<div class="well" style="margin-bottom: 10px;">${bookQnaVO_List.qnacontent}</div>
											<div style="text-align: right">
												<button type="button" class="btn btn-success btn-xs" onclick="location.href='bookgogekQnaList.do'">글삭제</button>
												<button type="button" class="btn btn-success btn-xs" data-toggle="collapse" href="#${bookQnaVO_List.qnaunq}" aria-expanded="false" aria-controls="collapseExample">닫기</button>
											</div>
										</td>
									</tr>
								</c:forEach>
								<c:if test="${empty bookQnaVO_List}">
									<tr>
										<td colspan="4" style="text-align: center; vertical-align: middle;">고객센터에서 관리자에게 문의하실 수 있습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div><!-- col-xs-12 -->
				</div><!-- 관심작가 row -->
				
				<div id="ContentTab3" class="row" style="margin-bottom: 30px;">
					<div class="col-xs-12">
						<h3 style="margin: 0px;">나의 중고도서</h3>
						<br>
						<table class="table table-hover table-bordered">
							<thead>
								<tr>
									<th width="12%" style="text-align: center; vertical-align: middle;">중고도서번호</th>
									<th width="9%" style="text-align: center; vertical-align: middle;">표지</th>
									<th width="45%" style="text-align: center; vertical-align: middle;">책이름</th>
									<th width="5%" style="text-align: center; vertical-align: middle;">상태</th>
									<th width="10%" style="text-align: center; vertical-align: middle;">중고가격</th>
									<th width="10%" style="text-align: center; vertical-align: middle;">업로드일자</th>
									<th width="10%" style="text-align: center; vertical-align: middle;">변경</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bookReBookVO_List" items="${bookReBookVO_List}">
									<tr>
										<td style="text-align: center; vertical-align: middle;">${bookReBookVO_List.rebounq}</td>
										<td style="text-align: center; vertical-align: middle;"><a href="javascript:fn_BookDetail('${bookReBookVO_List.rebobookunq}')"><img src="/images/poster/${bookReBookVO_List.boimg}" class="img-responsive" alt="Responsive image"></a></td>
										<td style="vertical-align: middle;"><a href="javascript:fn_BookDetail('${bookReBookVO_List.rebobookunq}')">${bookReBookVO_List.boname}</a></td>
										<td style="text-align: center; vertical-align: middle;">${bookReBookVO_List.rebocondition}</td>
										<td style="text-align: center; vertical-align: middle;">${bookReBookVO_List.reboprice}원</td>
										<td style="text-align: center; vertical-align: middle;">${bookReBookVO_List.reboregdate1}</td>
										<td style="text-align: center; vertical-align: middle;">
											<button type="button" class="btn btn-danger btn-xs" onclick="fn_OpenUpdateReBook('${bookReBookVO_List.rebounq}', '${bookReBookVO_List.boimg}', '${bookReBookVO_List.boname}', '${bookReBookVO_List.reboprice}')" style="margin-bottom: 5px;">&nbsp;수정&nbsp;</button>
<!--  -->									<br>
											<button type="button" class="btn btn-success btn-xs" onclick="fn_DeleteReBook('${bookReBookVO_List.rebounq}')">&nbsp;삭제&nbsp; </button>
										</td>
									</tr>
								</c:forEach>
								<c:if test="${empty bookReBookVO_List}">
									<tr>
										<td colspan="7" style="text-align: center; vertical-align: middle;">중고장터에서 나의 중고도서를 등록하실 수 있습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						
						<form name="popForm">
						    <input type="hidden" name="rebounq" value="" />
						    <input type="hidden" name="img" value="" />
						    <input type="hidden" name="name" value="" />
						    <input type="hidden" name="price" value="" />
						</form>

					</div><!-- col-xs-12 -->
				</div><!-- 관심작가 row -->

			</div>
			<!-- col-xs-9 -->
		</div>
		<!-- row -->
	</div>
	<!-- end container  --> 
	
	</main>

	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
