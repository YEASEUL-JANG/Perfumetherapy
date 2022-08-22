<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
${dto.userid }<br>
${dto.uname }<br>
${dto.gender }<br>
${dto.address }<br>
${dto.phone }<br>
${dto.email }<br>

<c:forEach var="order" items="${list }">
 ${order.orderid }<br>
 ${order.cartid }<br>
 ${order.num }<br>
 ${order.idx }<br>
 <img src="image/${order.picture }" style="width: 70px;height: 70px;"><br>
 ${order.iname }<br>
 ${order.sale_price }<br>
 ${order.point }<br>
 ${order.volume }<br>

</c:forEach>
<img alt="" src="image/new_img1.png">
</body>
</html>