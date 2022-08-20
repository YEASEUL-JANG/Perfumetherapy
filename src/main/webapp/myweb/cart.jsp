<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Perfumetherapy</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	cart();
});
function cart(){
	$.ajax({
		type : "post",
		url : "${path}/order_servlet/cartview.do",
		success : function(result){
			$("#result").html(result);
		}
	});
}

</script>
<style type="text/css">


</style>
</head>
<body>
 <header>
  <jsp:include page="navbar.jsp"></jsp:include>
  </header>
  <!-- content -->
  <section class="py-5">
  <div class="container px-4 px-lg-5 mt-5">
   <div class="justify-content-center flex-sm-column d-sm-flex align-items-center">
   <h2 class="fw-bold ">장바구니</h2></div>
   
    
    <div id="result" style="width: 100%;"></div>
    
    </div>
    </section>
    
</body>
</html>