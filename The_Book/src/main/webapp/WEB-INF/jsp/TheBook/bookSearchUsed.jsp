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
</head>

<body style="display: block;  padding-top: 51px;">

	<jsp:include page="header.jsp">
		<jsp:param value="navbar-fixed-top" name="navbar_style" />
	</jsp:include>
	
	<main>
		
		<div class="container">
			<div class="row" style="margin-bottom: 5px;">
				<div class="col-xs-12">
			      	<div class="btn-group" data-toggle="buttons">
					  <label class="btn btn-default active">
					    <input type="radio" name="options" id="option1" autocomplete="off"> 중고등록일순 <span class="caret"></span>
					  </label>
					  <label class="btn btn-default">
					    <input type="radio" name="options" id="option2" autocomplete="off"> 최저가순 <span class="caret"></span>
					  </label>
					  <label class="btn btn-default">
					    <input type="radio" name="options" id="option3" autocomplete="off"> 최고가순 <span class="caret"></span>
					  </label>
					</div>
				</div>
			</div>
	      
			<div class="row">
				<div class="col-xs-12">
					<table class="table table-hover">
						<tbody>
					     	<c:forEach var="tagSearchList" items="${tagSearchList}">
					     	<tr>
								<td style="text-align: center; vertical-align:middle; width: 100px;">
									<a href="bookDetail.do?bounq=${tagSearchList.bounq}"><img src="/images/poster/${tagSearchList.boimg}" class="img-responsive" alt="Responsive image"></a>
								</td>
								<td style="vertical-align:middle;"><h4 style="margin-bottom: 0px;">${tagSearchList.boname}</h4><br>${tagSearchList.boauthor} 지음 | ${tagSearchList.botrans} 옮김 | ${tagSearchList.bocompany} | ${tagSearchList.publish} <br>${tagSearchList.boprice}원(10% 할인) | 상테: 중급 | 등록일: 2017년 08월 21일<br>판매자: 한명훈</td>
								<td style="text-align: center;vertical-align:middle;  width: 200px;">
									<button type="button" class="btn btn-default btn-lg" style="margin-bottom: 10px;">장바구니</button><br>
									<button type="button" class="btn btn-default btn-lg">바로구매</button>
								</td>
							</tr>
							</c:forEach>
					     </tbody>
					</table>
				</div>
			</div>
			
		</div><!-- end container  -->
	</main>
	
	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
