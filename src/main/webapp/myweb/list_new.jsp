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
	cat_new();
});
function cat_new(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/newList.do",
		data: {category : "idx",
			 order: "desc"},
		success : function(result){
			$("#result").html(result);
			$("#hid_cate").val("idx");
			$("#hid_order").val("desc");
		}
	});
}
function cat_name(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/newList.do",
		data: {category : "iname",
			 order: "asc"},
		success : function(result){
			$("#result").html(result);
			$("#hid_cate").val("iname");
			$("#hid_order").val("asc");
		}
	});
}
function cat_lower(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/newList.do",
		data: {category : "sale_price",
			 order: "asc"},
		success : function(result){
			$("#result").html(result);
			$("#hid_cate").val("sale_price");
			$("#hid_order").val("asc");
		}
	});
}
function cat_higher(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/newList.do",
		data: {category : "sale_price",
			 order: "desc"},
		success : function(result){
			$("#result").html(result);
			$("#hid_cate").val("sale_price");
			$("#hid_order").val("desc");
		}
	});
}

function table(curPage){
	var cate=$("#hid_cate").val();
	var order=$("#hid_order").val();
	if(category != null){
		param= "curPage="+curPage+"&category="+cate+"&order="+order;
	}
	$.ajax({
		type: "post",
		url: "${path}/item_servlet/newList.do",
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
justify-content: right;}
#category li{
float: left;
margin: 8px;
}
#category a:link{text-decoration: none; color:#959595; }
#category a:visited{text-decoration: none; color:#959595; }
#category a:hover{text-decoration: none; color:#836e53; font-weight: bold;}
#result a:link{text-decoration: none; color:#959595; }
#result a:visited{text-decoration: none; color:#959595; }
#result a:hover{text-decoration: none; color:#836e53; font-weight: bold;}
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
   <h2 class="fw-lighter ">9월 신상</h2></div>
 <!--카테고리  -->
 <div id="category" >
 <ul style="list-style: none">
  <li><a href="#" onclick="cat_new()"> 신상품 </a></li>
  <li> | </li>
  <li><a href="#" onclick="cat_name()"> 상품명 </a></li>
  <li> | </li>
  <li><a href="#" onclick="cat_lower()">낮은가격 </a></li>
  <li> | </li>
  <li><a href="#" onclick="cat_higher()"> 높은가격 </a></li>
 </ul>
 </div>
 <!-- 상품 -->
  <div id="result" style="width:100%;"></div> 
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