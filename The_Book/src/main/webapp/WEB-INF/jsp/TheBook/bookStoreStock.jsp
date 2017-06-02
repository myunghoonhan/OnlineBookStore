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
	<center>
	
				<table class="table table-hover table-bordered">
                     <thead>
                        <tr>
                           <th width="30%" style="text-align: center; vertical-align: middle;">영업점</th>
                           <th width="70%" style="text-align: center; vertical-align: middle;">재고</th>
                        </tr>
                     </thead>

                     <tbody>
                        <c:forEach var="bookStoreStock" items="${bookStoreStock}">
                           <tr>
                              <td style="text-align: center; vertical-align: middle;">${bookStoreStock.storename}</td>
                              <td style="text-align: center; vertical-align: middle;">${bookStoreStock.stockstock}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>		
	</center>
</body>
</html>