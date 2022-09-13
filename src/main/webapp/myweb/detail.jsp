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
	detail();
});
<% String idx = request.getParameter("idx");%>
function detail(){
	const idx = $("#hidden").val();
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/detail.do",
		data: {
			idx: idx},
		success : function(result){
			$("#result").html(result);
		}
	});
}
</script>
</head>
<body>
<input type="hidden" name="idx" id="hidden" value="<%=idx %>">
<div id="result" style="width: 100%;"></div>
<!--  -->
</body>
</html>