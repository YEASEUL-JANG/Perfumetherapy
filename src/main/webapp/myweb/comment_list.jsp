<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<style type="text/css">
#review_comment{
width: 100%;
font-size: 15px;
}
</style>
</head>
<body>
<table id="review_comment">
<c:forEach var="co" items="${list }">
<tr>
<td><b>${co.nickname } </b></td>
</tr>
<tr>
<td>${co.content }</td>
</tr>
</c:forEach>
</table>
</body>
</html>