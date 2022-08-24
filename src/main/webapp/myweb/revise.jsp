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
<script type="text/javascript">
function passwdck(){
	var passwd = $("#passwd").val();
	if(passwd == ""){
		alert("비밀번호를 입력해주세요."); return;
	}else{
		document.form1.submit();
	}
}

</script>
<style type="text/css">
#passwdchtable{
width: 600px;
text-align: center;
border:none;
color: #333;
font-size: 13px;
padding-bottom: 20px;
}
#passwdch{
width: 300px;
padding: 10px;
background: #222;
text-align: center;
font-size: 15px;
color: white;
border-radius: 7px;
margin-top: 30px;
}
#passwdchtable th{
padding: 20px;}
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
   <h2 class="fw-bold ">회원 정보 수정</h2>
   <div class="welcomebox justify-content-center flex-sm-column d-sm-flex align-items-center">
   <br>
   <form name="form1" action="${path }/user_servlet/passwdck.do" method="post">
   <table id="passwdchtable">
    <tr>
    <th  style="font-size: 25px;">비밀번호 확인</th>
    </tr>
    <tr>
    <th style="font-size: 15px; color: #a6a6a6; font-weight: lighter;">[${sessionScope.userid }] 님의 회원정보를 안전하게 보호하기 위해<br>비밀번호를 한번 더 확인해 주세요.</th>
    </tr>
    <tr>
    <td >비밀번호 <input type="password" id="passwd" name="passwd" size="30"></td>
    </tr>
    <tr>
    <td><input type="button" id="passwdch" onclick="passwdck()" value="확인"></td>
    </tr>
   </table>
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