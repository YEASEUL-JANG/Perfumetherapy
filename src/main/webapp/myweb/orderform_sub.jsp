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

.i{
color: #048dcd;
font-weight: bolder;
font-size: 20px;}
.packtable{
margin: 20px 0px;
width: 100%;
border-left: none;
border-right: none;
border-top: 1px solid #e8e8e8;
border-bottom: 1px solid #e8e8e8;
border-collapse: collapse;

}
.packtable th{
color: #999;
border-bottom: 1px solid #e8e8e8;
background: #fafafa;
width: 200px;
text-align: center;
padding: 20px;
font-size: 15px;

}
.packtable td{
color: #333;
border-bottom: 1px solid #e8e8e8;
font-size: 15px;
padding: 20px;
}

input[type=text]{
border: none;
text-align: left;
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
.ordertable2{
margin-top: 20px;
border-top: 1px solid black;
border-bottom: 1px solid black;
font-size: 30px;
border-collapse: collapse;
}
.ordertable2 .aa{
border-bottom: 1px solid #e8e8e8;
padding: 15px;
background: #fafafa;
font-size: 15px;
color: #A4A4A4;}
.ordertable2 .cc{
font-size: 30px;
padding: 25px;
font-weight: lighter;
}
.ordertable2 .bb{
font-size: 15px;
padding: 20px;
}
.j_button{
background: #222;
font-size: 15px;
font-weight: bold;
color: white;
padding: 15px;
width: 220px;
border-radius: 10px;
margin-top: 50px;
}
.j_cancel{
background: white;
border: 2px solid #222;
font-size: 15px;
font-weight: bold;
padding: 15px;
width: 220px;
border-radius: 10px;
margin-top: 50px;
}
</style>
<script type="text/javascript">
$(function(){
	itemSum();
	pointSum();
});
//주문금액 합계계산
function itemSum() {
    var str = "";
    var sum = 0;
    var count = $(".chkbox").length;
    for (var i = 0; i < count; i++) {
            sum += parseInt($(".chkbox")[i].value);
    }
    var tot_price = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    $(".total_sum").val(tot_price);
    $(".total_sum2").html(tot_price+"원");
}
//적립금액 합계계산
function pointSum(){
	var str = "";
    var sum = 0;
    var count = $(".hid_point").length;
    for (var i = 0; i < count; i++) {
            sum += parseInt($(".hid_point")[i].value);
    }
    var total_point = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    $(".total_point").html(total_point+"원");
}

</script>
</head>
<body>

	 
    <p><h4 class="fw-bold mt-5">배송지 정보</h4>
    <!-- 입력폼 -->
    <table border="1" class="packtable">
    <tr>
     <th>이름<span class="i">*</span></th>
     <td><input type="text" name="uname" id="uname" size="25" value="${dto.uname }"></td>
    </tr>
    <tr>
     <th>주소<span class="i">*</span></th>
     <td><input type="text" id="address" size="40" value="${dto.address }">
    </tr>
    <tr>
     <th>휴대전화<span class="i">*</span></th>
     <td><input type="text" name="phone" size="25" id="phone" value="${dto.phone }"> </td>
    </tr>
     <tr>
     <th>이메일<span class="i">*</span></th>
     <td>
     <input type="text" id="user_email" value="${dto.email }">
     </td>
    </tr>
    </table>
	<p><h4 class="fw-bold mt-5">주문 정보</h4>
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
    <td class="c" colspan="5">상품구매금액 <input class="total_sum" size="6">원
    +배송비 0(무료) = 합계 : <input class="total_sum" id="total_price" size="6">원</td>
    </tr>
    </table>
    <p><h4 class="fw-bold mt-5">적립 정보</h4>
   	<table class="ordertable2" style="width:100%; text-align: center;">
   	 <tr>
   	 <td class="aa" style="width:20%;">상품별 적립금</td>
   	 <td class="aa" style="width:20%;">회원 적립금</td>
   	 <td class="aa" style="width:60%;">총 적립예정금액</td>
   	 </tr>
   	 <tr>
   	 <td class="total_point bb"></td>
   	 <td class="bb">0원</td>
   	 <td class="total_point bb"></td>
   	 </tr>
   	</table>
   	<p><h4 class="fw-bold mt-5">결제 정보</h4>
   	<table class="ordertable2" style="width:100%; text-align: center;">
   	 <tr>
   	 <td class="aa" style="width:20%;">총 상품금액</td>
   	 <td class="aa" style="width:20%;">총 배송비</td>
   	 <td class="aa" style="width:60%;">결제예정금액</td>
   	 </tr>
   	 <tr>
   	 <td class="total_sum2 cc"></td>
   	 <td class="cc">0원</td>
   	 <td class="total_sum2 cc"></td>
   	 </tr>
   	</table>
   	
   	
   	<div align="center"><input type="button" class="j_button" value="주문하기" onclick="goorder()">
   	<input type="button" class="j_cancel" value="주문취소" onclick="cancel()"></div>
   	
</body>
</html>