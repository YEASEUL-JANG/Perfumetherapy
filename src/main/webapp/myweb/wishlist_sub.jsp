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
#wishtable{
margin-top: 50px;
width: 100%;
border-top: 1px solid #e8e8e8;
border-collapse: collapse;
font-size: 14px;
text-align: center;}
#wishtable .a{
background: #fafafa;
padding: 15px;
border-collapse: none;

font-weight: bold;
color: #999;
border-bottom:1px solid #e8e8e8; }
#wishtable .b{
background: white;
text-align: center;
padding: 25px, 10px;
border-bottom:1px solid #e8e8e8;
}
#wishtable .w{
width: 8%;}
#wishtable .c{
padding: 20px;
text-align: right;
background: #fafafa;
border-bottom: 1px solid #e8e8e8;}
#wishtable .p{
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
/* 주문하기 모달창 */
.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.1); top:0; left:0; display:none;
}
.close_modal{
text-align: right; 
cursor: pointer;
color: #333;
font-size: 20px;
}
.modal_content{
  width:550px; height:400px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-200px; margin-left:-275px;
  text-align:left;
  box-sizing:border-box; padding:20px;
  line-height:23px; 
}
#modaltable{
margin: 0px;
width: 100%;}
.modalitem{
padding: 10px;
height: 150px;
background: #f9f9f9;
}
.tot_price, .num{
display: inline;
}
.butt{
border: 1px solid #222;
padding-left: 7px;
padding-top: 3px;
padding-bottom:3px;
padding-right: 7px;
border-radius: 3px;}
.butt2{
text-align: center;
padding: 7px;
width: 130px;
margin: 10px;
background: white;
color: #222;
font-weight: bold;
border: 2px solid #222;
border-radius: 5px;}
</style>
<script type="text/javascript">
$(function(){
	var tt = "${like}";
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
	
  //모달창 닫기설정
  $(".close_modal").click(function(){
       $(".modal").fadeOut();
     });
  
});
//가격합계 계산
function itemSum(){
    var str = "";
    var sum = 0;
    var count = $(".chkbox").length;
    for (var i = 0; i < count; i++) {
        if ($(".chkbox")[i].checked == true) {
            sum += parseInt($(".chkbox")[i].value);
        }
    }
    $("#totalprice").val(sum.toString());
}
//개별모달창 열기
function showmodal(index){
	var x = index;
	$("#modalid"+x).fadeIn();
}


//주문하기
function orderitem(result){
	if(result != null){ //전체상품주문 클릭시
	$(".chkbox").prop("checked", true);
	}//선택된 상품의 cartid를 배열에 넣음
	var checkArr = new Array();
	$("input[class='chkbox']:checked").each(function () {
        checkArr.push($(this).attr("data-cartid"));
    });
	var total_price = $("#totalprice").val();//총 상품금액
	 $.ajax({
            type:'post',
            traditional: true,
            url: '${path }/order_servlet/wishselect.do',
            data:{chk:checkArr,
            	t_price : total_price},
            success: function(data){
            	var result = data;
            	if(result==0){//세션아이디가 없으면
            		location.href="session_check.jsp";//세션체크페이지
            	}else{//있으면 주문페이지 이동
            	location.href="orderform.jsp?orderid="+result;
            	}
            },
    		error: function(){
    			alert("에러.");
    		}
         });
}
function goorder(id){
	var cartid = id;
	$.ajax({
        type:'post',
        url: '${path }/order_servlet/wishpurchase.do',
        data:{cartid : cartid},
        success: function(data){
        	var result = data;
        	if(result==0){//세션아이디가 없으면
        		location.href="session_check.jsp";//세션체크페이지
        	}else{//있으면 주문페이지 이동
        		location.href="orderform.jsp?orderid="+result; 
        	}
        },
		error: function(){
			alert("에러.");
		}
     });
}
function numup(up, price){
	 const idx = up;
	$.ajax({
		type : "post",
		data : {idx: idx},
		url : "${path}/item_servlet/likenumUp.do",
		success : function(num){
			const total =num*price;
			const tot_price= total.toLocaleString();
			const tot_num = num.toString();
			 $(".num").html(tot_num);
			 $(".tot_price").html(tot_price);
		}
	});
}

function numdown(down, price){
	 const idx = down;
	$.ajax({
		type : "post",
		data : {idx: idx},
		url : "${path}/item_servlet/likenumDown.do",
		success : function(num){
			const total =num*price;
			const tot_price= total.toLocaleString();
			const tot_num = num.toString();
			 $(".num").html(tot_num);
			 $(".tot_price").html(tot_price);
		}
	});
} 

</script>
</head>
<body>

<table id="wishtable">
    <tr >
    <th class="a"><input type="checkbox" id="allCheck" ></th>
    <th class="a ">이미지</th>
    <th class="a col-4">상품정보</th>
    <th class="a ">판매가</th>
    <th class="a ">적립금</th>
    <th class="a ">배송구분</th>
    <th class="a ">배송비</th>
    <th class="a ">합계</th>
    <th class="a ">선택</th>
    </tr>
	<c:forEach var="like" items="${list }" varStatus="vs">
    <!--hidden data  -->
 	<input type="hidden" id="hid_idx" value="${like.idx }" >
    <tr >
    <td class="b" rowspan="2"><input type="checkbox" class="chkbox" onclick="itemSum()" data-cartid="${like.cartid}" value="${like.sale_price}"></td>
    
    <td class="b" rowspan="2"><img src="image/${like.picture }" style="width: 70px;height: 70px;"></td>
    <td class="b w" rowspan="2">${like.iname }</td>
    <td class="b w" rowspan="2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${like.sale_price }"/>원</td>
    <td class="b w" rowspan="2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${like.point }"/>원</td>
    <td class="b w" rowspan="2">기본배송</td>
    <td class="b w" rowspan="2">무료</td>
    <td class="b p" rowspan="2"><input type="text" id="total" value="
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${like.sale_price}"/>" size="3">원</td>
    <td >
    
    <button class="butt" onclick="showmodal(${vs.index})">주문하기</button>
    <!-- 모달창 -->
    <div id="modalid${vs.index }" class="modal">
  	<div class="modal_content">
    <div class="close_modal"><i class="fa-solid fa-circle-xmark"></i></div>
    <table id="modaltable" style="border-collapse: collapse;">
    <tr>
    <td colspan="5" style="font-size: 24px; font-weight: lighter;">${like.iname }</td>
    </tr>
     <tr>
     <td colspan="5"><hr></td>
     </tr>
     <tr>
     <td class="modalitem"><img src="image/${like.picture }"style="width: 70px;height: 70px;"></td>
     <td class="modalitem" style="font-weight: bold; width:50%;">${like.iname }<br>-${like.volume }ml</td>
     <td class="modalitem"><div class="num">${like.num }</div></td>
     <td class="modalitem">
     <table id="counter">
     <tr>
     <td onclick="numup('${like.idx}','${like.sale_price }')"><i class="fa-solid fa-angle-up"></i></td></tr><tr>
     <td onclick="numdown('${like.idx}','${like.sale_price }')"><i class="fa-solid fa-angle-down"></i></td>
     </tr>
     </table>
     </td>
     <td class="modalitem"><div class="tot_price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${like.sale_price}"/></div>원</td>
     </tr>
     <tr>
     <td colspan="5"><hr></td>
     </tr>
     <tr>
     <td colspan="5" style="text-align: right;"> 
     총 상품금액(수량) : <div class="tot_price" style="font-weight: bold; font-size: 15px;"><fmt:formatNumber type="number" maxFractionDigits="3" 
     value="${like.sale_price}"/></div>원(<div class="num">${like.num }</div>개)</td>
     </tr>
     <tr>
     <td colspan="5" style="text-align: center;padding-top: 30px;">
     <input type="button" value="바로 구매하기" onclick="goorder('${like.cartid}')">
     <input type="button" value="장바구니 담기" onclick="addcart('${like.cartid}')"></td>
     </tr>
    </table>
  	 </div>
	</div>
    
    
    </td>
    </tr><tr>
    <td class="b w"><input type="button"  class="butt" value="삭제" id="delete_${like.cartid}_btn" data-cartid="${like.cartid}"></td>
    </tr>
    <script>
    $("#delete_${like.cartid}_btn").click(function () {
    var confirm_val = confirm("해당상품을 삭제하시겠습니까?");
    if (confirm_val) {
        var cartid = $(this).attr("data-cartid");
          $.ajax({
            url: "${path}/order_servlet/deletelike.do",
            type: "post",
            data: { cartid: cartid },
            success: function () {
                    location.href = "${path}/myweb/wishlist.jsp";
            	}
        	});  
    	}
	});
    </script>
    </c:forEach>
    </table>
   	 <input type="hidden" id="totalprice" size="6">
   	 <div align="center" style="margin-top: 30px;">
   	<input type="button" class="butt2"value="전체상품주문" onclick="orderitem('all')">
   	<input type="button" class="butt2"value="선택상품주문" onclick="orderitem()">
   	</div>
   	<div align="right"><input type="button"class="butt"value="찜목록 비우기" onclick="deleteAllwish()"></div>
</body>
</html>