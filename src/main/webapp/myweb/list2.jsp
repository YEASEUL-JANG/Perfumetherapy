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
function cat_all(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/list.do",
		data: {
			category: "all",
			big_category: "man"},
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
			big_category: "man"},
		success : function(result){
			$("#result").html(result);
			$("#hid_nav").val("green");
		}
	});
}
function cat_brown(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/list.do",
		data: {category: "brown",
			big_category: "man"},
		success : function(result){
			$("#result").html(result);
			$("#hid_nav").val("brown");
		}
	});
}
function cat_white(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/list.do",
		data: {category: "white",
			big_category: "man"},
		success : function(result){
			$("#result").html(result);
			$("#hid_nav").val("white");
		}
	});
}
function cat_red(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/list.do",
		data: {category: "red",
			big_category: "man"},
		success : function(result){
			$("#result").html(result);
			$("#hid_nav").val("red");
		}
	});
}

function table(curPage){
	var cat=$("#hid_nav").val();
	if(category != null){
		param= "curPage="+curPage+"&big_category=man&category="+cat;
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
 <c:when test="${param.category == 'green'}">
   <script type="text/javascript">
    cat_green();
   </script>
 </c:when>
 <c:when test="${param.category == 'all'}">
   <script type="text/javascript">
   cat_all();
   </script>
 </c:when>
 <c:when test="${param.category == 'brown'}">
   <script type="text/javascript">
    cat_brown();
   </script>
 </c:when>
 <c:when test="${param.category == 'white'}">
   <script type="text/javascript">
   cat_white();
   </script>
 </c:when>
 <c:when test="${param.category == 'red'}">
   <script type="text/javascript">
   cat_red();
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
  <li><a href="#" onclick="cat_all()">ALL</a></li>
  <li><a href="#" onclick="cat_green()"> 시트러스 | 그린 </a></li>
  <li><a href="#" onclick="cat_brown()"> 우디 | 베티버 </a></li>
  <li><a href="#" onclick="cat_red()"> 웜스파이시 | 통카빈 </a></li>
  <li><a href="#" onclick="cat_white()"> 머스크 | 앰버</a></li>
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