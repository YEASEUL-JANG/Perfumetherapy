<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<style type="text/css">
input[type=text]{
border: none;
text-align: left;
padding: 0px;}
#total{
padding: 0px;}
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
#cartable .p{
width: 10%;
text-align: right;}
#counter{
display: flex;
border: 1px solid #999;
width: 20px;
text-align: center;
border-radius: 8px;
padding: 0px;}
#counter td{
border-bottom : 1px solid #999;
cursor: pointer;}
#counter tr:last-child td{
border: none;}
.total_sum{
border: none;
background: #fafafa;
font-weight: bold;
font-size: 15px;
text-align: right;
}
#cartable2{
margin-top: 50px;
border-top: 1px solid black;
border-bottom: 1px solid black;
font-size: 25px;
border-collapse: collapse;
}
#cartable2 .aa{
border-bottom: 1px solid #e8e8e8;
padding: 15px;
background: #fafafa;
font-size: 15px;
color: #A4A4A4;}
#cartable2 .total_sum2{
font-size: 25px;
padding: 25px;
}
</style>
<script type="text/javascript">
$(function(){
	var tt = "${cart}";
    if (tt == 'false') {//카트상품이 없으면
        $("#allCheck").prop("checked", false);
    } else {//있다면 기본적으로 allcheck
        $("#allCheck").prop("checked", true);
        $(".chkbox").prop("checked", true);
        itemSum();
    }
//모두선택을 클릭할 때
	$("#allCheck").click(function () {
    var chk = $("#allCheck").prop("checked");
    if (chk) {
        $(".chkbox").prop("checked", true);
        itemSum();
    } else {
        $(".chkbox").prop("checked", false);
        itemSum();
    }
	});
//개별 체크박스를 클릭할 때	
	$(".chkbox").click(function () {
   		 $("#allCheck").prop("checked", false);
	});
});
//주문하기
function orderitem(result){
	if(result != null){ //전체상품주문 클릭시
	$(".chkbox").prop("checked", true);
	}//선택된 상품의 cartid를 배열에 넣음
	var checkArr = new Array();
	$("input[class='chkbox']:checked").each(function () {
        checkArr.push($(this).attr("data-cartid"));
    });
	var total_price = $("#tot_price").val();//총 상품금액
	 $.ajax({
            type:'post',
            traditional: true,
            url: '${path }/order_servlet/order.do',
            data:{chk:checkArr,
            	t_price : total_price},
            success: function(data){
            	var result = data;
            	if(result==0){//세션아이디가 없으면
            		location.href="session_check.jsp";//세션체크페이지
            	}else if(result == 1){//있으면 주문페이지 이동
            	location.href="orderform.jsp";
            	}
            },
    		error: function(){
    			alert("에러.");
    		}
         });
}
//총 상품금액 계산
function itemSum() {
    var str = "";
    var sum = 0;
    var count = $(".chkbox").length;
    for (var i = 0; i < count; i++) {
        if ($(".chkbox")[i].checked == true) {
            sum += parseInt($(".chkbox")[i].value);
        }
    }
    $("#tot_price").val(sum.toString());
    var result = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    $(".total_sum").val(result);
    $(".total_sum2").html(result+"원");
}
</script>
</head>
<body>
 <table id="cart_cat">
    <colgroup>
     <col width="15%">
     <col width="85%">
    </colgroup>
    <tr>
    <td class="a">국내배송상품(${count})</td>
    <td class="b">장바구니에 담긴 상품은 30일동안 보관됩니다.</td>
    </tr>
    </table>

<table id="cartable">
    <tr >
    <th class="a"><input type="checkbox" id="allCheck" checked ></th>
    <th class="a ">이미지</th>
    <th class="a col-4">상품정보</th>
    <th class="a ">판매가</th>
    <th colspan="2" class="a ">수량</th>
    <th class="a ">적립금</th>
    <th class="a ">배송구분</th>
    <th class="a ">배송비</th>
    <th class="a ">합계</th>
    <th class="a ">선택</th>
    </tr>
	<c:forEach var="cart" items="${list }">
    <!--hidden data  -->
 	<input type="hidden" id="tot_price" >
    <tr >
    <td class="b" rowspan="2"><input type="checkbox" class="chkbox" onclick="itemSum()" data-cartid="${cart.cartid}" value="${cart.sale_price * cart.num }"></td>
    
    <td class="b" rowspan="2"><img src="image/${cart.picture }" style="width: 70px;height: 70px;"></td>
    <td class="b w" rowspan="2">${cart.iname }</td>
    <td class="b w" rowspan="2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.sale_price }"/>원</td>
    <td class="b t" rowspan="2"><input type="text" id="num" style="max-width: 1rem" value="${cart.num }" ></td>
    <td class="b t" rowspan="2"><table id="counter">
     <tr>
     <td onclick="numup(${cart.idx})"><i class="fa-solid fa-angle-up"></i></td></tr><tr>
     <td onclick="numdown(${cart.idx})"><i class="fa-solid fa-angle-down"></i></td>
     </tr>
     </table>
    
    </td>
    <td class="b w" rowspan="2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.point }"/>원</td>
    <td class="b w" rowspan="2">기본배송</td>
    <td class="b w" rowspan="2">무료</td>
    <td class="b p" rowspan="2"><input type="text" id="total" value="
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.sale_price * cart.num }"/>" size="9">원</td>
    <td ><input type="button" value="주문하기" id="btnorder"></td>
    </tr><tr>
    <td class="b w"><input type="button" value="삭제" id="delete_${cart.cartid}_btn" data-cartid="${cart.cartid}"></td>
    </tr>
    <script>
    $("#delete_${cart.cartid}_btn").click(function () {
    var confirm_val = confirm("정말 삭제하시겠습니까?");
    if (confirm_val) {
        var checkArr = $(this).attr("data-cartid");
          $.ajax({
            url: "${path}/order_servlet/deletecart.do",
            type: "post",
            data: { chbox: checkArr },
            success: function () {
                    location.href = "cart.jsp";
            	}
        	});  
    	}
	});
    </script>
    </c:forEach>
    <tr >
    <td class="c" colspan="6"></td>
    <td class="c" colspan="5">상품구매금액 <input class="total_sum" size="6">원
    +배송비 0(무료) = 합계 : <input class="total_sum" id="total_price" size="6">원</td>
    </tr>
    </table>
   	
   	<table id="cartable2" style="width:100%; text-align: center;">
   	 <tr>
   	 <td class="aa" style="width:20%;">총 상품금액</td>
   	 <td class="aa" style="width:20%;">총 배송비</td>
   	 <td class="aa" style="width:60%;">결제예정금액</td>
   	 </tr>
   	 <tr>
   	 <td class="bb total_sum2"></td>
   	 <td class="bb">+0원</td>
   	 <td class="bb total_sum2"></td>
   	 </tr>
   	</table>
   	<input type="button" value="전체상품주문" onclick="orderitem('all')">
   	<input type="button" value="선택상품주문" onclick="orderitem()">
   	<br><input type="button" value="쇼핑계속하기">
</body>
</html>