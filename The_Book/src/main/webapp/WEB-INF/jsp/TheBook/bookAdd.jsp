
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
<title>관리자 책 정보 등록</title>

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
    width: 200px; 
   
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
	
	 function fn_select(){
	      var form = {};

	      form.levelcode = $("#searchCode").val();
	         $.ajax({
	         
	         type: 'POST',
	         data: form,
	         url: "/bookselectTest.do",
	         
	         success: function(data) {
	             $("#searchCode").find("option").remove();
	             /* $("#soName").append("<option>"+'선택하세요'+"</option>") */;
	            $.each(data.soList, function(key, value){
	               $("#searchCode").append("<option value='"+value.levelcode+"'>"+value.levelname+"</option>");
	            });
	         },   
	         error: function () {
	            alert(" 오류발생 ");
	         }
	      });
	   }
	
	
	function fn_insert() {
		
		var form =  new FormData(document.getElementById('frm'));
		
	
		
		
		
		if (confirm("새 책 정보를 등록 하시겠습니까?")) {
	
			$.ajax({
				type : 'POST',
				data : form,
				url : "/nbookInsert.do",
				processData: false,
				contentType: false,
				success : function(data) {
					if (data.result =="ok" && data.result1 =="ok") {
						alert("등록 되었습니다.");
						location.href = "<c:url value="/bookList.do"/>";
					} else {
						alert("등록 실패했습니다. 다시 시도해 주세요.");
					}
				},
				error : function() {
					alert("오류발생 ");
				}
			});
		}
	}
	
	

/*  	 m1Array = new Array("소설","자기계발","시/에세이","인문","유아","학습서","가정/건강","잡지/만화");
	 m2Array = new Array("영미도서","어린이영어","일본도서","기타언어권");
	
	 
	 
	 function changeSelect1(value) {
	  if(value == '국내도서') {
	   for(i=0; i<m1Array.length; i++) {
	    option = new Option(m1Array[i]);
	    document.all.searchCode1.options[i+1] = option;
	   }
	  }
	  if(value == '외국도서') {
	   for(i=0; i<m2Array.length; i++) {
	    option = new Option(m2Array[i]);
	    document.all.searchCode1.options[i+1] = option;
	   }
	  }
	 }  */
	 
	
	/*  a1Array = new Array("한미소설","영미소설","기타소설","장르시","테마에세이","지혜/상식","성공/자기계발","비즈니스","인간관계","인문학일반","심리학","유아교육","유아","어린이","참고서","취업서/외국어","육아","여행","요리/취미","잡지","만화");
	a2Array = new Array("문학","교재","유아영어","잡지","만화/애니","프랑스도서","독일도서");
	 
	 function changeSelect1(value) {
		  if(value == '소설') {
		   for(i=0; i<a1Array.length; i++) {
		    option = new Option(a1Array[i]);
		    document.all.searchCode2.options[i+1] = option;
		   }
		  }
		  if(value == '자기계발') {
			   for(i=0; i<a1Array.length; i++) {
			    option = new Option(a1Array[i]);
			    document.all.searchCode2.options[i+1] = option;
			   }
			  }
		  if(value == '시/에세이') {
			   for(i=0; i<a1Array.length; i++) {
			    option = new Option(a1Array[i]);
			    document.all.searchCode2.options[i+1] = option;
			   }
			  }
		  if(value == '인문') {
			   for(i=0; i<a1Array.length; i++) {
			    option = new Option(a1Array[i]);
			    document.all.searchCode2.options[i+1] = option;
			   }
			  }
		  if(value == '유아') {
			   for(i=0; i<a1Array.length; i++) {
			    option = new Option(a1Array[i]);
			    document.all.searchCode2.options[i+1] = option;
			   }
			  }
		  if(value == '학습서') {
			   for(i=0; i<a1Array.length; i++) {
			    option = new Option(a1Array[i]);
			    document.all.searchCode2.options[i+1] = option;
			   }
			  }
		  if(value == '가정/건강') {
			   for(i=0; i<a1Array.length; i++) {
			    option = new Option(a1Array[i]);
			    document.all.searchCode2.options[i+1] = option;
			   }
			  }
		  if(value == '잡지/만화') {
			   for(i=0; i<a1Array.length; i++) {
			    option = new Option(a1Array[i]);
			    document.all.searchCode2.options[i+1] = option;
			   }
			  }
		  if(value == '영미도서') {
			   for(i=0; i<a2Array.length; i++) {
			    option = new Option(a2Array[i]);
			    document.all.searchCode2.options[i+1] = option;
			   }
			  }
		  if(value == '어린이영어') {
			   for(i=0; i<a2Array.length; i++) {
			    option = new Option(a2Array[i]);
			    document.all.searchCode2.options[i+1] = option;
			   }
			  }
		  if(value == '일본도서') {
			   for(i=0; i<a2Array.length; i++) {
			    option = new Option(a2Array[i]);
			    document.all.searchCode2.options[i+1] = option;
			   }
			  }
		  if(value == '기타언어권') {
			   for(i=0; i<a2Array.length; i++) {
			    option = new Option(a2Array[i]);
			    document.all.searchCode2.options[i+1] = option;
			   }
			  }
		 }
	  */
	  
	 
	 /* function changeSelect3(value){
	      var form = {};

	      form.levelcode = $("#searchCode").val();
	         $.ajax({
	         
	         type: 'POST',
	         data: form,
	         url: "/bookselectTest.do",
	         
	         success: function(data) {
	             $("#searchCode").find("option").remove();
	              $("#soName").append("<option>"+'선택하세요'+"</option>") ;
	            $.each(data.soList, function(key, value){
	               $("#searchCode").append("<option value='"+value.levelcode+"'>"+value.levelname+"</option>");
	            });
	         },   
	         error: function () {
	            alert(" 오류발생 ");
	         }
	      });
	   } */
	   
/* 	   mArray = new Array("팝송","최신음악","가요");
	   aArray = new Array("중세미술","근대미술","현대미술");
	   
	   function changeSelect(value) {
	    if(value == 'music') {
	     for(i=0; i<mArray.length; i++) {
	      option = new Option(mArray[i]);
	      document.all.medium.options[i+1] = option;
	     }
	    }
	    if(value == 'art') {
	     for(i=0; i<aArray.length; i++) {
	      option = new Option(aArray[i]);
	      document.all.medium.options[i+1] = option;
	     }
	    }
	   }
	    */
	   
	</script>

	
	
	
	
	

<body>

 


<jsp:include page="bookManagerheader.jsp"/>
	<form id="frm" name="frm" method="post"  enctype="multipart/form-data">
		<center>


			<h1>새 책 등록</h1>
			<table  style="background-color:#FAFAFA"; cellpadding="10">
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
					<!-- <td>분류 코드 : </td>
					<td >
						<select id="searchCode" name="searchCode" onchange="changeSelect1(value)">
							<option >대분류</option>
							<option value="국내도서">국내도서</option>
							<option value="외국도서">외국도서</option>

						</select>
						<select id="searchCode1" name="searchCode1" onchange="changeSelect2(value)">
							<option >중분류</option>

						</select>
						<select id="searchCode2" name="searchCode2" onchange="changeSelect3(value)">
							<option >소분류</option>
	
						</select>
					</td> -->
				</tr>
				
				<tr>
					<td style="align:center">제목</td>
					<td><input type="text" name="boname" id="boname" /></td>
				</tr>
				<tr>
					<td>저자</td>
					<td><input type="text" name="boauthor" id="boauthor"/></td>
				</tr>
				<tr>
					<td>옮긴이</td>
					<td><input type="text" name="botrans" id="botrans"/>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="bocompany" id="bocompany"/></td>
				</tr>
				<tr>
					<td>출간일</td>
					<td><input type="text" name="bopublish" id="bopublish"/></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" name="boprice" id="boprice"/></td>
				</tr>
				<tr>
					<td>메인사진</td>
					  <!-- 파일업로드는 input type="file" -->
            		<td class="tbtd_content">
            		<input type="file" name="file1"  id="file1" size="70"  />
            	    </td>
				</tr>
				<tr>
					<td>미리보기 1</td>
					<td><input type="file" name="file2"  id="file2" size="70" /></td>
				</tr>
				<tr>
					<td>미리보기 2</td>
					<td><input type="file" name="file3" id="file3" size="70" /></td>
				</tr>
				<tr>
					<td>미리보기 3</td>
					<td><input type="file" name="file4" id="file4" size="70"/></td>
				</tr>
				<tr>
					<td>페이지</td>
					<td><input type="text" name="bopage" id="bopage"/></td>
				</tr>
				<tr>
					<td>사이즈</td>
					<td><input type="text" name="bosize" id="bosize"/></td>
				</tr>
				<tr>
					<td>도서 소개 </td>
					<td><textarea name="boinfo1" id="boinfo1" rows="20" cols="50"></textarea></td>
				</tr>
				<tr>
					<td>저자 소개 </td>
					<td><textarea name="boinfo2" id="boinfo2" rows="20" cols="50"></textarea></td>
				</tr>
				<tr>
					<td>재고</td>
					<td><input type="number" name="stockstock" id="stockstock"/></td>
					

				</tr>
				
			</table>
		
			<br> <input type="button" name="okbtn" value="등록하기" onclick="fn_insert()" /> 
			<a href="/bookList.do"><input type="button" name="listbtn" value="목록으로" /></a>
		</center>
	</form>





</body>
</html>