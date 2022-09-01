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
<link href="../Resources/css/styles.css" rel="stylesheet" />
<script type="text/javascript">
$(function(){
	qna();
});
function qna(){
	$.ajax({
		type : "post",
		url : "${path}/qna_servlet/qnalist.do",
		success : function(res){
			$(".result1").html(res);
		}
	});
}
function list(page){
	$.ajax({
		type : "post",
		url : "${path}/qna_servlet/qnalist.do",
		data : {curPage:page},
		success : function(res){
			$(".result1").html(res);
		}
	});
}
function category(){
	var category= $("#category_option").val();
	$.ajax({
		type : "post",
		data : {category:category},
		url : "${path}/qna_servlet/qnacategory.do",
		success : function(res){
			$(".result1").html(res);
			$("#category_option").val(category).prop("selected",true);
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
   <h2 class="fw-bold" style="font-size: 40px;">Q&A</h2>
   <h2 class="fw-light " style="font-size: 18px; margin-top: 20px;">상품에 관한 Q&A 게시판입니다</h2></div>
    
    <div class="result1" style="width: 100%;"></div>
    
    </div>
    </section>
    
     <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>


</body>
</html>