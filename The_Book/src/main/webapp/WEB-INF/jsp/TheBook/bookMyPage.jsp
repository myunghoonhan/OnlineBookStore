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
	
	function fn_FinalBuy(buyunq, bookunq){
				
		var form = {};
		form.buydetailbuyunq = buyunq;
		form.buydetailbookunq = bookunq;
				
		$.ajax({
			type : 'POST',
			data : form,
			url : "/finalBuy.do",
			
			success : function(data) {
				if (data.result > 0) {
					alert("감사합니다! " + data.updatepoint + "P 적립되었습니다.");
					location.href = "<c:url value="/bookMyPage.do"/>";
				}else {
					alert("구매 확정을 실패했습니다. 다시 시도해주세요.");
				}
			},
			error : function() {
				alert("오류발생 ");
			}
		});
	}
	
	function fn_RequestCancel(buyunq, bookunq){
		if(confirm("정말로 취소신청 하시겠습니까?")){
			var form = {};
			form.buydetailbuyunq = buyunq;
			form.buydetailbookunq = bookunq;
			
			$.ajax({
				type: 'POST',
				data: form,
				url: "/requestCancel.do",
				
				success: function(data) {
					
					if(data.result == true) {
						location.reload(true);
					} else {
						alert("취소 신청에 실패하였습니다.");
						location.reload(true);
					}
				},
				error: function () {
					alert("취소 신청 중 오류가 발생하였습니다. 관리자에게 문의 하십시오.");
					location.reload(true);
				}
			});
		}
	}
</script>

<script>
/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/bookMyPage.do'/>";
   	document.listForm.submit();
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
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="#OrderTab1" style="text-decoration: none;">- 주문현황</a></li>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="#OrderTab2" style="text-decoration: none;">- 주문내역</a></li>
					<li class="list-group-item list-group-item" style="background-color: #f5f5f5"><a href="#OrderTab3" style="text-decoration: none;">- 배송안내</a></li>
					
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
			
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-xs-12">
						<h2 style="margin: 0px 0px 30px 0px;">
							<font style="color: blue; font-weight: bold;">${bookMemberVO.memname}</font><font style="font-size: 20px;">님 (${bookMemberVO.memgrade}등급) 적립금: <font style="color: blue; font-weight: bold;">${bookMemberVO.mempoint}P</font></font>
						</h2>
					</div>
				</div>
				
				<div id="OrderTab1" class="row" style="margin-bottom: 30px;">
					<div class="col-xs-12">
						<h3 style="margin: 0px;">주문현황</h3>
						<table class="table" style="border-bottom: 1px solid #eee; margin-top: 10px;">
							<tr>
								<td style="text-align: center; vertical-align: middle; width: 17%; padding: 2px 8px;">
									결제완료( <font color="blue"><Strong>${cntStep1}</Strong></font> )<br> <img src="/images/ship_card.png" class="img-responsive" alt="Responsive image" style="margin: 0 auto; padding: 1px 20px; padding-top: 10px;">
								</td>
								
									<td style="text-align: center; vertical-align: middle; width: 10%; padding: 2px 8px;">
										<img src="/images/ship_arrow.png" class="img-responsive" alt="Responsive image" style="margin: 0 auto;">
									</td>
								
								<td style="text-align: center; vertical-align: middle; width: 17%; padding: 2px 8px;">
									상품준비중( <font color="blue"><Strong>${cntStep2}</Strong></font> )<br> <img src="/images/ship_box.png" class="img-responsive" alt="Responsive image" style="margin: 0 auto;  padding: 1px 20px;">
								</td>
								
									<td style="text-align: center; vertical-align: middle; width: 10%; padding: 2px 8px;">
										<img src="/images/ship_arrow.png" class="img-responsive" alt="Responsive image" style="margin: 0 auto;">
									</td>
								
								<td style="text-align: center; vertical-align: middle; width: 17%; padding: 2px 8px;">
									배송중( <font color="blue"><Strong>${cntStep3}</Strong></font> )<br> <img src="/images/ship_truck.png" class="img-responsive" alt="Responsive image" style="margin: 0 auto;  padding: 1px 20px;">
								</td>
								
									<td style="text-align: center; vertical-align: middle; width: 10%; padding: 2px 8px;">
										<img src="/images/ship_arrow.png" class="img-responsive" alt="Responsive image" style="margin: 0 auto;">
									</td>
								
								<td style="text-align: center; vertical-align: middle; width: 17%; padding: 2px 8px;">
									배송완료( <font color="blue"><Strong>${cntStep4}</Strong></font> )<br> <img src="/images/ship_arrive.png" class="img-responsive" alt="Responsive image" style="margin: 0 auto;  padding: 1px 20px;">
								</td>
							</tr>
						</table>
					</div>
					<!-- col-xs-12 -->
				</div>
				<!-- 나의 최근 주문현황 row -->

				<div id="OrderTab2" class="row" style="margin-bottom: 20px;">
					<div class="col-xs-12">
						<h3 style="margin: 0px;">주문내역</h3>
						<br>
						<form:form commandName="bookBuyDetailVO" id="listForm" name="listForm" method="post">
							<table class="table table-bordered" id="target-table" style="margin-bottom: 0px;">
								<thead>
									<tr>
										<th width="13%" style="text-align: center; vertical-align: middle;">주문번호</th>
										<th width="35%" style="text-align: center; vertical-align: middle;">책이름</th>
										<th width="10%x" style="text-align: center; vertical-align: middle;">책가격</th>
										<th width="5%" style="text-align: center; vertical-align: middle;">수량</th>
										<th width="15%" style="text-align: center; vertical-align: middle;">결제금액</th>
										<th width="10%" style="text-align: center; vertical-align: middle;">주문상태</th>
										<th width="5%" style="text-align: center; vertical-align: middle;"></th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach var="bookBuyVO_List" items="${bookBuyVO_List}">
										<c:set var="condition" value="${bookBuyVO_List.buydetailcondition}"/>
										<tr>
											<td style="text-align: center; vertical-align: middle;">${bookBuyVO_List.buydetailbuyunq}<br>[${bookBuyVO_List.buyregdate1}]</td>
											<td style="vertical-align: middle;"><a href="javascript:fn_BookDetail('${bookBuyVO_List.buydetailbookunq}')"><img src="images/poster/${bookBuyVO_List.buydetailbookimg }" alt="" height="100" width="70"/>&nbsp;&nbsp; ${bookBuyVO_List.buydetailbookname}</a></td>
											<td style="text-align: center; vertical-align: middle;">${bookBuyVO_List.buydetailprice}원</td>
											<td style="text-align: center; vertical-align: middle;">${bookBuyVO_List.buydetailcnt}</td>
											<td style="text-align: center; vertical-align: middle;">${bookBuyVO_List.buycash}원<br>(${bookBuyVO_List.buypoint}P 사용)<br><div style="display: none">${bookBuyVO_List.buydetailbuyunq}</div></td>
											<td style="text-align: center; vertical-align: middle;">
												<c:choose>
													<c:when test="${condition == '구매확정'}">
														<font color="#5cb85c"><strong>${condition}</strong></font>
													</c:when>
													<c:when test="${condition == '취소신청중'}">
														<font color=red><strong>${condition}</strong></font>
													</c:when>
													<c:when test="${condition == '배송중'}">
														${condition}
														<br><button type="button" class="btn btn-default btn-xs" onclick="javascript:window.open('https://parcel.epost.go.kr/auth.EpostLogin.parcel')">운송장 조회</button>
													</c:when>
													<c:otherwise>
														${condition}
													</c:otherwise>
												</c:choose>
											</td>
											<td style="text-align: center; vertical-align: middle;">
												<c:if test="${condition == '결제완료' || condition == '상품준비중'}">
													<button type="button" class="btn btn-success btn-xs" onclick="fn_RequestCancel('${bookBuyVO_List.buydetailbuyunq}','${bookBuyVO_List.buydetailbookunq}')">취소신청</button>
												</c:if>
												<c:if test="${condition == '배송완료'}">
													<button type="button" class="btn btn-success btn-xs" onclick="fn_FinalBuy('${bookBuyVO_List.buydetailbuyunq}','${bookBuyVO_List.buydetailbookunq}')" style="margin-bottom: 5px;">구매확정</button>
													<br>
													<button type="button" class="btn btn-danger btn-xs" onclick="fn_RequestCancel('${bookBuyVO_List.buydetailbuyunq}','${bookBuyVO_List.buydetailbookunq}')">취소신청</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>
									<c:if test="${empty bookBuyVO_List}">
										<tr>
											<td colspan="7" style="text-align: center; vertical-align: middle;">주문내역이 없습니다.</td>
										</tr>
									</c:if>
									
									<input type="hidden" name="bounq" id="bounq">
								</tbody>
							</table>
							
							
							<style type="text/css">
								.pagination>li:first-child>strong, .pagination>li:first-child>a{
									margin-left: 0;
								    border-top-left-radius: 0px;
								    border-bottom-left-radius: 0px;
								}
								.pagination>li>strong{
									position: relative;
								    float: left;
								    padding: 6px 12px;
								    margin-left: -1px;
								    line-height: 1.42857143;
								    color: #337ab7;
								    text-decoration: none;
								    background-color: #fff;
								    border: 1px solid #ddd;
								    z-index: 2;
								    color: #fff;
								    cursor: default;
								    background-color: #337ab7;
								    border-color: #337ab7;
								}
							</style>
							
							<nav style="text-align: center;">
								<ul id="paging" class="pagination">
									<li><ui:pagination paginationInfo = "${paginationInfo}" jsFunction="fn_egov_link_page" /></li>
									<form:hidden path="pageIndex" />
								</ul>
							</nav>
						
						</form:form>
					</div><!-- col-xs-12 -->
				</div><!-- 주문내역 row -->
				
				<div id="OrderTab3" class="row" style="margin-bottom: 50px;">
					<div class="col-xs-12">
						<h3 style="margin: 0px;">배송안내</h3>
						<br> <img src="/images/returnImg.jpg" class="img-responsive" alt="Responsive image" style="margin: 0 auto;">
					</div><!-- col-xs-12 -->
				</div><!-- 주문배송안내 row -->

			</div><!-- col-xs-9 -->
		</div><!-- row -->
	</div><!-- end container  --> 
	
	</main>

	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
