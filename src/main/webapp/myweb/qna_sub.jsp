<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<style type="text/css">
#qnatable{
border-collapse: collapse;
width: 100%;
font-size: 15px;
font-weight: lighter;
text-align: center;
border-top: 2px solid #e8e8e8;
}
#qnatable th{
color: #999;
padding: 15px;
background: #fafafa;
}
#qnatable td{
padding: 10px;
border-bottom: 1px solid #e8e8e8;
}
</style>
<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/myweb/qnawrite.jsp";
	});
});
</script>
</head>
<body>

<select id="category_option" name="category_option" onchange="category()">
 <option value="전체">전체</option>
 <option value="상품문의">상품문의</option>
 <option value="배송문의">배송문의</option>
 <option value="교환/반품문의">교환/반품문의</option>
 <option value="기타문의">기타문의</option>
</select>
<table id="qnatable">
 <tr>
  <th>번호</th>
  <th>상품정보</th>
  <th>카테고리</th>
  <th>제목</th>
  <th>작성자</th>
  <th>첨부파일</th>
  <th>작성일</th>
  <th>조회수</th>
 </tr>
 <c:forEach var = "q" items="${list }">
  <c:choose>
   <c:when test="${q.show == 'y'}"> 
  <tr>
  <td>${q.num }</td>
  <td><c:if test="${q.picture != null }"> <img src="image/${q.picture }" 
  style="width:50px;heifht:50px; border-radius: 25px; border:1px solid #e8e8e8;"> ${q.iname }</c:if></td>
  <td>${q.category }</td>
  <td><a href="${path}/myweb/qnapasswd.jsp?num=${q.num}">${q.title }</a>
  <c:if test="${q.comment_count > 0}">
	<span style="color: green;">(${q.comment_count})</span>
	</c:if></td>
  <td>${q.writer }</td>
  <td>
	 <c:if test="${q.filesize > 0}">
	   <img src="image/file.gif">
	 </c:if>
	</td>
  <td>${q.reg_date }</td>
  <td>${q.review_count }</td>
  <td></td>
  </tr>
  </c:when>
  <c:otherwise>
    <tr>
   <td>${q.num }</td>
   <td><c:if test="${q.picture != null }"> <img src="image/${q.picture }"> ${q.iname }</c:if></td>
   <td>${q.category }</td>
   <td>삭제된 글 입니다.</td>
   <td>${q.writer }</td>
   <td></td>
   <td>${q.reg_date }</td>
   <td></td>
   </tr>
  </c:otherwise>
  </c:choose>
 </c:forEach>
 
 <!-- 페이지 네비게이션 출력, index.jsp에서 자동으로 호출되었던 함수list(curPage)사용 --> 
 <tr>
  <td colspan="8" align="center">
   <c:if test="${page.curPage > 1}">
    <a href="#" onclick="list('1')">[처음]</a>
   </c:if>
   <c:if test="${page.curBlock > 1}">
    <a href="#" onclick="list('${page.prevPage}')">[이전]</a>
   </c:if>
   <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
    <c:choose>
     <c:when test="${num == page.curPage}">
      <span style="color: red;">${num}</span>
     </c:when>
     <c:otherwise>
      <a href="#" onclick="list('${num}')">${num}</a>
     </c:otherwise>
    </c:choose>
   </c:forEach>
   <c:if test="${page.curBlock < page.totBlock}">
    <a href="#" onclick="list('${page.nextPage}')">[다음]</a>
   </c:if>
   <c:if test="${page.curPage < page.totPage}">
    <a href="#" onclick="list('${page.totPage}')">[끝]</a>
   </c:if>
  </td>
 </tr>
</table>
<div id="button" align="right"><button id="btnWrite">글쓰기</button></div>
</body>
</html>