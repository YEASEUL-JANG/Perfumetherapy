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
.divimg{
text-align: center;
padding: 70px 0px;}
</style>
</head>
  <body>
  <!-- nav -->
  <header>
  <jsp:include page="navbar.jsp"></jsp:include>
  </header>
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
        	<div class="divimg" data-aos="fade-up">
        	<p style="color:#604113;">Perfumetherapy story</p>
        	<h2>오늘 당신은 어떤 향기를 입고있나요</h2>
         	<p>_</p>
         	<p>'나의 향수는 나의 일부가 되고 아무도 그것을 모방할 수 없다'</p>
         	<p>현대 사회에서 향수란 나의 정체성을 의미합니다. 
         	<br> 나에게 맞는 향수를 찾아가는 것은 나의 정체성을 찾아가는 과정이기도 합니다.</p>
        	</div>
        
   			<div class="divimg" data-aos="fade-up">
   			<img alt="" src="image/storyimg01.png">
   			</div>
   			
   			<div class="divimg" data-aos="fade-up">
        	<h2>지금, 당신은 스스로에게 만족스러운 향수를 사용하고 있나요?</h2>
         	<p>_</p>
         	<p>전 세계 수만 개의 향수 중 당신의 향수를 찾는 것은 운명과도 같습니다<br>
         	그렇기에 퍼퓸그라피는 오늘도 향기와 사람을 잇는 매개체가 되어<br>
         	새로운 향수들을 끊임없이 탐구하는 일을 멈추지 않습니다.</p>
         	<p>당신의 일부가 되는 최적의 향수를 찾는 일, 그것이 퍼퓸테라피가 존재하는 이유입니다.</p>
        	</div>
   			
    		<div class="divimg" data-aos="fade-up">
   			<img alt="" src="image/storyimg02.png">
   			</div>
   			
   			<div class="divimg" data-aos="fade-up">
         	<p>향기는 시간과 장소의 구속에서 벗어나 기억을 되새기게 하고<br>
         	수많은 사연과 이야기에 귀 기울이게 해준다.<br>
         	향수 안에 나의 내면이 있다.</p>
         	<p>[향기 탐색] 중에서</p>
        	</div>
        	
   			<div class="divimg" data-aos="fade-up">
   			<img alt="" src="image/storyimg03.png">
   			</div>
               
               
            </div>
    </section>
    
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