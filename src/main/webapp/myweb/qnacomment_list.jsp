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
#commentlist{
margin-top: 40px;
width: 100%;
border-top: 2px solid #e8e8e8;
border-bottom: 2px solid #e8e8e8;
color: #999;
}
#commentlist td{
padding: 10px;
border-bottom: 1px solid #e8e8e8;}
</style>
</head>
<body>
<table id="commentlist">
<c:forEach var = "co" items="${list }">
 <tr>
 <td style="font-weight: bold; width:20%; text-align: center; border-right: 1px solid #e8e8e8;">: ${co.writer }</td><td>${co.content }</td>
 </tr>
</c:forEach>
</table>
</body>
</html>