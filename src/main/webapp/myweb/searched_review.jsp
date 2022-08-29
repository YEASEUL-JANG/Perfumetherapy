<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	//개별모달창 닫기
	$(".close_modal").click(function(){
		  $(".modal").fadeOut();
		 });
});

//개별모달창 열기
function showmodal(index){
	var x = index;
	$("#modalid"+x).fadeIn();
}


</script>
<style type="text/css">
/* 주문하기 모달창 */
.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; 
  display:none;
}
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
.modal_content{
  width:500px; height:800px;
  position:relative; top:50%; left:50%;
  margin-top:-400px; margin-left:-250px;
  text-align:left;
  box-sizing:border-box; padding:0px;
  line-height:23px; 
}
.modal_content img{
width: 100%;
height: 100%;}
#myreview{
width: 100%;
border-top: 2px solid #222;
border-bottom: 2px solid #222;
font-size: 15px;}
#myreview .p{
padding: 5px;}
</style>
</head>
<body>
<table id="myreview">
<tr>
<td>
<input id="keyword" name="keyword" placeholder="리뷰 키워드 또는 상품명 검색">
<button id="btnSearch" onclick="search()">검색</button>
</td>

<c:forEach var="re" items="${list }" varStatus="vs">
<tr>
<td colspan="3"><hr></td>
</tr>
<tr>
<td class="p"style="font-size: 20px; color: #a18672;"><c:forEach var="i" begin="1" end="${re.review_star }">★</c:forEach>
${re.title }</td>
<td>${re.reg_date }</td>
<td rowspan="3"> ${sessionScope.userid } 님의 리뷰입니다.<p>
<table id="review_mini">
<tr>
<th>연령대</th><td>${re.age }</td>
</tr><tr>
<th>성별</th><td>${re.gender }</td>
</tr><tr>
<th>회원등급</th><td>FAMILY</td>
</tr><tr>
<th>용량</th><td>${re.itemsDTO.volume }</td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="p" style="font-weight: bold;">
<img alt="" src="image/${re.itemsDTO.picture }" style="width:70px; height:70px;">
${re.itemsDTO.iname }</td>
</tr>
<tr>
<td class="p">${re.content }</td>
</tr>
<tr>
<td class="p"><img src="image/${re.image_file }" onclick="showmodal(${vs.index})" 
style="width:100px; height:100px; border-radius:10px; cursor: pointer;">
<!--이미지 모달창  -->
<div id="modalid${vs.index }" class="modal">
<div class="close_modal">X</div>
  	<div class="modal_content">
  	<img src="image/${re.image_file }">
  	</div>
  	</div>
</td>
</tr>
<tr>
<td class="p"><a href="#" onclick="review_comment()"> 댓글 <i class="fa-solid fa-angle-down"></i> 
<c:if test="${re.comment_count > 0}">
<span style="font-weight: bold;">(${re.comment_count})</span>
</c:if>
</a></td>
</tr>
</c:forEach>
</table>
</body>
</html>