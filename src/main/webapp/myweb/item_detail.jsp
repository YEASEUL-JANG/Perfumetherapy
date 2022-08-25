<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
<title>상품 상세페이지</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
#total, #price{
border: none;
font-weight: bold;
font-size: 20px;}
</style>
<script type="text/javascript">
$(function(){
	count();
});
function count(){
	var count = Number($("#inputQuantity").val());
	var price = Number($("#price").val());
	var total =count*price;
	const result= total.toLocaleString();
	$("#total").val(result);
}
function addcart(){
	if(confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?")){
		var num = $("#inputQuantity").val();
		$("#num").val(num);
		$("#yesorno").val("yes");
		document.orderform.submit();
	}else{
		var num = $("#inputQuantity").val();
		$("#num").val(num);
		$("#yesorno").val("no");
		document.orderform.submit();
	}
}
function likeit(idx){
	var data = idx;
	$.ajax({
		type: "post",
		url: "${path}/item_servlet/likeit.do",
		data: {idx: data},
		success: function(){
			alert("관심상품에 추가되었습니다.");
		}
	});   
}
</script>
</head>
<body>
<header>
  <jsp:include page="navbar.jsp"></jsp:include>
  </header>
 <!-- nav -->
<section class="py-5">
<input  type="hidden" id="price" value=${item.sale_price }>
<div class="container px-4 px-lg-5 my-5">
<div class="row gx-4 gx-lg-5 align-items-center">
 <div class="col-md-6"><img src="image/${item.picture }" class="card-img-top mb-5 mb-md-0" ></div>
 <div class="col-md-6">
    <p class="item-title fw-bold">${item.iname }</p>
    <div class="fs-5 mb-5">
    <span class="text-decoration-line-through"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.o_price }"/></span>
     <span class="fw-bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.sale_price }"/></span>
     </div>
     <hr>
       <table class="item_table">
        <tr>
        <th>정품보증가</th><td><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.sale_price }"/></td>
        </tr>
        <tr>
        <th>적립금</th><td><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.point }"/></td>
        </tr>
       </table><br>
        <span class="guarantee mt-5">퍼퓸테라피와 고객과의 약속! 정품보증</span>
        <hr>
       <table class="item_table">
        <tr>
        <th>배송비</th><td>2,500원(100,000원 이상 구매 시 무료)</td>
        </tr>
        <tr>
        <th>배송방법</th><td>퍼퓸테라피/본사 검수 및 직배송/CJ대한통운</td>
        </tr>
        <tr>
        <th>출고예정일</th><td>2022-09-04</td>
        </tr>
       </table>
        <hr>
       <table class="item_table">
        <tr>
        <th>용량</th><td>${item.volume }ml</td><td>
         <input class="form-control text-center me-3" onclick="count()" id="inputQuantity" type="number" value="1" style="max-width: 4rem" />
        </td>
        </tr>
       </table>
       <hr>
       <br>
       
       
        <p class="total-price fw-bold">총 상품금액 : <input name="total" id="total" name="total_price" value="${item.sale_price }" readonly size="6">원</p>
       
       <form name="orderform" method ="post" action="${path }/order_servlet/addcart.do">
       <input type="hidden" value="" name="yesorno" id="yesorno">
       <input type="hidden" value="" name="num" id="num">
       <input type="hidden" value="${item.idx }" name="idx"></form>
       <div class="d-flex purchase">
           <button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="likeit(${item.idx})">
              <i class="fa-brands fa-gratipay"></i>
               관심상품
           </button>
           <button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="addcart()">
               <i class="fa-solid fa-cart-arrow-down"></i>
               Add to cart
           </button>
       </div>
     </div>
     </div>
    </div>
</section>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>