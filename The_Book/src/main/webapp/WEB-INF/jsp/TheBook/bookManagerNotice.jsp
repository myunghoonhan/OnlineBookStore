
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 홈페이지 공지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</head>
	<style type="text/css">
			table {
				font-family: "Lato", "sans-serif";
				 font-size:10pt
			} /* added custom font-family  */
			table.one {
				margin-bottom: 3em;
				border-collapse: collapse;
			}
			td { /* removed the border from the table data rows  */
				text-align: center;
	
			}
			
			th { /* removed the border from the table heading row  */
				text-align: center;
				
				padding: 1em;
				background-color: #e8503a;
				/* text-align: center;                
					padding: 1em;
					background-color: #e8503a;       /* added a red background color to the heading cells  */
				color: white;
				*/
			} /* added a white font color to the heading text */
			
	
			
			tr {
			
				background-color: #eee;
			}
			
			#th1, #td1{
				width: 5em;
			}
			/* /* 
					table tr:nth-child(even) {            /* added all even rows a #eee color  
					    background-color: #eee;     }
					table tr:nth-child(odd) {            /* added all odd rows a #fff color  
					background-color:#fff;      } */
					
				
	</style>
	<script type="text/javascript">
	
	
	function fn_search(){ 	// 검색하기
		
		var f = document.notiform;
		
		 if(f.searchname.value == "" ){
			alert("검색할 내용을 입력해 주세요");
		
		}else{
			f.action = "/bookNoticesearch.do";
			f.submit();
		}
	}
	
	function fn_all(){	//전체목록보기
		
		document.notiform.action = "/bookManagerNotice.do";
		document.notiform.submit();
	}
	
function fn_click(unq){ 	// 검색하기
		
	document.form1.action="/bookModifyform.do";
	document.notiform.submit();

	}
	
	</script>
<body>
<jsp:include page="bookManagerheader.jsp"/>

	<form:form commandName="notiVO" id="notiform" name="notiform" method="post">
		<center>
		<h1>관리자 홈페이지 공지</h1>
			<br><br><br> 
			<input type="text" id="searchname" name="searchname"  placeholder="제목을 입력해주세요" />
			<input type="button" id="srcbtn" name="srcbtn" value="검색하기" onClick="fn_search()">
			<input type="button" id="all" name="all" value="전체목록보기" onClick="fn_all()">

		<br><br><br><br>
		
		
			<table width="1000" cellpadding="5">
				<tr>
					<th id="th1" width="150">등록 번호</th>
					<th id="th2">제목</th>
					<th id="th3">조회수</th>
					<th id="th4">업로드일자</th>
				</tr>

				<c:forEach var="noti" items="${notiList}" varStatus="status">
				<form name="form1">
					<tr id="tr1" onclick="fn_click(${noti.booknoticeunq})">
						<td id="td1">${noti.booknoticeunq }</td>  <!-- 등록번호 -->
						<td id="td2"><a href="/bookModifyform.do?booknoticeunq=${noti.booknoticeunq}" style="text-decoration:none">${noti.booknoticetitle }</a></td>					
						<td id="td3" >${noti.booknoticehit }</td>
						<td id="td4">${noti.booknoticeregdate }</td>
						
					</tr>
				
						<input type="hidden" name="booknoticeunq" id="booknoticeunq" value="${noti.booknoticeunq }" />
					
				</form>
				</c:forEach>
			</table>
			<br><br>
			<a href="/bookAddNoticeform.do"><input type="button" value="홈페이지 공지 등록하기" /></a>
		</center>
	</form:form>
	
</body>
</html>
