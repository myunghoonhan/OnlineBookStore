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
<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>
</head>

<script type="text/javascript">
$(function() {
	fn_GetSidebar();
});

function fn_GetSidebar(){
	var form = {};
	$.ajax({
		type: 'POST',
		data: form,
		url: "/GetSidebar.do",
		
		success: function(data) {
			if(data.cookieImg_1 == null){
				$("#sideImg0").hide();
				$("#sideImg1").hide();
			}
			if(data.cookieImg_2 == null){
				$("#sideImg2").hide();
			}
			if(data.cookieImg_3 == null){
				$("#sideImg3").hide();
			}
			if(data.cookieImg_4 == null){
				$("#sideImg4").hide();
			}
			$("#cookieImg_1").attr('src', "/images/poster/"+data.cookieImg_1+".jpg");
			$("#asideImg1").attr('href', "bookDetail.do?bounq="+data.cookieImg_1);
			
			$("#cookieImg_2").attr('src', "/images/poster/"+data.cookieImg_2+".jpg");
			$("#asideImg2").attr('href', "bookDetail.do?bounq="+data.cookieImg_2);
			
			$("#cookieImg_3").attr('src', "/images/poster/"+data.cookieImg_3+".jpg");
			$("#asideImg3").attr('href', "bookDetail.do?bounq="+data.cookieImg_3);
			
			$("#cookieImg_4").attr('src', "/images/poster/"+data.cookieImg_4+".jpg");
			$("#asideImg4").attr('href', "bookDetail.do?bounq="+data.cookieImg_4);
		},
		error: function () {
		}
	}); 
}
</script>

<body style="display: block;  padding-top: 51px;">
	<div class="container">
		<div class="row">

			<!--최근본상품  -->
			<div id="sideImg0" style="position: fixed; top: 26%; right: 0px; width: 100px;">
				<div class="thumbnail" style="padding: 0px; background-color: #5cb85c; border-radius: 0px;">
					<div class="caption" style="text-align: center; padding: 0px;">
						<h5 style="color: white; font-size: 13px;">최근 본 상품</h5>
					</div>
				</div>
			</div>
			
			<div id="sideImg1" style="position: fixed; top: 29%; right: 0px; width: 100px;">
				<a id="asideImg1" href="" class="thumbnail" style="border-radius: 0px;">
					<img id="cookieImg_1" name="cookieImg_1" src="" alt="...">
				</a>
			</div>
			
			<div id="sideImg2"  style="position: fixed; top: 44%; right: 0px; width: 100px;">
				<a id="asideImg2" class="thumbnail" style="border-radius: 0px;">
					<img id="cookieImg_2" name="cookieImg_2" src="" alt="...">
				</a>
			</div>
			
			
			<div id="sideImg3"  style="position: fixed; top: 59%; right: 0px; width: 100px;">
				<a id="asideImg3" class="thumbnail" style="border-radius: 0px;">
					<img id="cookieImg_3" name="cookieImg_3" src="" alt="...">
				</a>
			</div>
			
			
			<div id="sideImg4"  style="position: fixed; top: 74%; right: 0px; width: 100px;">
				<a id="asideImg4" class="thumbnail" style="border-radius: 0px;">
					<img id="cookieImg_4" name="cookieImg_4" src="" alt="...">
				</a>
			</div>
			
		</div>
	</div>

</body>
</html>