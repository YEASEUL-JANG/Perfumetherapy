<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico.png" />
<link href="../Resources/css/styles.css" rel="stylesheet" />
<script type="text/javascript">
$(function(){
	var count = Number($("#count").val());
	console.log("count: "+count);
	 for(let i = 0; i<count+1; i++){
		var num = $("#num"+i).val();
		console.log(num);
		  $.ajax({
				type : "post",
				url : "${path}/review_servlet/username.do",
				data : {num:num},
				success : function(res){
					$("#username"+i).html(res);
					$("#username3"+i).html(res);
				}
			}); 
	}
	 
	//모달창 닫기
	 $(".close_modal2").click(function(){
		  $(".modal").fadeOut();
		 });
});
//모달리뷰창 열기
function modalreview(index){
	var x = index;
	$("#modalreview"+x).fadeIn();
}
//댓글 ajax
function showcomment2(num,index){
	  var num = num;
	  var j = index;
	  $.ajax({
			type : "post",
			url : "${path}/review_servlet/showcomment.do",
			data : {num:num},
			success : function(res){
				$("#commentList2"+j).html(res);
				 var submenu = $("#comment2"+j);
				  if(submenu.is(":visible")){
					  submenu.slideUp();
				  }else{
					  submenu.slideDown();
				  }
			}
		});
}
function insertcomment2(num,index){
	  var num = num;
	  var j = index;
	  var nickname = $("#nickname2"+j).val();
	  var content = $("#com_content2"+j).val();
	  var param = "board_num="+num+"&nickname="+nickname+"&content="+content;
	  $.ajax({
			type : "post",
			url : "${path}/review_servlet/comment_add.do",
			data : param,
			success : function(res){
				$("#nickname2"+j).val("");
				$("#com_content2"+j).val("");
				showcomment2(num,j);
			}
		});
}
</script>
<style type="text/css">
.comment{
display: none;width: 100%;}
.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.7); top:0; left:0; 
  display:none;
}
.detailreview{
position: absolute;
background: white;
box-sizing:border-box; 
top:0;
right:0;
height: 100%;
width: 30%;}
.close_modal2{
text-align: right; 
cursor: pointer;
font-size: 20px;
color: black;
padding-right: 20px;
font-weight: lighter;
display: inline;
float: right;
}
.modal_content2{
  width:400px; height:700px;
  position:relative; top:50%; left:35%;
  margin-top:-350px; margin-left:-200px;
  text-align:left;
  box-sizing:border-box; padding:0px;
  line-height:23px; 
}
.card2 {
  position: relative;
  display: flex;
  border: 1px solid #e5e5e5;
  flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #fff;
  background-clip: border-box;
}
.butt{
padding: 3px;
width: 70px;
border: 1px solid #222;
border-radius: 6px;}
#reviewtable1 td{
padding: 5px;}
#photoreview a:link{text-decoration: none; color:#959595; }
#photoreview a:visited{text-decoration: none; color:#959595; }
#photoreview a:hover{text-decoration: underline; color:#836e53; }

#commenttable2{
width: 100%;
border-radius: 10px; background:#f7f9f8; padding: 10px; }
#commenttable2 td{
padding 5px;}
</style>
</head>
<body>
<div style="font-size: 20px;">REVIEW | 포토 리뷰</div>
<input type="hidden" value="${count }" id="count">
<table id="photoreview">
<tr>
<td>
<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
<c:forEach var="p" items="${list }" varStatus="vs">
 <div class="col mb-5">
   <div class="card2 h-100">
       <!-- Product image-->
       <img class="card-img-top" src="image/${p.image_file }" onclick="modalreview(${vs.index})" 
       style="cursor:pointer; height: 300px;" />
       <!-- Product details-->
       <div class="card-body p-2">
           <table id="minitable" style=" font-size: 12px;">
           <tr>
           <td colspan="2" style="font-size:15px;">${p.title }</td>
           </tr>
           <tr>
           <td style="color:#c3c3c3;"><input type="hidden" id="num${vs.index }" value="${p.num }" >
           <div id="username${vs.index }"></div></td>
           <td style="color:#bbb;text-align:right;">${p.reg_date }</td>
           </tr>
           <tr>
           <td colspan="2"><hr></td>
           </tr>
           <tr>
           <td><img src="image/${p.itemsDTO.picture }" style="width:60px;height:60px;"></td>
           <td>
           ${p.itemsDTO.iname }</td>
           </tr>
           </table>
       </div>
   </div>
  </div>
  
  <!-- 모달창 -->
  <div id="modalreview${vs.index }" class="modal">
 
 <div class="modal_content2">
 <img src="image/${p.image_file}" style="width:100%;height:100%;">
 </div>
 <div class="detailreview">
 <div class="close_modal2">X</div>
   
     <table id="reviewtable1" style="width: 100%; padding: 20px;">
     <tr>
		<td colspan="2" class="p" style="font-weight: bold;">
		<img alt="" src="image/${p.itemsDTO.picture }" style="width:70px; height:70px;">
		${p.itemsDTO.iname }</td>
		</tr>
		<tr>
		<td colspan="2"><hr></td>
		</tr>
     <tr>
		<td class="p" style="font-size: 20px; color: #a18672;">
		<c:forEach var="i" begin="1" end="${p.review_star }">★</c:forEach>
		${p.title }</td><td style="text-align:right;">${p.reg_date }</td>
		</tr>
		
		<tr>
		<td colspan="2" style="border: 1px solid #c8c9ca;padding: 5px;width: 100%;margin: 20px;">
		<input type="hidden" id="num2${vs.index }" value="${p.num }" > 
		<div id="username3${vs.index }" style="display: inline;"></div> 님의 리뷰입니다.<p>
		<table id="review_mini" style="margin: 10px;">
		<tr>
		<th>연령대</th><td>${p.age }</td>
		<th>성별</th><td>${p.gender }</td>
		<th>회원등급</th><td> FAMILY</td>
		</tr><tr>
		<th>용량</th><td>${p.itemsDTO.volume }ml</td>
		</tr>
		</table>
		</td>
		</tr>
		<tr>
		<td colspan="2" style="padding-top:20px;">${p.content }</td>
		</tr>
		<tr>
		<td class="p" id="commentslide">
		<a href="#" onclick="showcomment2('${p.num}','${vs.index }'); return false;"> 댓글 <i class="fa-solid fa-angle-down"></i> 
		<c:if test="${p.comment_count > 0}">
		<span style="font-weight: bold;">(${p.comment_count})</span>
		</c:if>
		</a></td>
		</tr>
		<!-- 댓글영역 -->
		<tr>
		<td colspan="2">
		
		<div class="comment" id="comment2${vs.index }">
		<!-- 댓글 쓰기 폼 -->
		<div id="commentList2${vs.index }"></div>
		<table id="commenttable2">
		 <tr>
		  <td><input id="nickname2${vs.index }" placeholder="닉네임">
		  <button onclick="insertcomment2('${p.num}','${vs.index }')" type="button" style="width:50px;" 
		  class="butt">확인</button></td>
		 </tr>
		 <tr>
		  <td><textarea rows="3" style="width: 100%;" placeholder="내용을 입력하세요" 
		  id="com_content2${vs.index }"></textarea></td>
		 </tr>
		</table>
		</div>
		
		</td>
		</tr>
     </table>
 </div>
</div>
</c:forEach>


</div>
</td>



<!-- 페이지 네비게이션 출력, index.jsp에서 자동으로 호출되었던 함수list(curPage)사용 --> 
 <tr>
  <td colspan="8" align="center">
   <c:if test="${page.curPage > 1}">
    <a href="#" onclick="list2('1')">[처음]</a>
   </c:if>
   <c:if test="${page.curBlock > 1}">
    <a href="#" onclick="list2('${page.prevPage}')">[이전]</a>
   </c:if>
   <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
    <c:choose>
     <c:when test="${num == page.curPage}">
      <span style="color: red;">${num}</span>
     </c:when>
     <c:otherwise>
      <a href="#" onclick="list2('${num}')">${num}</a>
     </c:otherwise>
    </c:choose>
   </c:forEach>
   <c:if test="${page.curBlock < page.totBlock}">
    <a href="#" onclick="list2('${page.nextPage}')">[다음]</a>
   </c:if>
   <c:if test="${page.curPage < page.totPage}">
    <a href="#" onclick="list2('${page.totPage}')">[끝]</a>
   </c:if>
  </td>
 </tr>
</table>
</body>
</html>