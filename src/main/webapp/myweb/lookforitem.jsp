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
	lookforItem("${param.keyword }");
});
function cat_new(){
	let big_category = $("#big_category").val();
	let category = $("#category").val();
	let keyword = $("#keyword").val();
	let start_price = $("#start_price").val();
	let end_price = $("#end_price").val();
	let param = "";
	if (typeof start_price == "undefined" || start_price == null || start_price == "" ||
		typeof end_price == "undefined" || end_price == null || end_price == ""){
		param = "big_category="+big_category+
		"&category="+category+"&keyword="+keyword+
		"&start_price=0&end_price=1000000&cate=idx&order=desc";
	}else{
	param = "big_category="+big_category+
	"&category="+category+"&keyword="+keyword+
	"&start_price="+start_price+"&end_price="+end_price+"&cate=idx&order=desc";
	}
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/lookingforItem.do",
		data: param,
		success : function(res){
			$("#lookingfor").html(res);
		}
	});
}
function cat_name(){
	let big_category = $("#big_category").val();
	let category = $("#category").val();
	let keyword = $("#keyword").val();
	let start_price = $("#start_price").val();
	let end_price = $("#end_price").val();
	let param = "";
	if (typeof start_price == "undefined" || start_price == null || start_price == "" ||
		typeof end_price == "undefined" || end_price == null || end_price == ""){
		param = "big_category="+big_category+
		"&category="+category+"&keyword="+keyword+
		"&start_price=0&end_price=1000000&cate=iname&order=asc";
	}else{
	param = "big_category="+big_category+
	"&category="+category+"&keyword="+keyword+
	"&start_price="+start_price+"&end_price="+end_price+"&cate=iname&order=asc";
	}
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/lookingforItem.do",
		data: param,
		success : function(res){
			$("#lookingfor").html(res);
		}
	});
}
function cat_lower(){
	let big_category = $("#big_category").val();
	let category = $("#category").val();
	let keyword = $("#keyword").val();
	let start_price = $("#start_price").val();
	let end_price = $("#end_price").val();
	let param = "";
	if (typeof start_price == "undefined" || start_price == null || start_price == "" ||
		typeof end_price == "undefined" || end_price == null || end_price == ""){
		param = "big_category="+big_category+
		"&category="+category+"&keyword="+keyword+
		"&start_price=0&end_price=1000000&cate=sale_price&order=asc";
	}else{
	param = "big_category="+big_category+
	"&category="+category+"&keyword="+keyword+
	"&start_price="+start_price+"&end_price="+end_price+"&cate=sale_price&order=asc";
	}
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/lookingforItem.do",
		data: param,
		success : function(res){
			$("#lookingfor").html(res);
		}
	});
}
function cat_higher(){
	let big_category = $("#big_category").val();
	let category = $("#category").val();
	let keyword = $("#keyword").val();
	let start_price = $("#start_price").val();
	let end_price = $("#end_price").val();
	let param = "";
	if (typeof start_price == "undefined" || start_price == null || start_price == "" ||
		typeof end_price == "undefined" || end_price == null || end_price == ""){
		param = "big_category="+big_category+
		"&category="+category+"&keyword="+keyword+
		"&start_price=0&end_price=1000000&cate=sale_price&order=desc";
	}else{
	param = "big_category="+big_category+
	"&category="+category+"&keyword="+keyword+
	"&start_price="+start_price+"&end_price="+end_price+"&cate=sale_price&order=desc";
	}
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/lookingforItem.do",
		data: param,
		success : function(res){
			$("#lookingfor").html(res);
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

function lookforItem(keyword){
	var key = keyword;
	console.log(key);
	$.ajax({
		type: "post",
		url: "${path}/item_servlet/lookingforItem.do",
		data: {
			keyword: key,
			start_price:0,
			end_price:1000000,
			cate: "idx",
			order: "desc"},
		success: function(res){
			$("#lookingfor").html(res);
		}
	}); 
}
function itemlookfor(){
	let big_category = $("#big_category").val();
	let category = $("#category").val();
	let keyword = $("#keyword").val();
	let start_price = $("#start_price").val();
	let end_price = $("#end_price").val();
	let param = "";
	if (typeof start_price == "undefined" || start_price == null || start_price == "" ||
		typeof end_price == "undefined" || end_price == null || end_price == ""){
		param = "big_category="+big_category+
		"&category="+category+"&keyword="+keyword+
		"&start_price=0&end_price=1000000&cate=idx&order=desc";
	}else{
	param = "big_category="+big_category+
	"&category="+category+"&keyword="+keyword+
	"&start_price="+start_price+"&end_price="+end_price+"&cate=idx&order=desc";}
	$.ajax({
		type: "post",
		url: "${path}/item_servlet/lookingforItem.do",
		data: param,
		success: function(res){
			$("#lookingfor").html(res);
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

<form method="post" name="idxform">
<input type="hidden" id="hiddenidx" name="idx">
</form>

 <section class="py-5">
  <div class="container px-4 px-lg-5 mt-5">
  <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
  <div class="justify-content-center flex-sm-column d-sm-flex align-items-center">
   <h2 class="fw-lighter ">상품검색</h2></div>
  
  <div id="lookingfor" style="width: 100%;"></div>
 
  <input type="hidden" id="hid_cate">
  <input type="hidden" id="hid_order">
  </div>
 </div>
</section>


 <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>


</body>
</html>