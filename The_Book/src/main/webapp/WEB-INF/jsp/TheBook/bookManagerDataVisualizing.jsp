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
<style type="text/css">
table {
	font-family: "Lato", "sans-serif";
	font-size: 10pt
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
#th1, #td1, #th7, #td7 {
	width: 5em;
}

#th2, #td2 {
	width: 20em;
}

tr {
	background-color: #eee;
}

#ud {
	background-color: #ffffff
}
</style>

<script type="text/javascript">
	function fn_ShowData_JSON() {

		var input, file, fr;
		input = document.getElementById('fileinput');

		file = input.files[0];
		fr = new FileReader();
		fr.onload = receivedText;
		fr.readAsText(file);

		function receivedText(e) {

			lines = e.target.result;
			console.log(lines);
			var jsonArray = JSON.parse(lines);
			console.log(jsonArray);
			var objId = "tt";
			var table = createTable(jsonArray, objId);

			$("#" + objId).remove();
			$("#table").append(table);

			function createTable(jsonArray, objId) {
				/* jsonArray : json객체
				    objId       : 생성할 테이블 ID
				 */
				var jsonObj = new Array();
				var jsonObjTitle = new Array();

				var table = "<table id='"+ objId+ "' width='1500'  cellpadding='3' cellspacing='3'>";
				table += "<tbody>";
				/* TITLE 생성*/
				jsonObjTitle = jsonArray[0];
				table += "<tr>";
				table += "<th>순번</th>";
				for ( var item in jsonObjTitle) {
					table += "<th>" + item + "</th>";
				}
				table += "</tr>";
				table += "<tr>";

				/* RESULT 생성*/
				for (var i = 0; i < jsonArray.length; i++) {
					jsonObj = jsonArray[i];
					table += "<td>" + i + "</td>";
					for ( var item in jsonObj) {
						table += "<td>" + jsonObj[item] + "</td>"
					}
					table += "</tr>";
				}
				table += "</tbody></table>";
				return table;
			}
		}
	}
</script>

<body>
	<jsp:include page="bookManagerheader.jsp" />
	<center>
		<h1>데이터 출력</h1>
		<form id="frm" method="post" enctype="multipart/form-data">
			<table class="hover_color">
				<colgroup>
					<col width="150" />
					<col width="*" />
				</colgroup>
				<tr>
					<td class="tbtd_caption">파일</td>
					<td class="tbtd_content"><input type="file" id="fileinput"
						name="fileinput" size="70" /></td>
				</tr>
			</table>
		</form>
		<table>
			<tr>
				<td align="right"><input type="button" id="saveBtn" value="등록" onclick="fn_ShowData_JSON();"></td>
			</tr>
		</table>

		<br> <br> <br>
		
		<div id="table" class="table">
		
		</div>

	</center>
</body>
</html>