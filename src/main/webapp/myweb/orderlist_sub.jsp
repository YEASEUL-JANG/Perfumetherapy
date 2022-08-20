<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="session_check.jsp" %>
<html>
 <head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp" %>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico.png" />
<link href="../Resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
#ordertable{
width: 100%;
border: 1px solid #ddd;
color: #333;
font-size: 15px;
padding: 0px;
}
#ordertable th{
background: #fbfbfb;
padding: 15px;
border-bottom: 1px solid #ddd;
text-align: left;
}
#ordertable td{
padding: 15px;}
</style>
</head>
<body>

  <!-- content -->
  <section class="py-5">
   <div class="justify-content-center flex-sm-column d-sm-flex align-items-center">
    <table id="ordertable">
    <colgroup>
     <col width="25%">
     <col width="25%">
     <col width="25%">
     <col width="25%">
    </colgroup>
    <tr>
    <th >주문일자[주문번호]</th>
    <th >주문일자</th>
    <th >총 금액</th>
    <th >주문상태</th>
    </tr>
    <c:forEach var="o" items="${list }">
    <tr>
    <td><a href="${path}/order_servlet/detailorder.do?orderid=${o.orderid}">${o.orderid}</a></td>
    <td>${o.order_date}</td>
    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${o.sum_price }"/>원</td>
    <td>${o.delivery }</td>
	</tr>
	</c:forEach>
    </table>
   
   
   </div>
 </section>
 
</body>
</html>