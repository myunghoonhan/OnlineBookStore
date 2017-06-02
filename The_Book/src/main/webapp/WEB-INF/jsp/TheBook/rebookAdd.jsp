<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board test</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
</head>
<body>
<script>

	function fn_save(){

		var form = {};
		
		form.rebobookunq = $("#rebobookunq").val();
		form.reboprice = $("#reboprice").val();
		form.rebocondition = $("#rebocondition option:selected").val();
		
		
			$.ajax({
			
			type: 'POST',
			data: form,
			url: "/rebookInsert.do",
			success: function(data) {
				if(data.rebookInsert == "ok") {
				alert("등록완료")
				self.close();
			}else {
				alert("저장 실패했습니다. 다시 시도해 주세요.");
				}
			},	
			error: function () {
				alert(" 오류발생 ");
			}
		});
	}
	
	function fn_search(){
		var form = {};
		form.boname = $("#boname").val();
		
		$.ajax({
			
			type: 'POST',
			data: form,
			url: "/nameSearch.do",
			
			success: function(data) {
				$("#rebobookunq").find("option").remove();
				$("#rebobookunq").append("<option value=''>책이름</option>");
				$.each(data.bonameList, function(key, value){
					$("#rebobookunq").append("<option value='"+value.bounq+"'>"+value.boname+"</option>");
				});
			},
			error: function () {
				alert(" 오류발생 ");
			}
		});
	}

</script>
<body>
<form name="frm" id="frm">
<table class="table table-hover table-bordered">
 
		<tbody>
     		  <tr>
     		  	<td style="text-align: center; vertical-align: middle;">책이름검색
     		  	<input type="text" name="boname" id="boname" />  <input type="button" value="search" onClick="fn_search()"/>
                </td>            
                <td style="text-align: center; vertical-align: middle;">
                <select id="rebobookunq" name="rebobookunq">
				<option>책이름</option>
				</select>
				</td>              
              </tr>
                     
        </tbody>
			
		<tr>
			<td>가격</td>
			<td><input type="text" name="reboprice" id="reboprice"></td>
		</tr>
		<tr>
			<td>상태</td>
			<td>
				<select id="rebocondition" name="rebocondition">
					<option value="상">상</option>
					<option value="중">중</option>
					<option value="하">하</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매자</td>
			<td><input type="text" name="reboid" value="${id}" disabled="disabled" id="pwd"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
		<input type="button" id="saveBtn" value="저장" onClick="fn_save()"/>
			</td>
		</tr>
	</table>
</form>


</body>
</html>