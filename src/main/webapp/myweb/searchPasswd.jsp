<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
function searchId(){
	const userid = $("#userid").val();
	const name = $("#uname").val();
	if(name !="" && userid != ""){
	document.form1.action = "${path}/user_servlet/searchPasswd.do";
	document.form1.submit();
	}else{
		alert("아이디와 이름을 모두 입력해주세요.");
	}
}

</script>
<style type="text/css">
#searchtable1{
text-align: center;
color: #333;
font-size: 15px;
padding-bottom: 20px;
}
#searchtable1 td{
padding: 10px;
text-align: left;
width: 100%;
}
.contentbox{
background: #f7f7f7;
color: #777;
font-size: 17px;
text-align: center;
width: 100%;
padding: 25px;
margin-top: 30px;
border-radius: 10px;
}
.welcomebox{
width: 100%;
padding: 50px;
align-items: center;
border: 1px solid #ddd;
margin-top: 60px;
}
#searchId{
background: #333;
color: white;
margin: 10px;
padding: 12px;
width: 350px;
border-radius: 10px;
cursor: pointer;
margin-top: 20px;
text-align: center;
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
   <h2 class="fw-bold ">비밀번호 찾기</h2>
   <div class="contentbox">
   가입하신 정보에 따라 비밀번호 찾기가 가능합니다.<br>
   가입하실 때 입력한 아이디와 이름을 입력해 주세요.
   </div>
   <div class="welcomebox justify-content-center flex-sm-column d-sm-flex align-items-center">
   <h4>비밀번호 찾기</h4>
   <p>
   <form name="form1" method="post">
   <table id="searchtable1" class="justify-content-center flex-sm-column d-sm-flex align-items-center">
    <tr>
    <td class="li">회원유형</td>
    <td><input type="radio" checked> 개인회원</td>
    </tr>
    <tr>
    <td class="li">아이디</td>
    <td><input name="userid" id="userid" size="30"></td>
    </tr>
    <tr>
    <td class="li">이름</td>
    <td><input name="uname" id="uname" size="30"></td>
    </tr>
   </table>
    <div onclick="searchId()" id="searchId">확인</div>
   </form>
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