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
.balloon-left {
  position: relative;
  display: block;
  margin: 1.5em 0 1.5em 15px;
  padding: 7px 10px;
  max-width: 50%;
  color: #555;
  font-size: 16px;
  background: #FFF;
  border: solid 2px #898683;
  border-radius: 8px;
  box-sizing: border-box;
}
.balloon-left:before {
  content: "";
  position: absolute;
  top: 25%;
  left: -24px;
  margin-top: -12px;
  border: 12px solid transparent;
  border-right: 12px solid #FFF;
  z-index: 2;
}

.balloon-left:after {
  content: "";
  position: absolute;
  top: 25%;
  left: -30px;
  margin-top: -14px;
  border: 14px solid transparent;
  border-right: 14px solid #898683;
  z-index: 1;
}

.balloon-left p {
  margin: 0;
  padding: 0;
}
</style>
</head>
<body>
<c:forEach var = "co" items="${list }">
 <div class="balloon-left">
 <p style="font-weight: bold;">${co.writer }</p>
 <p>${co.content }</p>
 </div>
</c:forEach>
</body>
</html>