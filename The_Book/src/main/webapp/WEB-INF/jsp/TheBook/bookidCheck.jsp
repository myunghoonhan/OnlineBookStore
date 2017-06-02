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

<body>
    <c:set var="count" value="${count}"/>
	<table border=0 align = "center">
      <tr>
         <td align = "center">
         <c:if test="${count==1}">
		   <br>
           ${id}는 이미 존재하는 ID입니다. &nbsp;<br><br>
         <input type="button" value="닫기" onClick="javascript:self.close();
               opener.document.regForm.mem_id.focus();">
		 </c:if>
		 
		 <c:if test="${count!=1}">
		   <br>
         	${id}는 사용가능한 ID입니다. &nbsp;<br><br>
         <input type="button" value="닫기" onClick="javascript:self.close();
                 opener.document.regForm.mem_passwd.focus();">
		 </c:if>
         </td>
      </tr>
   </table>
</body>
</html>