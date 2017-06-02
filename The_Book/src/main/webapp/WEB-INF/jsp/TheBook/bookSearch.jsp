<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<script>
$(document).ready(function() {
	var taggubun = ${taggubun};
	var radio = document.getElementsByName("array");
	radio[taggubun-1].checked=true;
});

$(document).ready(function() {
	
});

function array(){
	
	var form = document.arraySearch;
	form.taggubun.value = $(':radio[name="array"]:checked').val();
	form.levelcode.value = $("#levelcode").val();
	form.method ="post";
	form.action = "/searchbutton.do";
	
	form.submit();
}
/* 	function fn_2(bounq){
		var form = document.DetailSearch;
		form.bounq.value = bounq;
		alert(form.bounq.value);
		form.method ="post";
		form.action = "/bookSearch.do";
		form.submit();
		
	} */
	function fn_tagSearchBaguniAdd(bounq, boprice , boname){
		if($("#id").val() == ""){
			alert('로그인 하세요');
			return;
			}
		if($("#bagunitotal").val() == 0){
  			alert('수량을 입력하세요');
  			return;
  		}
		var form = {};
	
		form.bagunibookunq = bounq;
		form.baguniprice = boprice;
		form.bagunibookname = boname;
		form.bagunitotal = $("#bagunitotal").val()

		$.ajax({
		
		type: 'POST',
		data: form,
		url: "/baguniAdd.do",
		
		success: function(data) {
			alert("장바구니 등록완료");
			fn_GetCartCnt();
		},	
		error: function () {
			alert(" 오류발생 ");
		}
	}); 
}
	function fn_tagjunggo(bounq){
		var form = document.arraySearch;
		form.rebobookunq.value = bounq;

		form.method ="post";
		form.action = "/clickJungoList.do";
		form.submit();
	}	
	
	function fn_buyAdd(bookunq, cnt){

		var checkedBaguni = [];

		checkedBaguni.push(bookunq);

		document.getElementById("checkedBaguni").value = checkedBaguni;
		document.getElementById("buydetailcnt").value = cnt;
		document.buyFrm.submit();	
	}

	function fn_checkStock(form2, bookunq){

		var cnt = form2.bagunitotal.value;
		
		if($("#id").val() == ""){
			alert('로그인 후 이용가능합니다.');
			return;
		}
		if(cnt == 0 || cnt < 0){
			alert('수량을 입력하세요.');
			return;
		}

		var checkedBaguni = [];	
		checkedBaguni.push(bookunq);

		document.getElementById("checkedBaguni").value = checkedBaguni;		

		var form = {};
		form.checkStock = $("#checkedBaguni").val();
		form.bookCnts = cnt;
		$.ajax({
			type : 'POST',
			data : form,
			url : "/baguniCheckStock.do",
	
			success : function(data) {
				if (data.result == "ok") {
					//선택한 상품의 재고가 있는 경우
					fn_buyAdd(bookunq, cnt);
				}else {
					alert("재고 수량이 부족합니다. 다시 확인해주세요.");
				}
			},
			error : function() {
				alert("오류발생 ");
			}
		});
	}
	

</script>
<body style="display: block; padding-top: 51px;">

	<jsp:include page="header.jsp">
		<jsp:param value="navbar-fixed-top" name="navbar_style" />
	</jsp:include>

	<form name="arraySearch">
		<input type="hidden" id="id" value="${bookMemberInfo.memid}">
		<input type="hidden" name="taggubun"> 
		<input type="hidden" id="levelcode" name="levelcode" value="${levelcode}">
		<input type="hidden" name="rebobookunq">
		<input type="hidden" name="bounq">
	</form>
	
	<div class="container">
		<div class="row" style="margin-bottom: 20px;">
			<div class="col-xs-12">
				<h4>
		      		홈 <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span> 
		      		${daejungso.dae} <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span> 
		      		${daejungso.jung} <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span> 
		      		${daejungso.so}
		      	</h4>
		    </div>
		</div>
		
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-xs-12">
				<label class="radio-inline">
					<input type="radio" value="1" name="array" id="array"onClick="array()" />판매량</a>
				</label>
				<label class="radio-inline">
					<input type="radio" value="2" name="array" id="array" onClick="array()" />신상품 </a> 
				</label>
				<label class="radio-inline">
					<input type="radio" value="3" name="array" id="array" onClick="array()" />낮은가격</a> 
				</label>
				<label class="radio-inline">
					<input type="radio" value="4" name="array" id="array" onClick="array()" />높은가격</a> 
				</label>
				<label class="radio-inline">
					<input type="radio" value="5" name="array" id="array" onClick="array()" />리뷰수</a> 
				</label>
				<label class="radio-inline">
					<input type="radio" value="6" name="array" id="array" onClick="array()" />조회수 </a>
				</label>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-12">
				<table class="table table-hover">
					<tbody>
						<c:forEach var="tagSearchList" items="${tagSearchList}">
							<tr>
								<td
									style="text-align: center; vertical-align: middle; width: 150px;">
									<a href="bookDetail.do?bounq=${tagSearchList.bounq}"><img
										src="/images/poster/${tagSearchList.boimg}"
										class="img-responsive" alt="Responsive image"></a>
								</td>
								<td style="vertical-align: middle;">
									<ul>
										<li style="list-style: none;">
											<h4>
												<strong>${tagSearchList.boname}</strong>
											</h4>
										</li>
										<li style="list-style: none; margin-bottom: 10px;">
											${tagSearchList.boauthor} 지음 | ${tagSearchList.botrans} 옮김 |
											${tagSearchList.bocompany} | ${tagSearchList.bopublish} 출간</li>
	
										
										<c:if test="${0 eq tagSearchList.cnt}">
											<li style="list-style: none; margin-bottom: 15px;">
												리뷰${tagSearchList.cnt}개 <a href="#" onclick="fn_tagjunggo('${tagSearchList.bounq}')"
												style="text-decoration: none">중고장터(${tagSearchList.recnt}건)</a>
												<button type="button" class="btn btn-default btn-xs">리뷰쓰기</button>
											</li>
										</c:if>
	
	
										<c:if test="${tagSearchList.cnt != 0}">
											<fmt:parseNumber var="point"
												value="${tagSearchList.star/tagSearchList.cnt}" pattern="0" />
											<c:forEach begin="1" end="${point}">
												<img src="/images/star.png"
													style="width: 20px; height: auto;">
											</c:forEach>
												  리뷰${tagSearchList.cnt}개 
												 <a href="#"  onclick="fn_tagjunggo('${tagSearchList.bounq}')" style="text-decoration: none">중고장터(${tagSearchList.recnt}건)</a>
											<button type="button" class="btn btn-default btn-xs">리뷰쓰기</button>
										</c:if>
	
										<li style="list-style: none; margin-bottom: 5px;"><span
											style="font-size: 20px; color: #d9534f;"> 
											<c:set var="price" value=" ${tagSearchList.boprice}" /> 
											<fmt:formatNumber type="currency" currencySymbol="" value="${tagSearchList.boprice}" />원
										</span> 
										<c:if test="${null eq bookMemberInfo.memid}">
												<li style="list-style: none; margin-bottom: 15px;"><fmt:parseNumber
														var="point" value="${tagSearchList.boprice*0.03}"
														pattern="0" />
														<fmt:parseNumber var="repoint" value="${point}" pattern="0" /> 
														포인트: ${repoint}원 적립
												</li>
										</c:if> 
										<c:if test="${null ne bookMemberInfo.memid}">
												<li style="list-style: none; margin-bottom: 30px;"><fmt:parseNumber
														var="point"
														value="${tagSearchList.boprice * memGradePoint}"
														pattern="0" /> 
														<fmt:parseNumber var="repoint" value="${point}" pattern="0" /> 
														포인트: ${repoint}원 적립</li>
										</c:if>
										
										<li style="list-style: none;">도착예정일: 지금 주문하면 <font
											color="blue" size="4px" style="font-weight: bold;">${tagSearchList.day1}일
												${tagSearchList.day2}요일 </font> 도착예정
										</li>
									</ul>
								</td>
								<td
									style="text-align: center; vertical-align: middle; width: 200px;">
									<form name="frm" id="frm">
									수량: <input type="number" name="bagunitotal" id="bagunitotal" class="form-control"
									placeholder="0" max="10" min="0"
									style="margin-bottom: 10px; width: 70px; display: inline;"><br>
									<button type="button" onclick="fn_tagSearchBaguniAdd('${tagSearchList.bounq}','${tagSearchList.boprice}','${tagSearchList.boname}')" class="btn btn-default btn-lg"
										style="margin-bottom: 10px;">장바구니</button> <br>
									<button type="button" class="btn btn-default btn-lg" onclick="fn_checkStock(this.form, '${tagSearchList.bounq}')">바로구매</button>
									</form>
								</td>
							</tr>
						</c:forEach>
	
					</tbody>
				</table>
	
			</div>
		</div>
	</div>
	
	<form name="buyFrm" id="buyFrm" action="buy.do" method="post">
		<input type="hidden" name="checkedBaguni" id="checkedBaguni" value="">
		<input type="hidden" name="buyRoute" id="buyRoute" value="1">
		<input type="hidden" name="buydetailcnt" id="buydetailcnt" value="">
  	</form>

	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
