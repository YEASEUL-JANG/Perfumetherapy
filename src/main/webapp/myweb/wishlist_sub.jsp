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
  box-sizing:border-box; padding:10px ;
  line-height:23px; 
}
.modaltable{
margin: 10px;
width: 100%;}
.modalitem{
padding: 15px 10px;
height: 180px;
background: #f9f9f9;
}
</style>
<script type="text/javascript">
$(function(){
	count();
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
	
//주문하기 모달창
  $("button").click(function(){
	    $(".modal").fadeIn();
	  });
  $(".close_modal").click(function(){
       $(".modal").fadeOut();
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

function count(){
	var count = Number($("#inputQuantity").val());
	var price = Number($("#price").val());
	var total =count*price;
	const result= total.toLocaleString();
	$("#m_total").val(result);
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

<table id="wishtable">
    <tr >
    <th class="a"><input type="checkbox" id="allCheck" checked ></th>
    <th class="a ">이미지</th>
    <th class="a col-4">상품정보</th>
    <th class="a ">판매가</th>
    <th class="a ">적립금</th>
    <th class="a ">배송구분</th>
    <th class="a ">배송비</th>
    <th class="a ">합계</th>
    <th class="a ">선택</th>
    </tr>
	<c:forEach var="like" items="${list }">
    <!--hidden data  -->
 	<input type="hidden" id="tot_price" >
    <tr >
    <td class="b" rowspan="2"><input type="checkbox" class="chkbox" onclick="itemSum()" data-cartid="${like.likeid}" value="${like.sale_price}"></td>
    
    <td class="b" rowspan="2"><img src="image/${like.picture }" style="width: 70px;height: 70px;"></td>
    <td class="b w" rowspan="2">${like.iname }</td>
    <td class="b w" rowspan="2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${like.sale_price }"/>원</td>
    <td class="b w" rowspan="2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${like.point }"/>원</td>
    <td class="b w" rowspan="2">기본배송</td>
    <td class="b w" rowspan="2">무료</td>
    <td class="b p" rowspan="2"><input type="text" id="total" value="
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${like.sale_price}"/>" size="9">원</td>
    <td >
    
    <button>주문하기</button>
    
    <div class="modal">
  	<div class="modal_content">
    <div class="close_modal"><i class="fa-solid fa-circle-xmark"></i></div>
    <table id="modaltable" style="border-collapse: collapse;">
    <tr>
    <td colspan="4" style="font-size: 24px; font-weight: lighter;">${like.iname }</td>
    </tr>
     <tr>
     <td colspan="4"><hr></td>
     </tr>
     <tr>
     <td class="modalitem"><img src="image/${like.picture }"style="width: 70px;height: 70px;"></td>
     <td class="modalitem" style="font-weight: bold; width:50%;">${like.iname }<br>-${like.volume }ml</td>
     <td class="modalitem">
     <input class="form-control text-center me-3" onclick="count(") 
     id="inputQuantity" type="number" value="1" style="max-width: 4rem" /></td>
     <td class="modalitem"><input type="text" size="4" id="price" value="${like.sale_price }"></td>
     </tr>
     <tr>
     <td colspan="4"><hr></td>
     </tr>
     <tr>
     <td colspan="4" style="text-align: right;"> 총 상품금액(수량) : 
     <input  type="text" name="total" id="m_total" name="total_price" value="${like.sale_price }" readonly size="6">원</td>
     </tr>
     <tr>
     <td colspan="4" style="text-align: center;"><input type="button" value="바로 구매하기"><input type="button" value="장바구니 담기"></td>
     </tr>
    </table>
  	 </div>
	</div>
    
    
    </td>
    </tr><tr>
    <td class="b w"><input type="button" value="삭제" id="delete_${like.likeid}_btn" data-cartid="${like.likeid}"></td>
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
    </table>
   	
   	<input type="button" value="전체상품주문" onclick="orderitem('all')">
   	<input type="button" value="선택상품주문" onclick="orderitem()">
   	<br><input type="button" value="쇼핑계속하기">
</body>
</html>