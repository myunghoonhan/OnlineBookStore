<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>

<title>Insert title here</title>
</head>
<style>
.menubar {
	border: none;
	border: 0px;
	margin: 0px;
	padding: 0px;
	font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans",
		"Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica,
		sans-serif;
	font-size: 14px;
	font-weight: bold;
}

.menubar ul {
	background: rgb(109, 109, 109);
	height: 50px;
	list-style: none;
	margin: 0;
	padding: 0;
}

.menubar li {
	float: left;
	padding: 0px;
}

#li1{
	float: right;
	padding: 0px;
}

.menubar li a {
	background: rgb(109, 109, 109);
	color: #cccccc;
	display: block;
	font-weight: normal;
	line-height: 50px;
	margin: 0px;
	padding: 0px 25px;
	text-align: center;
	text-decoration: none;
}

.menubar li a:hover, .menubar ul li:hover a {
	background: rgb(71, 71, 71);
	color: #FFFFFF;
	text-decoration: none;
}

.menubar li ul {
	background: rgb(109, 109, 109);
	display: none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
	position: absolute;
	width: 200px;
	z-index: 200;
	/*top:1em;
/*left:0;*/
}

.menubar li:hover ul {
	display: block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}

.menubar li li {
	background: rgb(109, 109, 109);
	display: block;
	float: none;
	margin: 0px;
	padding: 0px;
	width: 200px;
}

.menubar li:hover li a {
	background: none;
}

.menubar li ul a {
	display: block;
	height: 50px;
	font-size: 12px;
	font-style: normal;
	margin: 0px;
	padding: 0px 10px 0px 15px;
	text-align: left;
}

.menubar li ul a:hover, .menubar li ul li:hover a {
	background: rgb(71, 71, 71);
	border: 0px;
	color: #ffffff;
	text-decoration: none;
}

.menubar p {
	clear: left;
}
</style>
<script type="text/javascript">
	function fn_test(){
		document.frm.submit();
	}

	function fn_DatabaseToXML() {
		var form = {};

		$.ajax({
			type : 'POST',
			url : "/bookManagerDatabaseToXML.do",
			success : function(data){
				/* console.log(data.jsonArray);
				var json = JSON.stringify(data.jsonArray); */
				console.log(data.json);
				console.log(data.xml);
			},
			error : function() {
				alert(" 오류발생 ");
			}
		});
	}
</script>
<body>
	<div class="menubar">
		<ul>
			<li><a href="/main.do">홈</a></li>
			<li><a href="/bookManagerOrder.do">배송 관리</a></li>
			<li><a href="/bookList.do">상품 관리</a></li>
			<li><a href="#">본사 관리</a>
				<ul>
					<li><a href="/managerTotalPrice.do">총 매출</a></li>
					<li><a href="/managerStockOrderCheck.do">발주 요청 수리</a></li>
				</ul>
			</li>
			<li><a href="#">영업점 관리</a>
				<ul>
					<li><a href="/managerStockList.do">영업점별 발주요청</a></li>
					<li><a href="/managerStockOrderList.do">지점별 발주 요청 리스트</a></li>
					<li><a href="/bookMangerStore.do">영업점 공지사항</a></li>
				</ul>
			</li>
			<li><a href="#" id="current">게시판관리</a>
				<ul>
					<li><a href="/bookManagerQnA.do">Q&A 게시판</a></li>
					<li><a href="/bookManagerNotice.do">홈페이지 공지사항</a></li>
				</ul>
			</li>
			<li><a href="/bookManagerDataVisualizing.do" id="current">JSON입출력</a></li>
			<li><a href="javascript:fn_DatabaseToXML()" id="current">XML추출</a></li>
			<li id="li1"><a href="javascript:fn_test()">관리자 로그아웃</a></li>
		</ul>
	</div>
	
	<form name="frm" id="frm" method="post" action="/bookLogOutManager.do"></form>

</body>
</html>