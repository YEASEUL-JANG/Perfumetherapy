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
#cart_cat{
width: 100%;
margin-top: 50px;
margin-bottom: 20px;
}
#cart_cat .a{
border-top: 1px solid black;
border-left: 1px solid #e8e8e8;
font-size: 15px;
text-align: center;
padding: 15px;
}
#cart_cat .b{
padding: 15px;
border: 1px solid #e8e8e8;
background: #f6f6f6;
font-size: 15px;
color: #A4A4A4;
text-align: right;
}
#cartable{
width: 100%;
border-top: 1px solid #e8e8e8;
border-collapse: collapse;
font-size: 14px;
text-align: center;}
#cartable .a{
background: #fafafa;
padding: 15px;
border-collapse: none;

font-weight: bold;
color: #999;
border-bottom:1px solid #e8e8e8; }
#cartable .b{
background: white;
text-align: center;
padding: 25px, 10px;
border-bottom:1px solid #e8e8e8;
}
#cartable .w{
width: 8%;}
#cartable .c{
padding: 20px;
text-align: right;
background: #fafafa;
border-bottom: 1px solid #e8e8e8;}
</style>
<script type="text/javascript">


</script>
</head>
<body>
 <table id="cart_cat">
    <colgroup>
     <col width="15%">
     <col width="85%">
    </colgroup>
    <tr>
    <td class="a">국내배송상품(${list.count})</td>
    <td class="b">장바구니에 담긴 상품은 30일동안 보관됩니다.</td>
    </tr>
    </table>

<table id="cartable">
    <tr >
    <th class="a"><input type="checkbox"></th>
    <th class="a ">이미지</th>
    <th class="a col-4">상품정보</th>
    <th class="a ">판매가</th>
    <th class="a ">수량</th>
    <th class="a ">적립금</th>
    <th class="a ">배송구분</th>
    <th class="a ">배송비</th>
    <th class="a ">합계</th>
    <th class="a ">선택</th>
    </tr>
    <tr >
    <td class="b" rowspan="2"><input type="checkbox"></td>
    <td class="b" rowspan="2"><img src="image/new_img1.png" style="width: 70px;height: 70px;"></td>
    <td class="b w" rowspan="2">${list.iname }</td>
    <td class="b w" rowspan="2">${list.sale_price }원</td>
    <td class="b w" rowspan="2"><input type="number"  style="max-width: 3rem" value="${list.num }" ></td>
    <td class="b w" rowspan="2">${list.point }원</td>
    <td class="b w" rowspan="2">기본배송</td>
    <td class="b w" rowspan="2">무료</td>
    <td class="b w" rowspan="2"><input id="total" value="" size="5">원</td>
    <td ><input type="button" value="주문하기" id="btnorder"></td>
    </tr><tr>
    <td><input type="button" value="삭제" id="btndelete"></td>
    </tr>
    <tr >
    <td class="c" colspan="5"></td>
    <td class="c" colspan="5">상품구매금액 <input id="c_price" value="" size="5">
    +배송비 0(무료) = 합계 : <input id="c_total"value="" size="5"></td>
    </tr>
    </table>

</body>
</html>