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
$(function(){
	cat_all();
});

function cat_all(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/list.do",
		data: {
			category: "all",
			big_category: "woman"},
		success : function(result){
			$("#result").html(result);
		    $("#hid_nav").val("all");
		}
	});
}
function cat_green(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/list.do",
		data: {category: "green",
			big_category: "woman"},
		success : function(result){
			$("#result").html(result);
			$("#hid_nav").val("green");
		}
	});
}
function cat_pink(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/list.do",
		data: {category: "pink",
			big_category: "woman"},
		success : function(result){
			$("#result").html(result);
			$("#hid_nav").val("pink");
		}
	});
}
function cat_white(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/list.do",
		data: {category: "white",
			big_category: "woman"},
		success : function(result){
			$("#result").html(result);
			$("#hid_nav").val("white");
		}
	});
}
function cat_gold(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/list.do",
		data: {category: "gold",
			big_category: "woman"},
		success : function(result){
			$("#result").html(result);
			$("#hid_nav").val("gold");
		}
	});
}

function table(curPage){
	var cat=$("#hid_nav").val();
	if(category != null){
		param= "curPage="+curPage+"&big_category=woman&category="+cat;
	}
	$.ajax({
		type: "post",
		url: "${path}/item_servlet/list.do",
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
</script>
<style type="text/css">
#category{
width: 100%;
display: flex;
justify-content: center;}
#category li{
float: left;
margin: 10px;
}
</style>
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
  <li><a href="#" onclick="cat_all()">ALL</a></li>
  <li><a href="#" onclick="cat_green()"> 시트러스 | 그린 </a></li>
  <li><a href="#" onclick="cat_pink()"> 플로럴 | 화이트플로럴 </a></li>
  <li><a href="#" onclick="cat_white()"> 머스크 | 앰버 </a></li>
  <li><a href="#" onclick="cat_gold()"> 스위트 | 바닐라</a></li>
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