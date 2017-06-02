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
	function fn_radio(){
		var form = {};

		form.levelcode = $(':radio[name="jungRadio"]:checked').val();
		form.taggubun = '1';
			$.ajax({
			
			type: 'POST',
			data: form,
			url: "/jungInsert.do",
			
			success: function(data) {
	 			$("#soName").find("option").remove();
		 		/* $("#soName").append("<option>"+'선택하세요'+"</option>") */;
				$.each(data.soList, function(key, value){
					$("#soName").append("<option value='"+value.levelcode+"'>"+value.levelname+"</option>");
				});
			},	
			error: function () {
				alert(" 오류발생 ");
			}
		});
	}
	

	
 	/* function fn_searchbutton(){
		var form = {};
		form.levelcode = $("#soName").val();
		
			$.ajax({
			
			type: 'POST',
			data: form,
			url: "/searchbutton.do",
			
			success: function(data) {
				location.href = "<c:url value='/b.do?bounq="+data.bookunq+"'/>";
			},	
			error: function () {
				alert(" 오류발생 ");
			}
		});
	}  */
	
	 function fn_searchbutton(){
		
		
		
		var form = document.search;
		form.levelcode.value = $("#soName").val();
		form.taggubun.value= '1';
		form.method ="post";
		form.action = "/searchbutton.do";
		form.submit();
			
	} 

</script>

<body style="display: block;  padding-top: 51px;">

	<jsp:include page="header.jsp">
		<jsp:param value="navbar-fixed-top" name="navbar_style" />
	</jsp:include>
	
	<form name="search">
		<input type="hidden" name="levelcode">
		<input type="hidden" name="taggubun">
	</form>
	
	<main>
		<div class="container">
		
			<div class="row">
				<div class="col-xs-12">
					<h2>선택 01</h2>
					<hr>
		    	</div>
			</div>
			
	       	<div class="row">
	       		<div class="col-xs-12">
	       			<div class="jumbotron">
					  <div class="row">
					  	<c:forEach var="list" items="${guknae}">
					  	<div class="col-xs-4">
					  		<div class="radio">
					  			  <h4><label><input type="radio" name="jungRadio" id="jungRadio" onclick="fn_radio()" value="${list.levelcode }">${list.levelname}</label></h4>
							</div>
					  	</div>
					  	</c:forEach>
					  </div>
					</div>
	       		</div>
	       	</div>
	       	
	       	<div class="row">
				<div class="col-xs-12">
					<h2>선택 02</h2>
					<hr>
		    	</div>
			</div>
			
			<div class="row">
				<div class="col-xs-3">
					<select id="soName" name="soName" class="form-control">
						<option>선택하세요</option>
					</select>
		    	</div>
		    </div>
		    
		    <hr>
			
			<div class="row">
		    	<div class="col-xs-12" align="center">
					<button type="button" class="btn btn-success btn-lg" onclick="fn_searchbutton()" style="border-radius: 0px; width: 300px; height: auto">검색</button>
		    	</div>
			</div>
		
		</div><!-- end container  -->
	</main>
	</body>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>


</html>
