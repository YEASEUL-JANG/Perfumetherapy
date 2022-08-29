<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Perfumetherapy</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico.png" />
<script type="text/javascript">
$(function(){
	wishlist();
});
function wishlist(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/viewwish.do",
		success : function(res){
			$("#likeview").html(res);
		}
	});
}
//개별 장바구니 추가
function addcart(cartid){
	$.ajax({
		type : "post",
		data : {cartid: cartid},
		url : "${path}/order_servlet/pluscart.do",
		success : function(){
			alert("장바구니에 추가되었습니다.");
			location.href="${path}/myweb/wishlist.jsp";
		}
	});
}
function deleteAllwish(){
	$.ajax({
        type:'post',
        url: '${path }/order_servlet/deleteAllwish.do',
        success: function(){
        	 location.href="${path}/myweb/wishlist.jsp";
        },
		error: function(){
			alert("에러.");
		}
     });
}
</script>
</head>
<body>
 <header>
  <jsp:include page="navbar.jsp"></jsp:include>
  </header>
  <!-- content -->
  <section class="py-5">
  <div class="container px-4 px-lg-5 mt-5">
   <div class="justify-content-center flex-sm-column d-sm-flex align-items-center">
   <h2 class="fw-bold ">관심상품</h2></div>
   
    
    <div id="likeview" style="width: 100%;"></div>
    
    </div>
    </section>
    
     <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>
</body>
</html>