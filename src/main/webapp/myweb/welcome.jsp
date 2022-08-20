<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="session_check.jsp" %>
<html>
 <head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원가입</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp" %>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico.png" />
<link href="../Resources/css/styles.css" rel="stylesheet" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
#welcometable{
width: 600px;
text-align: center;
border: 1px solid #ddd;
color: #333;
font-size: 13px;
padding-bottom: 20px;
}
#welcometable th{
background: #fbfbfb;
padding: 20px;
border-bottom: 1px solid #ddd;
}
#welcometable td{
text-align: left;
background: white;
border-bottom : none;
padding-top: 20px;
padding-bottom: 5px;
padding-left: 25px;
padding-right: 25px;
}
#welcometable .li{
width: 100px;
}
.welcomebox{
width: 100%;
padding: 50px;
align-items: center;
border: 1px solid #ddd;
margin-top: 60px;
}
</style>
</head>
<body>
<!-- nav -->
  <header>
  <jsp:include page="navbar.jsp"></jsp:include>
  </header>
  <!-- content -->
  <section class="py-5">
  <div class="container px-4 px-lg-5 mt-5">
   <div class="justify-content-center flex-sm-column d-sm-flex align-items-center">
   <h2 class="fw-bold ">회원 가입 완료</h2>
   <div class="welcomebox justify-content-center flex-sm-column d-sm-flex align-items-center">
   <h4 class="fw-bold ">회원가입이 완료 되었습니다.</h4>
   <br>
   <table id="welcometable">
    <tr>
    <th colspan="2">저희 쇼핑몰을 이용해 주셔서 감사합니다.</th>
    </tr>
    <tr>
    <td class="li">아이디</td>
    <td>${dto.userid }</td>
    </tr>
    <tr>
    <td class="li">이름</td>
    <td>${dto.uname }</td>
    </tr>
    <tr>
    <td class="li">이메일</td>
    <td>${dto.email } </td>
    </tr>
   </table>
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