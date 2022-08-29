<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	reviewlist();
});
function reviewlist(){
	$.ajax({
		type : "post",
		url : "${path}/review_servlet/reviewlist.do",
		success : function(res){
			$(".result2").html(res);
		}
	});
}
function list(page){
	$.ajax({
		type : "post",
		url : "${path}/review_servlet/reviewlist.do",
		data : {curPage:page},
		success : function(res){
			$(".result2").html(res);
		}
	});
}
function search(){
	const keyword = $("#keyword").val();
	$.ajax({
		type : "post",
		url : "${path}/review_servlet/search.do",
		data : {keyword:keyword},
		success : function(res){
			$(".result2").html(res);
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
   <h2 class="fw-bold ">게시물 관리</h2></div>
   
    
    <div class="result2" style="width: 100%;"></div>
    
    </div>
    </section>
    
     <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>


</body>
</html>