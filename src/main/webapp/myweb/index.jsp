<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Perfumetheraphy</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp" %>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico.png" />
<link href="../Resources/css/styles.css" rel="stylesheet" />
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<style type="text/css">
#header{
width: 100%;
	display: flex;
    justify-content: center;
    margin:0px;
    padding: 0px;
}
#bottom{
background-color: #f6f3f0;
width: 100%;
margin: 0px;
padding: 100px;
text-align: center; }
.divimg{
text-align: center;
padding: 50px 0px;}
.mdpic{
width: 100%;
text-align: center;
}
.mdpic td{
padding: 10px 20px;}
.mdpic img{
width: 100%;
height: 100%;}
.mdpic .b{
font-size: 17px;
color: #555;}
.mdpic .c{
font-size: 13px;
color:#848484;}
.mdpic a:link{text-decoration: none;}
.mdpic a:visited{text-decoration: none;}
.mdpic a:hover{text-decoration: none; opacity:0.7; }
</style>
<script type="text/javascript">
$(function(){
	cat_best();
});
function cat_best(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/bestList.do",
		data: {category : "count",
			 order: "desc"},
		success : function(res){
			$("#bestitem").html(res);
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
</head>
  <body>
  <!-- nav -->
  <header>
  <jsp:include page="navbar.jsp"></jsp:include>
  </header>
  
    <!--헤더_슬라이드이미지  -->
    <div id="header">
	 <div class="slidebox">
	  <input data-role="none" type="radio" name="slide" id="slide01" checked>
	  <input data-role="none"type="radio" name="slide" id="slide02">
	  <input data-role="none"type="radio" name="slide" id="slide03">
	  <ul class="slidelist">
	   <li class="slideitem">
	    <div>
	     <label for="slide03" class="left"></label>
	     <label for="slide02" class="right"></label>
	     <a><img src="image/headerimg01.png"></a>
	    
	    </div>
	   </li>
	   <li class="slideitem">
	    <div>
	     <label for="slide01" class="left"></label>
	     <label for="slide03" class="right"></label>
	     <a><img src="image/headerimg02.png"> </a>
	    </div>
	   </li>
	   <li class="slideitem">
	    <div>
	     <label for="slide02" class="left"></label>
	     <label for="slide01" class="right"></label>
	     <a><img src="image/headerimg03.png"> </a>
	    </div>
	   </li>
	  </ul>
	 </div>
	</div>
    
  <!-- 컨텐츠페이지-->
  <section class="py-5">
      <div class="container px-4 px-lg-5 mt-5">
         <div class="divimg" data-aos="fade-up">
        	<p style="color:#604113;">Perfumetherapy MD Pick</p>
        	<h2>큐레이션</h2>
        	<p></p>
         	<p>비슷한 취‘향’은 더 깊이, 새로운 취‘향’은 더욱 넓게.
         	<br>퍼퓸테라피가 제안하는 큐레이션을 만나보세요</p>
        	</div>
          <div class="divimg" data-aos="fade-up">
        	<table class="mdpic">
        	<tr>
        	<td><a href="${path}/myweb/detail.jsp?idx=40"><img src="image/mdpic01.png"></a></td>
        	<td><a href="${path}/myweb/list.jsp?category=green"><img src="image/mdpic02.png"></a></td>
        	<td><a href="${path}/myweb/detail.jsp?idx=67"><img src="image/mdpic03.png"></a></td>
        	</tr>
        	<tr>
        	<td class="b">여름향수는 산뜻해야해요, 수르닐 처럼</td>
        	<td class="b">무더위도 수긍하게 만드는 향수 컬렉션</td>
        	<td class="b">이젠 말하기도 입아픈 여름 향수</td>
        	</tr>
        	<tr>
        	<td class="c">한여름 유독 100ml를 많이 찾는 향수, <br>에르메스 정원의 선선함을 느껴보세요</td>
        	<td class="c">청량한 여름이 낯설다면, 아마 이향수가 없어서 일거예요<br> 퍼퓸테라피가 당신의 여름을 바꿔드릴게요</td>
        	<td class="c">퍼퓸테라피 오프라인 베스트셀러<br> 무더위, 땀, 습도를 완벽 방어하는 향수를 찾고있다면!</td>
        	</tr>
        	</table>
        	</div>
        	
        <div class="divimg"data-aos="fade-up" >
          <div class="justify-content-center flex-sm-column d-sm-flex align-items-center">
  			 <form method="post" name="idxform">
				<input type="hidden" id="hiddenidx" name="idx">
			 </form>
  			 <h2 class="fw-lighter ">best 12</h2></div>
         	  <div id="bestitem" style="width: 100%;"></div>
        </div>	
     </div>
  </section>
    <div id="bottom" data-aos="fade-up">
      <h2 style="color:#6b3f00; ">당신은 스스로에게 만족스러운 향수를 사용하고 있나요?</h2>
        	<p></p>
         	<p>전 세계 수만 개의 향수 중 당신의 향수를 찾는 것은 운명과도 같습니다<br>
				그렇기에 퍼퓸그라피는 오늘도 향기와 사람을 잇는 매개체가 되어 새로운 향수들을 끊임없이<br>
				탐구하는 일을 멈추지 않습니다. 당신의 일부가 되는 최적의 향수를 찾는 일,<br>
				그것이 퍼퓸테라피가 존재하는 이유입니다.</p>
     <img src="image/Animation.gif" style="width: 80%; height: 50%;margin-top:50px;">
    </div>
  <!-- Footer-->
  <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>
   <script type="text/javascript">
AOS.init({
    easing: 'ease-out-back',
    duration: 1000
});
</script>
 </body>
</html>