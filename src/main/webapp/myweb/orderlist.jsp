<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="session_check.jsp" %>
<html>
 <head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>주문 내역</title>
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
#order_cat{
margin-top: 20px;
background: #fbfbfb;
padding: 0px;
text-align: left;
width: 100%;
}
.script{
color: #848484;
}
#th_order, #th_cancel, #th_return{
cursor: pointer;
padding: 15px;}
</style>
<script type="text/javascript">
$(function(){
	view_orderlist();
	
});
function view_orderlist(){
	$.ajax({
		type : "post",
		url : "${path}/order_servlet/orderlist.do",
		success : function(res){
			$("#result").html(res);
			$("#th_order").css("background","#333");
			$("#th_order").css("color","white");
			$("#th_cancel").css("background","#fbfbfb");
			$("#th_cancel").css("color","#333");
			$("#th_return").css("background","#fbfbfb");
			$("#th_return").css("color","#333");
			$("#view").html("");
		}
	});
}
function view_cancellist(){
	$.ajax({
		type : "post",
		url : "${path}/order_servlet/cancellist.do",
		success : function(res){
			$("#result").html(res);
			$("#th_cancel").css("background","#333");
			$("#th_cancel").css("color","white");
			$("#th_order").css("background","#fbfbfb");
			$("#th_order").css("color","#333");
			$("#th_return").css("background","#fbfbfb");
			$("#th_return").css("color","#333");
			$("#view").html("");
		}
	});
}
function view_return(){
	$.ajax({
		type : "post",
		url : "${path}/order_servlet/return.do",
		success : function(res){
			$("#result").html(res);
			$("#th_return").css("background","#333");
			$("#th_return").css("color","white");
			$("#th_order").css("background","#fbfbfb");
			$("#th_order").css("color","#333");
			$("#th_cancel").css("background","#fbfbfb");
			$("#th_cancel").css("color","#333");
			$("#view").html("");
		}
	});
}

function viewdetail(orderid){
	 const key = orderid;
	$.ajax({
		type : "post",
		data : {orderid : key},
		url : "${path}/order_servlet/modalview.do",
		success : function(res){
			$("#view").html(res);
		}
	});
}  
function cancelOrder(delivery, orderid){
	var demand = $("#cancelOrder").val();
	if(demand=="return"){
		if(delivery=="배송 완료"){
			if(confirm("반품을 진행하시겠습니까?")){
				location.href="${path}/order_servlet/takeback.do?orderid="+orderid;
				}
		}else{
			alert(delivery+"인 상태에서는 반품진행이 불가합니다.");
		}
	}else if(demand=="cancel"){
		if(delivery=="상품 준비중"){
			if(confirm("주문을 취소하시겠습니까?")){
			location.href="${path}/order_servlet/withdrawal.do?orderid="+orderid;
			}
		}else{
			alert(delivery+"인 상태에서는 주문취소가 불가합니다.");
			return;
		}
	}
}
</script>
</head>
<body>
<!-- nav -->
  <header>
  <jsp:include page="navbar.jsp"></jsp:include>
  </header>
  <!-- content -->
  <section class="py-5">
  <div class="container px-4 px-lg-5 mt-5">
   <div class="justify-content-center flex-sm-column d-sm-flex align-items-center">
   <h2 class="fw-bold ">마이 쇼핑</h2></div>
   <div class="script mt-5">* 주문번호를 클릭하면 상세 주문내역 확인이 가능합니다.</div>
    <table id="order_cat">
    <colgroup>
     <col width="25%">
     <col width="25%">
     <col width="25%">
     <col width="25%">
    </colgroup>
    <tr>
    <th><div onclick="view_orderlist()" id="th_order">주문내역조회(${count })</div></th>
    <th><div onclick="view_cancellist()"id="th_cancel">주문취소 내역</div></th>
    <th><div onclick="view_return()" id="th_return">반품 내역</div></th>
    </tr>
    </table>
   
   <br>
    <div id="result" style="width:100%;"></div>
    
   <div id="view" style="width: 100%;"></div>
 
   </div>
 </section>
 
 
 <!-- Footer-->
  <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>
</body>
</html>