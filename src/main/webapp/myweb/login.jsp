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
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
#logintable{
width: 800px;
border-top:  1px solid #ddd;
width: 100%;
margin-top: 50px;
}
#logintable td{
border-bottom: 1px solid #ddd;
text-align: center;
padding-top: 20px;
padding-bottom: 20px;
font-size: 15px; 
}
#logintable_sub td{
border: none;
text-align: center;
padding: 1px;
}
#logintable_sub #userid, #passwd{
padding: 15px;
color: #333;
border-radius: 10px;
background: #f8f8f8;
border: none;
}
#logintable_sub .login{
background: #222;
color: white;
text-align: center;
border-radius: 10px;
font-size: 15px;
width: 150px;
cursor: pointer;
}
#join{
width: 250px;
margin: 15px;
padding: 20px;
border: 2px solid #aaa;
background: white;}
</style>
<script type="text/javascript">
function login(){
	const userid = $("#userid").val();
	const passwd = $("#passwd").val();
	if(userid == ""){
	  alert("아이디를 입력하세요");
	  $("#userid").focus(); return;
	}
	if(passwd == ""){
		  alert("비밀번호를 입력하세요");
		  $("#passwd").focus(); return;
		}
	document.form1.action = "${path}/user_servlet/login.do";
	document.form1.submit();
	
}
$(function(){
//카카오 로그인
Kakao.init('a8b6d5eb31d962b41730ae629a461855');
$("#btn-kakao-login").click(function(){
	Kakao.Auth.login({
		scope: 'profile_nickname, account_email, gender',
		success:function(authObj){
			console.log(authObj);
			Kakao.API.request({
				url: '/v2/user/me',
				success: res => {
					const kakao_account = res.kakao_account;
					
					const email = res.kakao_account.email;
					const uname = res.kakao_account.profile.nickname;
					const gender = res.kakao_account.gender;
					console.log(email);
					console.log(uname);
					console.log(gender);
					
					$("#k_email").val(email);
					$("#k_uname").val(uname);
					$("#k_gender").val(gender);
					
					document.kakaoform.action="${path }/user_servlet/kakaoLogin.do"
					document.kakaoform.submit(); 
				}
			}); // api request
		}
	});
});//클릭이벤트 끝
});
</script>
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
   <h2 class="fw-bold">로그인</h2>
   <table id="logintable">
    <tr>
    <td> <a id="btn-kakao-login" style="cursor: pointer;"><img src="image/kakao_login_medium_wide.png"> </a>
    <form name="kakaoform" method="post">
		<input type="hidden" id="k_uname" name="k_uname"/>
		<input type="hidden" id="k_email" name="k_email"/>
		<input type="hidden" id="k_gender" name="k_gender"/>
	</form>
    </td>
    </tr>
    <tr>
    <td class="justify-content-center flex-sm-column d-sm-flex align-items-center">
    <form method="post" name="form1">
     <table id="logintable_sub">
      <tr>
      <td>아이디</td>
      <td><input name="userid" id="userid" size="50" placeholder="아이디"></td>
      <td rowspan="2" onclick="login()" class="login">로그인</td>
      </tr>
      <tr>
      <td>비밀번호</td>
      <td><input type="password" name="passwd" id="passwd" size="50" placeholder="비밀번호"></td>
      </tr>
      <tr>
      <td colspan="3" align="center">
      </td>
      </tr>
     </table>
     <br>
      <a href="searchId.jsp">아이디 찾기</a> | 
      <a href="searchPasswd.jsp">비밀번호 찾기</a>
     </form>
     </td>
      <tr>
    <td><div id="naver_id_login"></div></td>
    </tr>
    <tr>
    <td>아직 퍼퓸그라피의 회원이 아니신가요?<p>
    회원가입하고 다양한 혜택과 서비스를 이용해 보세요!<p>
    <input type="button" id="join" value="회원가입" onclick="location.href='join.jsp'">
    </td>
    </tr>
   </table>
    <script type="text/javascript">
    var naver_id_login = new naver_id_login("pH7As85Gi4hn1mMdklpk", "http://localhost/myproject/myweb/naverLogin.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3,60);
  	naver_id_login.setDomain("http://localhost/myproject/myweb/login.jsp");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
   </div>
  </div>
 </section>
 <div id="naver_id_login"></div>
 
 <!-- Footer-->
  <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>
</body>
</html>