<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function() {
	var gubun = ${gubun};
	var radio = document.getElementsByName("options");
	radio[gubun-1].checked=true;
});
	

	function fn_1(){
	var form = document.DetailSearch;
	form.gubun.value = $(':radio[name="options"]:checked').val();
	form.method ="post";
	form.action = "/bookSearch.do";
	form.submit();
}
	function fn_2(bounq){
		var form = document.DetailSearch;
		form.bounq.value = bounq;
		alert(form.bounq.value);
		form.method ="post";
		form.action = "/bookSearch.do";
		form.submit();
		
	}
	
	function fn_junggo(bounq){
		var form = document.DetailSearch;
		form.rebobookunq.value = bounq;

		form.method ="post";
		form.action = "/clickJungoList.do";
		form.submit();
	}
	
	function fn_searchBaguniAdd(bounq, boprice , boname){
			if($("#idSearch").val() == ""){
  			alert('로그인 후 이용가능합니다.');
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
	
	function fn_buyAdd(bookunq, cnt){

		var checkedBaguni = [];

		checkedBaguni.push(bookunq);

		document.getElementById("checkedBaguni").value = checkedBaguni;
		document.getElementById("buydetailcnt").value = cnt;
		document.buyFrm.submit();	
	}

	function fn_checkStock(form2, bookunq){

		var cnt = form2.bagunitotal.value;
		
		if($("#idSearch").val() == ""){
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
/*   function fn_radio(){
	var form = {};
	
	form.levelname = $(':radio[name="optionsRadios"]:checked').val();
	alert(form.levelname);
		$.ajax({
		
		type: 'POST',
		data: form,
		url: "/bookSearch.do",
		
		success: function(data) {
			 $("#soName").find("option").remove();
			$.each(data.soList, function(key, value){
				$("#soName").append("<option value='"+value.levelcode+"'>"+value.levelname+"</option>");
			}); 
		},	
		error: function () {
			alert(" 오류발생 ");
		}
	}); 
}   */
</script>
<body style="display: block;  padding-top: 51px;">

	<jsp:include page="header.jsp">
		<jsp:param value="navbar-fixed-top" name="navbar_style" />
	</jsp:include>
	
	
	<main>
	<form name="DetailSearch">
		<input type="hidden" name="gubun">
		<input type="hidden" name="searchCode" value="${searchCode}">
		<input type="hidden" name="searchName" value="${searchName}">
		<input type="hidden" name="bounq">
		<input type="hidden" name="rebobookunq">
		<input type="hidden" id="idSearch" value="${id}">
	</form>

		<div class="container">
	       	
	       	<div class="row">
	       		<div class="col-xs-12">
	       			<div class="jumbotron">
					  <div class="row">
					  	<c:forEach var="bookSearchBar" items="${bookSearchBar}">
					  	<div class="col-xs-4">
					  		<div class="radio">
							  <h4><label><%-- <input type="radio" name="optionsRadios" onclick="fn_radio()" id="optionsRadios" value="${bookSearchBar.levelname}"> --%>${bookSearchBar.levelname} (${bookSearchBar.count})</label></h4>
							</div>
					  	</div>
					  	</c:forEach>
					  </div>
					</div>
	       		</div>
	       	</div>
	       	<div class="row">
				<div class="col-xs-12">
					<c:set var="searchName" value="${searchName}"/>
					<c:forEach var="searchTotCount" items="${searchTotCount}">
					<h3>"${searchName}" 검색결과 (${searchTotCount.count})</h3><br>
					</c:forEach>
					
					
					    <input type="radio" value="1" name="options" id="options" onClick="fn_1()"/>판매량</a>
					    <input type="radio" value="2" name="options" id="options" onClick="fn_1()"/>신상품 </a>
					   	<input type="radio" value="3" name="options" id="options" onClick="fn_1()"/>낮은가격</a>
					    <input type="radio" value="4" name="options" id="options" onClick="fn_1()"/>높은가격 </a>
					    <input type="radio" value="5" name="options" id="options" onClick="fn_1()"/>리뷰수</a>
					    <input type="radio" value="6" name="options" id="options" onClick="fn_1()"/>조회수 </a>
					
					
					<table class="table table-hover">
						<tbody>
							<c:forEach var="searchBookInfo" items="${searchBookInfo}">
					     	<tr>
								<td style="text-align: center; vertical-align:middle; width: 150px;">
									<a href="bookDetail.do?bounq=${searchBookInfo.bounq}"><img src="/images/poster/${searchBookInfo.boimg}" class="img-responsive" alt="Responsive image"></a>
								</td>
								<td style="vertical-align:middle;">
									<ul>
						                <li style="list-style: none;">
						                  <h4><strong>[${searchBookInfo.levelname}] ${searchBookInfo.boname}</strong></h4>
						                </li>
						                <li style="list-style: none; margin-bottom: 10px;">
						                	${searchBookInfo.boauthor} 지음 | ${searchBookInfo.botrans} 옮김 | ${searchBookInfo.bocompany} | ${searchBookInfo.publish}
						                </li>
						            <c:if test="${0 eq searchBookInfo.cnt}">
										<li style="list-style: none; margin-bottom: 30px;">
											리뷰${searchBookInfo.cnt}개 <a href="#" onclick="fn_junggo('${searchBookInfo.bounq}')"
											style="text-decoration: none">중고장터(${searchBookInfo.recnt}건)</a>
											<button type="button" class="btn btn-default btn-xs">리뷰쓰기</button>
										</li>
									</c:if>

									<c:if test="${searchBookInfo.cnt != 0}">
										<fmt:parseNumber var="point"
											value="${searchBookInfo.star/searchBookInfo.cnt}" pattern="0" />
										<c:forEach begin="1" end="${point}">
											<img src="/images/star.png"
												style="width: 20px; height: auto;">
										</c:forEach>
											  리뷰${searchBookInfo.cnt}개 
											 <a href="#" onclick="fn_junggo('${searchBookInfo.bounq}')" style="text-decoration: none">중고장터(${searchBookInfo.recnt}건)</a>
										<button type="button" class="btn btn-default btn-xs">리뷰쓰기</button>
									</c:if>
						                <li style="list-style: none; margin-bottom: 10px;">
						                	<span style=" font-size: 20px; color: #d9534f;">
											<fmt:formatNumber type="currency" currencySymbol="" value="${searchBookInfo.boprice}"/>원
											</span>
						
									<%-- <c:set var="memGradePoint" value="${memGradePoint}"/>
									<c:set var="addPoint" value="${searchBookInfo.boprice*memGradePoint}"/>
					     			<fmt:parseNumber var="point" value="${addPoint}" pattern="0" />
											| ${point}원 적립 --%>
									<c:if test="${null eq bookMemberInfo.memid}">
											<li style="list-style: none; margin-bottom: 30px;"><fmt:parseNumber
													var="point" value="${searchBookInfo.boprice*0.03}"
													pattern="0" />
													<fmt:parseNumber var="repoint" value="${point}" pattern="0" />
													| ${repoint}원 적립
											</li>
									</c:if> 
									<c:if test="${null ne bookMemberInfo.memid}">
											<li style="list-style: none; margin-bottom: 30px;"><fmt:parseNumber
													var="point"
													value="${searchBookInfo.boprice * memGradePoint}"
													pattern="0" />
													<fmt:parseNumber var="repoint" value="${point}" pattern="0" /> 
													포인트: ${repoint}원 적립</li>
									</c:if>
						                </li>
						                <li style="list-style: none;">
						                	도착예정일: 지금 주문하면 <font color="blue" size="4px" style="font-weight: bold;"> 내일  ${searchBookInfo.day1}일 ${searchBookInfo.day2} </font> 도착예정
						                </li>
						              </ul>
								</td>
								<td style="text-align: center;vertical-align:middle;  width: 200px;">
									<form name="frm" id="frm">
									수량: <input type="number" name="bagunitotal" id="bagunitotal" class="form-control" placeholder="0" max="10" min="0" style="margin-bottom: 10px; width: 70px; display: inline;"><br>
									<button type="button" class="btn btn-default btn-lg"  onclick="fn_searchBaguniAdd('${searchBookInfo.bounq}','${searchBookInfo.boprice}','${searchBookInfo.boname}')"  style="margin-bottom: 10px;">장바구니</button><br>
									<button type="button" class="btn btn-default btn-lg" onclick="fn_checkStock(this.form, '${searchBookInfo.bounq}')">바로구매</button>
									</form>
								</td>
							</tr>
							</c:forEach>
					     </tbody>
					</table>
					
		    	</div>
			</div>
			
		</div><!-- end container  -->
	
	<form name="buyFrm" id="buyFrm" action="buy.do" method="post">
		<input type="hidden" name="checkedBaguni" id="checkedBaguni" value="">
		<input type="hidden" name="buyRoute" id="buyRoute" value="1">
		<input type="hidden" name="buydetailcnt" id="buydetailcnt" value="">
  	</form>
	
	</main>
	
	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
