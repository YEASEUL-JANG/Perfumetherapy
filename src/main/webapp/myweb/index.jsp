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
<style type="text/css">


</style>
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
	     <a><img src="image/headerimg1.jpg"></a>
	    
	    </div>
	   </li>
	   <li class="slideitem">
	    <div>
	     <label for="slide01" class="left"></label>
	     <label for="slide03" class="right"></label>
	     <a><img src="image/headerimg2.jpg"> </a>
	    </div>
	   </li>
	   <li class="slideitem">
	    <div>
	     <label for="slide02" class="left"></label>
	     <label for="slide01" class="right"></label>
	     <a><img src="image/headerimg3.jpg"> </a>
	    </div>
	   </li>
	  </ul>
	 </div>
	</div>
    
    <!-- 컨텐츠페이지-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <!-- 상품 -->
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- 세일-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                        <!-- 상품이미지-->
                        <a href="#"><img class="card-img-top" src="image/new_img1.png" alt="..." /></a>
                        <!-- 상품디테일-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- 상품이름-->
                                <h6 class="fw-bolder">구찌 알케미스트 가든 윈터스 스프링 오 드 퍼퓸 100ml</h6>
                                <!-- 상품가격-->
                                <span class="text-muted text-decoration-line-through">450,000원</span>
                                395,000원
                                <div class="item_sub">미모사와 아카시아 꽃을 가볍게 띄워놓은 미온수로 부드럽게 목욕한 후 살에 남은 잔향</div>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                        </div>
                    </div>
                </div>
                
                </div>
            </div>
    </section>
    
  <!-- Footer-->
  <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>
    
 </body>
</html>