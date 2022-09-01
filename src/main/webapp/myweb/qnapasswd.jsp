<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Perfumetherapy</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../Resources/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico.png" />
<link href="../Resources/css/styles.css" rel="stylesheet" />
<script type="text/javascript">
$(function(){
	$("#passwordcheck").click(function(){
	var num = $("#num").val();
	var userid = $("#userid").val();
	if(userid == 'admin'){
		location.href="${path}/qna_servlet/view.do?num="+num;
	}else{
		var passwd = $("#passwd").val();
		if(passwd == ''){
			alert("비밀번호를 입력하세요"); return;
		}
		document.form1.submit();	
	}
	});
});

</script>
<style type="text/css">
#passwdch{
padding: 50px;
text-align: center;
width: 100%;
border: 1px solid #e8e8e8;}
</style>
</head>
<body>
<header>
  <jsp:include page="navbar.jsp"></jsp:include>
  </header>
  
  <!-- content -->
  <section class="py-5">
  <div class="container px-4 px-lg-5 mt-5">
   <div class="justify-content-center flex-sm-column d-sm-flex align-items-center">
   <h2 class="fw-bold" style="font-size: 40px;">Q&A</h2>
   <h2 class="fw-light " style="font-size: 18px; margin-top: 20px;">상품에 관한 Q&A 게시판입니다</h2></div>
    <!-- 게시판 글쓰기 -->
    <form name="form1" action="${path }/qna_servlet/passwdck.do" method="post">
    <table id="passwdch" >
    <tr>
     <th >비밀번호 확인</th>
     </tr>
     <tr>
     <td >
     이 글은 비밀글입니다. 비밀번호를 입력하여 주세요.<br>관리자는 확인버튼만 누르시면 됩니다.</td>
     </tr>
     <tr>
     <td>비밀번호
     <input type="password" name="passwd" id="passwd">
     <input type="hidden" value="${param.num }" id="num" name="num">
     <input type="hidden" value="${sessionScope.userid }" id="userid">
     </td>
     </tr>
     <tr>
     <td >
      <input type="button" value="목록" id="return" onclick="location.href='${path }/myweb/qna.jsp';">
      <input type="button" value="확인" id="passwordcheck">
      </td>
      </tr>
     
    </table>
     </form>
    </div>
    </section>
    
     <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>


</body>
</html>