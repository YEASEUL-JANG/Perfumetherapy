<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
</head>
<body>
 <table id="ordertable_sub">
    <colgroup>
     <col width="25%">
     <col width="25%">
     <col width="25%">
     <col width="25%">
    </colgroup>
    <tr>
    <td class="li">입금전</td>
    <td class="li">상품준비중</td>
    <td class="li">배송중</td>
    <td class="li">배송완료</td>
	</tr>
	<tr>
    <td style="cursor: pointer;"onclick="location.href='orderlist.jsp';">0</td>
    <td style="cursor: pointer;"onclick="location.href='orderlist.jsp';">${status1 }</td>
    <td style="cursor: pointer;"onclick="location.href='orderlist.jsp';">${status2 }</td>
    <td style="cursor: pointer;"onclick="location.href='orderlist.jsp';">${status3 } </td>
    </tr>
    </table>
</body>
</html>