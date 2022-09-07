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
    
    <!-- 컨텐츠페이지-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
           <h1 style="margin: 50px 0px; text-align: center;">오시는 길</h1>
           <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3161.
           834670612529!2d127.00069381558873!3d37.5825106309703!2m3!1f0!2f0!3f0!3m2!
           1i1024!2i768!4f13.1!3m3!1m2!1s0x357cbcd4984e520d%3A0x9942c665c57f6297!
           2zKOyjvCntjbztk7jqt7jrnbztlLw!5e0!3m2!1sko!2skr!4v1662537133204!5m2!1sko!2skr" 
           style="border:0;width:100%; height: 80%;" allowfullscreen="" loading="lazy" 
            referrerpolicy="no-referrer-when-downgrade"></iframe>
            <div align="center" style="margin-top: 50px;">
           <p><b>ADRRESS</b>  03086 서울특별시 종로구 대학로10길 15-15 (동숭동) 해안빌딩 2층 퍼퓸그라피<br>
            <b>TEL</b> 070-7424-1253 <br>
            <b>E-MAIL</b> cs@perfumetherapy.com</p>
            </div>
            </div>
    </section>
    
  <!-- Footer-->
  <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>
    
 </body>
</html>