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
input[type=text]{
border: none;
padding: 0px;}
#ordertable{
width: 100%;
border-top: 1px solid #e8e8e8;
border-collapse: collapse;
font-size: 14px;
margin: 20px 0px;
text-align: center;}
#ordertable .a{
background: #fafafa;
padding: 15px;
border-collapse: none;
text-align: center;
font-weight: bold;
color: #999;
border-bottom:1px solid #e8e8e8; }
#ordertable .b{
background: white;
text-align: center;
padding: 25px, 10px;
border-bottom:1px solid #e8e8e8;
}
#ordertable .w{
width: 8%;}
#ordertable .c{
padding: 20px;
text-align: right;
background: #fafafa;
border-bottom: 1px solid #e8e8e8;}
#ordertable .p{
width: 12%;
text-align: center;}
.total_sum {
border: none;
background: #fafafa;
font-weight: bold;
font-size: 15px;
text-align: right;
}
</style>
<script type="text/javascript">
$(function(){
	itemSum();
});
function itemSum() {
    var str = "";
    var sum = 0;
    var count = $(".chkbox").length;
    for (var i = 0; i < count; i++) {
            sum += parseInt($(".chkbox")[i].value);
    }
    var tot_price = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    $(".total_sum").val(tot_price);
}
</script>
</head>
<body>
<p><h4 class="fw-bold mt-5">주문 정보[${orderid }]</h4>
    <table id="ordertable">
    <tr >
    <th class="a"></th>
    <th class="a ">이미지</th>
    <th class="a col-4">상품정보</th>
    <th class="a ">판매가</th>
    <th class="a ">수량</th>
    <th class="a ">적립금</th>
    <th class="a ">배송구분</th>
    <th class="a ">배송비</th>
    <th class="a ">합계</th>
    </tr>
	<c:forEach var="cart" items="${list }">
    <!--hidden data  -->
 	<input type="hidden" class="hid_point" value="${cart.point }">
 	<input type="hidden" class="hid_orderid" value="${cart.orderid }">
    <tr >
    <td class="b"><input type="hidden" class="chkbox" value="${cart.sale_price * cart.num }"></td>
    
    <td class="b"><img src="image/${cart.picture }" style="width: 70px;height: 70px;"></td>
    <td class="b w">${cart.iname }</td>
    <td class="b w" ><fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.sale_price }"/>원</td>
    <td class="b w" ><input type="text" id="num" style="max-width: 1rem" value="${cart.num }" ></td>
    <td class="b w" ><fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.point }"/>원</td>
    <td class="b w" >기본배송</td>
    <td class="b w">무료</td>
    <td class="b p"><input type="text" id="total" value="
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.sale_price * cart.num }"/>" size="9">원</td>
    </tr>
    </c:forEach>
    <tr >
    <td class="c" colspan="4"></td>
    <td class="c" colspan="5">상품구매금액 <input type="text" class="total_sum" size="6">원
    +배송비 0(무료) = 합계 : <input type="text" class="total_sum" id="total_price" size="6">원</td>
    </tr>
     </table>
</body>
</html>