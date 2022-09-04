<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<style type="text/css">
#content{
width: 100%;
padding-top: 20px;
padding-bottom: 20px;}
.comment{
width: 100%;
display: none;
padding: 30px;
text-align: left;}
#reviewtable{
border: 1px solid #e8e8e8;
width: 100%;
font-size: 13px;
padding: 10px;}
#reviewtable th{
font-weight: bold;
width: 10%;
}
#reviewtable td{
padding: 3px;}
#itemcomment{
border-collapse: collapse;
text-align: center;
width: 100%;
border-top: 2px solid #222;}
#itemcomment th{
font-weight: bold;
padding: 10px;}
#itemcomment .th{
border-bottom: 2px solid #e8e8e8;}
#itemcomment .td{
border-bottom: 1px solid #e8e8e8;}


.close_modal{
text-align: right; 
cursor: pointer;
font-size: 40px;
color: white;
padding-right: 20px;
font-weight: lighter;
display: inline;
float: right;
}

#itemcomment a:link{text-decoration: none; color:#959595; }
#itemcomment a:visited{text-decoration: none; color:#959595; }
#itemcomment a:hover{text-decoration: underline; color:#836e53; }
</style>
<script type="text/javascript">
$(function(){
	$(".close_modal").click(function(){
		  $(".modal").fadeOut();
		 });
});
//댓글 ajax
function showcomment(num,index){
	  var num = num;
	  var j = index;
		 var submenu = $("#comment"+j);
		  if(submenu.is(":visible")){
			  submenu.slideUp();
		  }else{
			  submenu.slideDown();
		  }
	}
function showmodal(index){
	var x = index;
	$("#modalid"+x).fadeIn();
}
</script>
</head>
<body>
<div style="font-weight: lighter; font-size: 28px; margin-top: 50px; font-style: italic;" >상품 사용후기</div>
<table id="itemcomment">
<tr>
<th class="th">번호</th>
<th class="th">포토</th>
<th class="th">제목</th>
<th class="th">작성자</th>
<th class="th">평점</th>
<c:forEach var="c" items="${list }"  varStatus="vs">
<tr>
<td class="td">${c.num }</td>
<td class="td"><c:if test="${c.image_file != ' ' }"><img src="image/file.png"> </c:if> </td>
<td style="width: 50%; text-align: left;" class="td">
<a href="#" onclick="showcomment('${c.num}','${vs.index }'); return false;">
${c.title }
<c:if test="${c.comment_count > 0}">
<span style="font-weight: bold;">[${c.comment_count}]</span>
</c:if>
</a></td>
<td class="td">${c.username }</td>
<td class="td"><c:forEach var="i" begin="1" end="${c.review_star }">★</c:forEach></td>
</tr>
<tr>
<td colspan="5">
<!-- 슬라이드모달 영역 -->
<div class="comment" id="comment${vs.index }">
 <table id="reviewtable">
<tr>
<th>연령대</th><td>${c.age }</td>
</tr><tr>
<th>성별</th><td>${c.gender }</td>
</tr><tr>
<th>회원등급</th><td> FAMILY</td>
</tr><tr>
<th>용량</th><td><%-- ${c.itemsDTO.volume } --%>ml</td>
</tr>
</table>
<div id="content">${c.content }</div>
<c:if test="${c.image_file != ' ' }">
<img src="image/${c.image_file }" onclick="showmodal(${vs.index})" style="width: 120px;height: 120px; cursor: pointer;">
</c:if>
</div>
<!--이미지 모달창  -->
<div id="modalid${vs.index }" class="modal">
 <div class="close_modal">X</div>
 <div class="modal_content">
 <img src="image/${c.image_file }">
 </div>
</div>
</td>
</tr>

</c:forEach>
</table>
</body>
</html>