<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	 var orderid = $("#orderid").val();
	 orderform(orderid);
});
function orderform(orderid){
	$.ajax({
		type : "post",
		data : {orderid : orderid},
		url : "${path}/order_servlet/orderform.do",
		success : function(result){
			$("#result").html(result);
		}
	});
}
function cancel(){
	var key = $(".hid_orderid").val();
	location.href="${path}/order_servlet/cancel.do?orderid="+key;
}
function goorder(){
	alert("주문이 완료되었습니다. 감사합니다.");
	location.href="orderlist.jsp";
}
</script>
</head>
<body>
<!-- hidden orderid -->
<input type="hidden" id="orderid" value=${param.orderid }>
<header>
  <jsp:include page="navbar.jsp"></jsp:include>
  </header>
  
  <!-- content -->
  <section class="py-5">
  <div class="container px-4 px-lg-5 mt-5">
   <div class="justify-content-center flex-sm-column d-sm-flex align-items-center">
   <h2 class="fw-bold ">주문내역</h2></div>
   
    
    <div id="result" style="width: 100%;"></div>
    
    </div>
    </section>
    
     <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>


</body>
</html>