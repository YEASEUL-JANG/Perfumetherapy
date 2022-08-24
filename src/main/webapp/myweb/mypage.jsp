<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="session_check.jsp" %>
<html>
 <head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원가입</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp" %>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico.png" />
<link href="../Resources/css/styles.css" rel="stylesheet" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
#ordertable{
width: 100%;
border: 1px solid #ddd;
color: #333;
font-size: 13px;
padding-bottom: 20px;
}
#ordertable th{
background: #fbfbfb;
padding: 15px;
border-bottom: 1px solid #ddd;
text-align: left;
}
#ordertable td{
padding-top: 20px;}
#ordertable_sub td{
text-align: center;
background: white;
font-size: 30px;
}
#ordertable_sub{
width: 100%;}
#ordertable_sub td{
border-right: 1px dashed #ddd;
padding: 0px;}
#ordertable_sub td:last-child {
border-right: none;}
#ordertable_sub .li{
text-align: center;
color: #333;
font-size: 15px;
padding-top: 20px;
}
.welcomebox{
width: 100%;
padding: 20px;
align-items: center;
border: 1px solid #ddd;
margin-top: 60px;
}
#category_mypage{
padding-top: 20px;
padding-bottom: 20px;
margin-top: 20px;
width: 100%;
border:1px solid #ddd;
font-size: 15px;
 }
#category_mypage td{
padding: 5px 30px;
text-align: center;
border-right:1px solid #ddd; }
#category_mypage td:last-child {
border-right: none;}
.title_sub{
color: #BDBDBD;}
.title{
font-weight: bold;
font-size: 20px;
}
.img{
cursor: pointer;
font-size: 40px;
color:#424242 }
</style>
<script type="text/javascript">
$(function(){
	state();
});
function state(){
	$.ajax({
		type : "post",
		url : "${path}/order_servlet/mypage.do",
		success : function(result){
			$("#mydeliveryState").html(result);
		}
	});
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
   <h2 class="fw-bold ">마이 쇼핑</h2>
   <div class="welcomebox">
   저희 쇼핑몰을 이용해주셔서 감사합니다. ${sessionScope.userid } 님은 [FAMILY] 회원이십니다.
   </div>
   <br>
   <table id="ordertable">
    <tr>
    <th >나의 주문처리 현황</th>
    </tr>
    <tr>
    <td>
    <div id="mydeliveryState" style="width:100%;"></div>
    </td>
    </tr>
   </table>
   
   <table id="category_mypage">
   <colgroup>
     <col width="25%">
     <col width="25%">
     <col width="25%">
     <col width="25%">
   </colgroup>
    <tr>
    <td class="img" onclick="location.href='orderlist.jsp';"><i class="fa-solid fa-basket-shopping"></i></td>
    <td class="img" onclick="location.href='revise.jsp';"><i class="fa-solid fa-address-card"></i></td>
    <td class="img"><i class="fa-solid fa-heart"></i></td>
    <td class="img"><i class="fa-solid fa-pen-to-square"></i></td>
    </tr>
    <tr>
    <td class="title">Order</td>
    <td class="title">Profile</td>
    <td class="title">Wishlist</td>
    <td class="title">Board</td>
    </tr>
    <tr>
    <td class="title_sub">주문내역 조회</td>
    <td class="title_sub">회원 정보</td>
    <td class="title_sub">관심 상품</td>
    <td class="title_sub">게시물 관리</td>
    </tr>
    <tr>
    <td class="content">고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.</td>
    <td class="content">회원이신 고객님의 개인정보를 관리하는 공간입니다.</td>
    <td class="content">관심상품으로 등록하신 상품의 목록을 보여드립니다.</td>
    <td class="content">고객님께서 작성하신 게시물을 관리하는 공간입니다.</td>
    </tr>
   </table>
   
   
   </div>
   </div>
 </section>
 
 <!-- Footer-->
  <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>
 
</body>
</html>