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
<title>관리자 고객 QnA 관리 (댓글, 수정, 삭제)</title>
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
				width: 10em;
			}
			
			th { /* removed the border from the table heading row  */
				text-align: center;
				width: 10em;
				padding: 1em;
				background-color: #e8503a;
				/* text-align: center;                
					padding: 1em;
					background-color: #e8503a;       /* added a red background color to the heading cells  */
				color: white;
				*/
			} /* added a white font color to the heading text */
			#th1, #td1 {
				width: 5em;
			}
			
			#th2, #td2 {
				width: 30em;
			}
			
			#th8, #td8 {
				
			}
			#th10, #td10 {
				
			}
			
			tr {
			
				background-color: #eee;
			}
			#ud {
				background-color:#ffffff
			}
			
			/* /* 
					table tr:nth-child(even) {            /* added all even rows a #eee color  
					    background-color: #eee;     }
					table tr:nth-child(odd) {            /* added all odd rows a #fff color  
					background-color:#fff;      } */
					
				
</style>
	<script type="text/javascript">
	
	
	$(document).ready(function(){
	      $(".content").each(function(i){
	         $(this).hide();
	      });
	   });
	
	
	function fn_click(unq){
	       $("#content"+unq).toggle();
	   }
	
	
	function fn_search(){ 	// 검색하기
		
		var f = document.qform;
		
		 if(f.search.value == "" ){
			alert("항목을 선택해 주세요");
		
		}else{
			f.action = "/bookManagerQnA.do";
			f.submit();
		}
	}
	
	
	
	function fn_close(unq){	//닫기

		$("#content"+unq).hide()
	}
	
	
	
 
	//답변등록
	function fn_repl(commentform) {

		alert(commentform.qnatitle.value);
		var form = {};
		form.qnaunq = commentform.qnaunq.value;
		form.qnatitle = commentform.qnatitle.value;
		form.qnacontent = commentform.qnacontent.value;
		
		if (confirm("답변을 등록 하시겠습니까?")) {

			$.ajax({
				type : 'POST',
				data : form,
				url : "/bookQnAupdate.do",
			
				success : function(data) {
					if (data.result > 0) {
						alert("답변이 등록 되었습니다.");
						location.href = "<c:url value="/bookManagerQnA.do"/>";
					} else {
						alert("답변 달기 실패했습니다. 다시 시도해 주세요.");
					}
				},
				error : function() {
					alert("오류발생 ");
				}
			});
		}
	}
	
	
	
	function fn_delete(commentform) {

		var form = {};
		form.qnaunq = commentform.qnaunq.value;
		
		
		if (confirm("게시글을 삭제 하시겠습니까?")) {

			$.ajax({
				type : 'POST',
				data : form,
				url : "/bookQnAdelete.do",
			
				success : function(data) {
					if (data.result > 0) {
						alert("삭제 되었습니다.");
						location.href = "<c:url value="/bookManagerQnA.do"/>";
					} else {
						alert("삭제 실패했습니다. 다시 시도해 주세요.");
					}
				},
				error : function() {
					alert("오류발생 ");
				}
			});
		}
	}
	
	
	
	</script>
<body>

<jsp:include page="bookManagerheader.jsp"/>
	<form:form commandName="qnaVO" id="qform" name="qform" method="post">
		<center>
		<h1>Q&A 게시판관리</h1>
			<br><br><br> 
			<select name="search" id="search">
				<option value="">선택해주세요</option>
				<option value="qnatitle">제목</option>
				<option value="qnaid">아이디</option>
				<option value="qnacontent">내용</option>
			</select> 
			<input type="text" id="name" name="name"  placeholder="검색어를 입력해주세요" />
			<input type="button" id="srcbtn" name="srcbtn" value="검색하기" onClick="fn_search()">
			<a href="/bookManagerQnA.do"><input type="button" id="all" name="all" value="전체목록보기"></a>
			

		<br><br><br><br>
		
		
			<table width="1000" cellpadding="5">
				<tr>
					<th id="th1" width="150">글번호</th>
					<th id="th2">제목</th>
					<th id="th3" width="150">아이디</th>
					<th id="th4" width="200">업로드일자</th>
				</tr>

				<c:forEach var="qna" items="${qnaList}" varStatus="status">
				 <form name="commentform" id="commentform" >
					<tr id="${qna.qnaunq}" onclick="fn_click(${qna.qnaunq})">
					
						<td id="td1">${qna.qnaunq }</td>  <!-- 글번호 -->
						<td id="td2">
							${qna.qnatitle }
							<input type="hidden" id="qnatitle" name="qnatitle" value="${qna.qnatitle }" />
						</td>						
						<td id="td3" >${qna.qnaid }</td>
						<td id="td4">${qna.qnaregdate }</td>
					</tr>
					
					<tr id="content${qna.qnaunq}" class="content">
						<td colspan="4">
							<br>
							<textarea rows="20" cols="30" name="qnacontent" style="width:95%"  values="${qna.qnacontent}">${qna.qnacontent}</textarea>
							<br><br>
							<input type="button" value="답변하기" onClick="fn_repl(this.form)" /> <!-- 안에내용뿌려조 -->
							<input type="button" value="삭제" onClick="fn_delete(this.form)" />
							<input type="button" value="닫기" onClick="fn_close(${qna.qnaunq})" />
							<br><br>
						</td>
					</tr> 
				
						<input type="hidden" name="qnaunq" id="qnaunq" value="${qna.qnaunq }" />
					
					</form>
				</c:forEach>
			</table>
		</center>
	</form:form>
	
</body>
</html>


<%-- 
<table>
      <c:forEach begin="1" end="5" var="i" varStatus="a">
         <tr id="${a.index }" onclick="fn_te(${a.index})">
            <td>리스트</td>
         </tr>
         <tr id="content${a.index }">
            <td>내용</td>
         </tr>
      </c:forEach>
   </table>
   
   
   
   
   
   function fn_te(unq){
       $("#content"+unq).toggle();
   } --%>