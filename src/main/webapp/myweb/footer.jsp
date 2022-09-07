<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>navbar</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp" %>
<!-- Favicon-->
<link href="../Resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
.up{
width: 50px; height: 50px;
box-shadow: 3px 3px 5px gray;
background: white;
border-radius: 25px;
position: fixed;
right: 50px; bottom: 50px;
font-size: 20px; 
text-align: center;
transition: transform 0.5s;
}
.text{
 margin: 0px;
 padding-top: 7px;}
.up a:link{text-decoration: none; color:#8a7f73; }
.up a:visited{text-decoration: none; color:#8a7f73;}
.up a:hover{text-decoration: none; font-weight: bold; color:#8a7f73;}
</style>
</head>
 <div class="up">
 <div class="text">
 <a href="#navbar" >up</a></div>
 </div>
 	<footer id="footer" class="py-5 bg-footer">
        <div class="container">
        <p class="m-0 text-center text-black text-footer">상호명 퍼퓸테라피 사업자등록번호 123-45-67891<br>
        주소 03086 서울특별시 종로구 대학로10길 15-15 (동숭동) 해안빌딩 2층 퍼퓸테라피  개인정보보호책임자 아무개(cs@perfumetherapy.com)</p>
        <p class="m-0 text-center text-footer2">
        ※ 퍼퓸테라피에서 제공하는 모든 컨텐츠는 무단으로 복제, 배포하는 경우에 저작권법에 의하여 처벌을 받을 수 있습니다.</p><br>
        <p class="m-0 text-center text-black text-footer">Copyright &copy; 퍼퓸테라피 2022. All rights reserved.</p>
        </div>
    </footer>
    <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>