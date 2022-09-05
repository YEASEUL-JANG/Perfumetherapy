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
var oEditors=[];
$(function(){
	   nhn.husky.EZCreator.createInIFrame({
	      oAppRef: oEditors,
	      elPlaceHolder: "ir1",
	      sSkinURI: "../Resources/smartEditor/SmartEditor2Skin.html",  
	      htParams : {
	          bUseToolbar : true,             
	          bUseVerticalResizer : true,     
	          bUseModeChanger : true,         
	          fOnBeforeUnload : function(){
	          }
	      },
	      fCreator: "createSEditor2"
	      });
});
function submitPost(){
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	let writer = $("#writer").val();
	let title = $("#title").val();
	let category_option = $("#category_option").val();
	let passwd = $("#passwd").val();
	let filename = $("#filename").val();
	if(writer == ''){
		alert("닉네임을 입력해주세요"); return;
	}
	if(title == ''){
		alert("제목을 입력해주세요"); return;
	}
	let content = document.getElementById("ir1").value;
	if(content==''){
		alert("내용을 입력해주세요");
		oEditors.getById["ir1"].exec("FOCUS");
	    return;
	  }
	if(passwd == ''){
		alert("비밀번호를 입력해주세요"); return;
	}
	$("#content").val(content);
	document.form1.submit();
}

</script>
<style type="text/css">
#write{
margin-top: 30px;
border-collapse:collapse;
border-top: 1px solid #e8e8e8;
}
#write th{
width: 20%;
padding: 10px;
background: #fafafa;
text-align: center;}
#write input[type="text"],input[type="password"]{
border: 1px solid #e8e8e8;
padding: 5px;
border-radius: 10px;}
#write td{
padding: 10px;
border-bottom: 1px solid #e8e8e8;}
#writeInsert{
width: 80px;
border: 1px solid #222;
border-radius: 5px;
padding: 3px;}
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
    <form name="form1" action="${path }/qna_servlet/write.do" enctype="multipart/form-data" method="post">
    <table id="write" style="width:100%;">
    <tr>
     <th>닉네임</th>
     <td>
     <input type="text" id="writer" name="writer" size="20"></td>
     </tr>
     <tr>
     <th>제목</th>
     <td>
     <select id="category_option" name="category_option">
      <option value="전체">전체</option>
      <option value="상품문의">상품문의</option>
      <option value="배송문의">배송문의</option>
      <option value="교환/반품문의">교환/반품문의</option>
      <option value="기타문의">기타문의</option>
     </select><input type="text" id="title" name="title" size="40">
     </td>
     </tr>
     <tr>
     <td colspan="2">
       <textarea rows="20" style="width:100%;" id="ir1" name="ir1"></textarea>
       <input type="hidden" id="content" name="content">
     </td>
     <tr>
     <tr>
     <th>첨부파일</th>
     <td><input type="file" id="file" name="filename"></td>
     </tr>
     <tr>
     <th>비밀번호</th>
     <td><input type="password" name="passwd" id="passwd"> </td>
     </tr>
    </table>
     </form>
     <div align="right" style="margin-top:20px;"><button id="writeInsert" onclick="submitPost()">글쓰기</button>
    </div>
    </div>
    </section>
    
     <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>


</body>
</html>