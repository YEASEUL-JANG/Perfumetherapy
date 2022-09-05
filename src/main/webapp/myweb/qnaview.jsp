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
	comment_list();
	$("#reply").click(function(){
		location.href="${path}/qna_servlet/reply.do?num=${dto.num}";
	});
	$("#modify").click(function(){
		location.href="${path}/qna_servlet/modify.do?num=${dto.num}";
	});
});	

function comment_list(){
	$.ajax({
		type: "post",
		url: "${path}/qna_servlet/qnacomment.do",
		data: "num=${dto.num}",
		success: function(result){
			$("#commentList").html(result);
		}
	});
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
.butt{
width: 80px;
padding: 5px;
border: 1px solid #6F6E6D;
border-radius: 5px;
color: #6F6E6D;}
#write a:link{text-decoration: none; color:#959595; }
#write a:visited{text-decoration: none; color:#959595; }
#write a:hover{text-decoration: underline; color:#836e53; }
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
    <table id="write" style="width:100%;">
    <tr>
     <th>닉네임</th>
     <td>
     ${dto.writer }</td>
     </tr>
     <tr>
     <th>제목</th>
     <td>
     ${dto.category } > ${dto.title }
     </td>
     </tr>
     <tr>
     <td colspan="2">
      작성일&nbsp;${dto.reg_date }&nbsp; &nbsp;조회수&nbsp;${dto.review_count } <br>
      
      </td>
      </tr>
      <tr>
      <td colspan="2" style="padding-top: 30px;padding-bottom: 30px;">
       ${dto.content }
       
     </td>
     </tr>
     <tr>
     <th>첨부파일</th>
     <td><c:if test="${dto.filesize > 0 }">
     <a href="${path}/qna_servlet/download.do?num=${dto.num}">${dto.filename }</a>
     </c:if> </td>
     </tr>
    </table>
    <div id="commentList"></div>
     <div align="right" style="margin-top:20px;">
     <button class="butt" onclick="location.href='${path }/myweb/qna.jsp';">목록</button>
     <div align="center">
     <button class="butt" id="modify" >수정하기</button>
     <button  class="butt" id="reply">답변하기</button>
     </div>
    </div>
    </div>
    </section>
    
     <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>


</body>
</html>