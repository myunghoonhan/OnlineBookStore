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
<title>관리자 책 정보 수정</title>

<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>

<script src="<c:url value="/js/jquery-ui.js"/>"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<style>


  
input, textarea { 
    padding: 5px; 
    border: solid 1px #E5E5E5; 
    outline: 0; 
    font: normal 13px/100% Verdana, Tahoma, sans-serif; 
    width: 150px; 
   
    box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 
    -moz-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 
    -webkit-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 
    } 
   
textarea { 
    width: 400px; 
    max-width: 400px; 
    height: 150px; 
    line-height: 150%; 
    } 
   
input:hover, textarea:hover, 
input:focus, textarea:focus { 
    border-color: #C9C9C9; 
    -webkit-box-shadow: rgba(0, 0, 0, 0.15) 0px 0px 8px; 
    } 
   
.form label { 
    margin-left: 10px; 
    color: #999999; 
    padding : 5px;
    } 
   
.submit input { 
    width: auto; 
    padding: 9px 15px; 
    background: #617798; 
    border: 0; 
    font-size: 14px; 
    color: #FFFFFF; 
    -moz-border-radius: 5px; 
    -webkit-border-radius: 5px; 
    }
   </style>
	<script type="text/javascript">
	
	
	function fn_update() {
		
		var form =  new FormData(document.getElementById('frm1'));

		
		
		
		if (confirm("새 책 정보를 수정 하시겠습니까?")) {
	
			$.ajax({
				type : 'POST',
				data : form,
				url : "/bookinfoModify.do",
				processData: false,
				contentType: false,
				success : function(data) {
					if (data.result >0  && data.result1 > 0  ) {
						alert("수정 되었습니다.");
						location.href = "<c:url value="/bookList.do"/>";
					}else if(data.result >0  && data.result1 > 0 && data.result2 > 0 ) {
						alert("수정 되었습니다.");
						location.href = "<c:url value="/bookList.do"/>";
					}else {
						alert("수정 실패했습니다. 다시 시도해 주세요.");
					}
				},
				error : function() {
					alert("오류발생 ");
				}
			});
		}
	}
	

	
	
	$(document).ready(function(){
		var st =  ${book.bocode};
		$("#bocode").val(st).prop("selected", true);
	});

	</script>
<body>

<jsp:include page="bookManagerheader.jsp"/>
	<form id="frm1" name="frm1" method="post"  enctype="multipart/form-data">
		<center>


			<h1>책 수정</h1>
			<table style="background-color:#FAFAFA">
				<tr>
					
					<td>분류코드 : </td>
					<td>
						<select id="bocode" name="bocode">
							<option value="100101">한미소설</option>
							<option value="100102">영미소설</option>
							<option value="100103">기타소설</option>
							<option value="100201">장르시</option>
							<option value="100203">지혜/상식</option>
							<option value="100301">성공/자기계발</option>
							<option value="100303">인간관계</option>
							<option value="100401">인문학일반</option>
							<option value="100402">심리학</option>
							<option value="100403">유아교육</option>
							<option value="100501">유아</option>
							<option value="100502">어린이</option>
							<option value="100601">참고서</option>
							<option value="100602">취업서/외국어</option>
							<option value="100701">육아</option>
							<option value="100702">여행</option>
							<option value="100703">요리/취미</option>
							<option value="100801">잡지</option>
							<option value="100802">만화</option>
							<option value="200101">문학</option>
							<option value="200201">교재</option>
							<option value="200202">유아영어</option>
							<option value="200301">잡지</option>
							<option value="200401">프랑스도서</option>
							<option value="200402">독일도서</option>

						</select>
					</td>
				
				<tr>
					<td>제목</td>
					<td><input type="text" name="boname" id="boname" value="${book.boname }"/></td>
				</tr>
				<tr>
					<td>저자</td>
					<td><input type="text" name="boauthor" id="boauthor" value="${book.boauthor }" /></td>
					<td>옮긴이</td>
					<td><input type="text" name="botrans" id="botrans" value="${book.botrans }" />
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="bocompany" id="bocompany" value="${book.bocompany }" /></td>
					<td>출간일</td>
					<td><input type="text" name="bopublish" id="bopublish" value="${book.bopublish }" /></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" name="boprice" id="boprice" value="${book.boprice }" /></td>
				</tr>
				<tr>
					<td>메인사진</td>
					  <!-- 파일업로드는 input type="file" -->
            		<td class="tbtd_content">
            		<input type="file" name="file1"  id="file1" size="70"   value="${book.boimg }"/>
            	    </td>
				</tr>
				<tr>
					<td>페이지</td>
					<td><input type="text" name="bopage" id="bopage" value="${book.bopage }"/></td>
				</tr>
				<tr>
					<td>사이즈</td>
					<td><input type="text" name="bosize" id="bosize" value="${book.bosize }" /></td>
				</tr>
				<tr>
					<td>도서 소개 </td>
					<td><textarea name="boinfo1" id="boinfo1" rows="20" cols="50" >${book.boinfo1 }</textarea></td>
				</tr>
				<tr>
					<td>저자 소개 </td>
					<td><textarea name="boinfo2" id="boinfo2" rows="20" cols="50">${book.boinfo2 }</textarea></td>
				</tr>
				<tr>
					<td>재고</td>
					<td><input type="number" name="stockstock" id="stockstock" value="${book.stockstock }"/></td>
					
					<input type="hidden" name="bounq" id="bounq" value="${book.bounq }"/>
				</tr>
				
			</table>
		
			<br> <input type="button" name="okbtn" value="수정하기" onclick="fn_update()" /> 
			<a href="/bookList.do"><input type="button" name="listbtn" value="목록으로" /></a>
		</center>
	</form>





</body>
</html>