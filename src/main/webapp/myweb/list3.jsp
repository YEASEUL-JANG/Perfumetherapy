<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Perfumetherapy</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp" %>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico.png" />
<link href="../Resources/css/styles.css" rel="stylesheet" />
<script type="text/javascript">
function cat_gucci(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/brandList.do",
		data: {
			brand: "구찌"},
		success : function(result){
			$("#result").html(result);
		    $("#hid_nav").val("구찌");
		}
	});
}
function cat_chanel(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/brandList.do",
		data: {
			brand: "샤넬"},
		success : function(result){
			$("#result").html(result);
		    $("#hid_nav").val("샤넬");
		}
	});
}
function cat_diptyque(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/brandList.do",
		data: {
			brand: "딥디크"},
		success : function(result){
			$("#result").html(result);
		    $("#hid_nav").val("딥디크");
		}
	});
}
function cat_burberry(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/brandList.do",
		data: {
			brand: "버버리"},
		success : function(result){
			$("#result").html(result);
		    $("#hid_nav").val("버버리");
		}
	});
}
function cat_memo(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/brandList.do",
		data: {
			brand: "메모"},
		success : function(result){
			$("#result").html(result);
		    $("#hid_nav").val("메모");
		}
	});
}
function cat_chloe(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/brandList.do",
		data: {
			brand: "끌로에"},
		success : function(result){
			$("#result").html(result);
		    $("#hid_nav").val("끌로에");
		}
	});
}
function cat_hermes(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/brandList.do",
		data: {
			brand: "에르메스"},
		success : function(result){
			$("#result").html(result);
		    $("#hid_nav").val("에르메스");
		}
	});
}
function cat_maison(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/brandList.do",
		data: {
			brand: "메종 마르지엘라"},
		success : function(result){
			$("#result").html(result);
		    $("#hid_nav").val("메종 마르지엘라");
		}
	});
}
function cat_loewe(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/brandList.do",
		data: {
			brand: "로에베"},
		success : function(result){
			$("#result").html(result);
		    $("#hid_nav").val("로에베");
		}
	});
}
function cat_ysl(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/brandList.do",
		data: {
			brand: "입생로랑"},
		success : function(result){
			$("#result").html(result);
		    $("#hid_nav").val("입생로랑");
		}
	});
}
function cat_bulgari(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/brandList.do",
		data: {
			brand: "불가리"},
		success : function(result){
			$("#result").html(result);
		    $("#hid_nav").val("불가리");
		}
	});
}
function table(curPage){
	var cat=$("#hid_nav").val();
	if(category != null){
		param= "curPage="+curPage+"&brand="+cat;
	}
	$.ajax({
		type: "post",
		url: "${path}/item_servlet/brandList.do",
		dataType: "html",
		data: param,
		success: function(result){
			 $("#result").children().remove();
			$("#result").html(result);
		}
	});   
}
function detailview(idx){
	$("#hiddenidx").val(idx);
	document.idxform.action = "${path}/item_servlet/detailItem.do";
	document.idxform.submit();
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
<style type="text/css">
#category{
width: 100%;
display: flex;
justify-content: center;}
#category li{
float: left;
margin: 20px;
}
#category a:link{text-decoration: none; color:#959595; }
#category a:visited{text-decoration: none; color:#959595; }
#category a:hover{text-decoration: underline; color:#836e53; }
</style>
<c:choose>
 <c:when test="${param.brand == '구찌'}">
   <script type="text/javascript">
   cat_gucci();
   </script>
 </c:when>
 <c:when test="${param.brand == '샤넬'}">
   <script type="text/javascript">
   cat_chanel();
   </script>
 </c:when>
 <c:when test="${param.brand == '딥디크'}">
   <script type="text/javascript">
    cat_diptyque();
   </script>
 </c:when>
 <c:when test="${param.brand == '버버리'}">
   <script type="text/javascript">
   cat_burberry();
   </script>
 </c:when>
 <c:when test="${param.brand == '메모'}">
   <script type="text/javascript">
   cat_memo();
   </script>
 </c:when>
 <c:when test="${param.brand == '끌로에'}">
   <script type="text/javascript">
   cat_chloe();
   </script>
 </c:when>
 <c:when test="${param.brand == '에르메스'}">
   <script type="text/javascript">
   cat_hermes();
   </script>
 </c:when>
 <c:when test="${param.brand == '메종 마르지엘라'}">
   <script type="text/javascript">
   cat_maison();
   </script>
 </c:when>
 <c:when test="${param.brand == '로에베'}">
   <script type="text/javascript">
   cat_loewe();
   </script>
 </c:when>
 <c:when test="${param.brand == '입생로랑'}">
   <script type="text/javascript">
   cat_ysl();
   </script>
 </c:when>
  <c:when test="${param.brand == '불가리'}">
   <script type="text/javascript">
   cat_bulgari();
   </script>
 </c:when>
</c:choose>
</head>
<body>
<header>
  <jsp:include page="navbar.jsp"></jsp:include>
  </header>

<form method="post" name="idxform">
<input type="hidden" id="hiddenidx" name="idx">
</form>

 <section class="py-5">
  <div class="container px-4 px-lg-5 mt-5">
  <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
 <!--카테고리  -->
 <div id="category" >
 <ul style="list-style: none">
  <li><a href="#" onclick="cat_gucci()">구찌</a></li>
  <li><a href="#" onclick="cat_chanel()"> 샤넬 </a></li>
  <li><a href="#" onclick="cat_diptyque()"> 딥디크 </a></li>
  <li><a href="#" onclick="cat_burberry()"> 버버리 </a></li>
  <li><a href="#" onclick="cat_memo()"> 메모</a></li>
  <li><a href="#" onclick="cat_chloe()"> 끌로에</a></li>
  <li><a href="#" onclick="cat_hermes()"> 에르메스</a></li>
  <li><a href="#" onclick="cat_maison()"> 메종 마르지엘라</a></li>
  <li><a href="#" onclick="cat_loewe()"> 로에베</a></li>
  <li><a href="#" onclick="cat_ysl()"> 입생로랑</a></li>
  <li><a href="#" onclick="cat_bulgari()"> 불가리</a></li>
 </ul>
 </div>
 <!-- 상품 -->
  <div id="result" style="width:100%;"></div> 
  <input type="hidden" id="hid_nav">
  </div>
 </div>
</section>


 <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>


</body>
</html>