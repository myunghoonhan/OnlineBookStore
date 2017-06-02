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
<title>관리자 영업점 공지</title>
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
				width: 3em;
			}
			
			#th2, #td2 {
				width: 25em;
			}
			
			#th3, #td3 {
				width: 15em;
			}
			#th4, #td4{
			width: 13em;
			}
			#th10, #td10 {
				
			}
			
			tr {
			
				background-color: #eee;
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
	
	
	function fn_search(){ 	// 검색하기
		
		var f = document.notiform;
		
		 if(f.selecttype.value == "" ){
			alert("항목을 선택해 주세요");
		
		}/* else if(f.selecttype.value == "storenoticestore"){
			
			f.action = "/bookstNoticesearch.do";
			f.submit();
		
		} */else{
			f.action = "/bookMangerStore.do";
			f.submit();
		}
	}

	
	function fn_update(form){	//수정하기 폼넘기ㅣ
		
		form.action = "/bookstModifyform.do";
		form.submit();
	}	
	
	
	
	function fn_close(unq){	//닫기

		$("#content"+unq).hide()
	}
	
	function fn_click(unq){
	       $("#content"+unq).toggle();
	   }
	
	
	
	function fn_delete(unq) {

		
		var form = {};
		form.storenoticeunq = unq;
		
		
		if (confirm("게시글을 삭제 하시겠습니까?")) {

			$.ajax({
				type : 'POST',
				data : form,
				url : "/bookstnotiDelete.do",
			
				success : function(data) {
					if (data.result > 0) {
						alert("삭제 되었습니다.");
						location.href = "<c:url value="/bookMangerStore.do"/>";
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
	

	
	function fn_insert(){	//영업점 공지사항 등록 폼
		
		document.notiform.action = "/bookAddstorenotform.do";
		document.notiform.submit();
	}
	
/* 	private String storenoticeunq;
	private String storenoticestore;
	private String storenoticetitle;
	private String storenoticecontent;
	private String storenoticeroom;
	private String storenoticeing;
	private Date storenoticeregdate;
	 */
	
	
	</script>
<body>

<jsp:include page="bookManagerheader.jsp"/>
	<form:form commandName="notiVO" id="notiform" name="notiform" method="post">
		<center>
		<h1>관리자 영업점 공지</h1>
			<br><br><br> 
			<select name="selecttype" id="selecttype">
				<option value="">선택해주세요</option>
				<option value="storename">영업점</option>
				<option value="storenoticetitle">제목</option>
				<option value="storenoticecontent">내용</option>
			
			</select>
			<input type="text" id="searchname" name="searchname"  placeholder="검색어를 입력해주세요" />
			<input type="button" id="srcbtn" name="srcbtn" value="검색하기" onClick="fn_search()">
			<a href="/bookMangerStore.do"><input type="button" id="all" name="all" value="전체목록보기"></a>

		<br><br><br><br>
		
		
			<table width="1200" cellpadding="5">
				<tr>
					<th id="th1" width="150">등록 번호</th>
					<th id="th2">제목</th>
					<th id="th3" >지점명</th>
					<th id="th4" >장소</th>
					<th id="th5">기간</th>
					<th id="th6">업로드일자</th>
				</tr>

				<c:forEach var="stnoti" items="${stnotiList}" varStatus="status">

					<tr  id="${stnoti.storenoticeunq}" onclick="fn_click(${stnoti.storenoticeunq})">
						<td id="td1">${stnoti.storenoticeunq }</td>  <!-- 등록번호 -->
						<td id="td2">${stnoti.storenoticetitle }</a></td>					
						<td id="td3">${stnoti.storename }</td>
						<td id="td4">${stnoti.storenoticeroom }</td> <!-- 장소 -->
						<td id="th5">${stnoti.storenoticeing }</td> <!-- 기간 -->
						
						<td id="td6">${stnoti.storenoticeregdate }</td>
					</tr>
					<tr id="content${stnoti.storenoticeunq}" class="content" width="100%">
						<td colspan="6">
							<br>
							<textarea rows="20" cols="30" name="storenoticecontent" style="width:95%" >${stnoti.storenoticecontent}</textarea>
							<br><br>
							
							<form name="up" id="up" method="post" >
							<input type="hidden" name="storenoticeunq" id="storenoticeunq" value="${stnoti.storenoticeunq }" />
							
							
							<input type="button" value="수정하기" onClick="fn_update(this.form)" /> <!-- 안에내용뿌려조 -->
							<input type="button" value="삭제" onClick="fn_delete(${stnoti.storenoticeunq})" />
							<input type="button" value="닫기" onClick="fn_close(${stnoti.storenoticeunq})" />
							<br><br>
							
							</form>
						</td>
					</tr>
					
				</c:forEach>
			</table>
			<br><br>
				<input type="button" value="영업점 공지사항 등록하기" onClick="fn_insert()"/>
		</center>
	</form:form>
	
</body>
</html>
