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
/* 주문하기 모달창 */
.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.1); top:0; left:0; 
  display:none;
}
.close_modal{
text-align: right; 
cursor: pointer;
font-size: 20px;
display: inline;
float: right;
}
.modal_content{
  width:550px; height:840px;
  background:#fff; 
  position:relative; top:50%; left:50%;
  margin-top:-420px; margin-left:-275px;
  text-align:left;
  box-sizing:border-box; padding:0px;
  line-height:23px; 
}
#title{
font-size: 17px;
padding: 5px;
border-radius: 8px;}
#reviewtable{
padding: 20px;
width: 100%;
}
#reviewtable td{
padding: 7px;}
#reviewstar input[type=radio]{
display: none;}
#reviewstar label{
font-size: 1.5em;
color: transparent;
text-shadow: 0 0 0 #f0f0f0;
}
#reviewstar label:hover{
text-shadow: 0 0 0 #a18672;}
#reviewstar label:hover ~ label{
 text-shadow: 0 0 0 #a18672;
}
#reviewstar input[type=radio]:checked ~ label{
text-shadow: 0 0 0 #a18672;
}
#reviewContents {
    width: 100%;
    height: 200px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
#image_container{
width: 100%;
height: 100px;
padding: 10px;
border: solid 1.5px #D3D3D3;}
#reviewtitle{
font-size: 15px;
background: #333;
width: 100%;
margin: 0px;
padding: 12px;
color: white;
}
#btnSave{
padding: 10px;
width: 100px;
border: 2px solid #222;
background: white;
border-radius: 7px;
font-weight: bold;}
.butt{
border: 1px solid #222;
padding: 5px;
border-radius: 5px;
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
  
function review(index){
	var x = index;
		var title = $("#title").val();
		var reviewContents = $("#reviewContents").val();
		if(title == ""){
			alert("제목을 입력해주세요."); return;
		}
		if(reviewContents == ""){
			alert("내용을 입력해주세요."); return;
		}
		$("#form"+x).submit();
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
    <th class="a ">후기쓰기</th>
    </tr>
	<c:forEach var="cart" items="${list }" varStatus="vs">
    <!--hidden data  -->
 	<input type="hidden" class="hid_point" value="${cart.point }">
 	<input type="hidden" class="hid_orderid" value="${cart.orderid }">
    <tr >
    <td class="b"><input type="hidden" class="chkbox" value="${cart.sale_price * cart.num }"></td>
    
    <td class="b "><img src="image/${cart.picture }" style="width: 70px;height: 70px;"></td>
    <td class="b ">${cart.iname }</td>
    <td class="b " ><fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.sale_price }"/>원</td>
    <td class="b " ><input type="text" id="num" style="max-width: 1rem" value="${cart.num }" ></td>
    <td class="b " ><fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.point }"/>원</td>
    <td class="b " >기본배송</td>
    <td class="b ">무료</td>
    <td class="b p"><input type="text" id="total" value="
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.sale_price * cart.num }"/>" size="9">원</td>
    </tr>
    </c:forEach>
    <tr >
    <td class="c" colspan="5"></td>
    <td class="c" colspan="5">상품구매금액 <input type="text" class="total_sum" size="6">원
    +배송비 0(무료) = 합계 : <input type="text" class="total_sum" id="total_price" size="6">원</td>
    </tr>
     </table>
</body>
</html>