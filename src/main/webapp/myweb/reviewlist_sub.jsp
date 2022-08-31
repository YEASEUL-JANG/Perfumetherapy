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
<script type="text/javascript">
$(function(){
	//개별모달창 닫기
	$(".close_modal").click(function(){
		  $(".modal").fadeOut();
		 });
	$(".close_modal2").click(function(){
		  $(".modal").fadeOut();
		 });
	//기본선택
	var hid_age = $("#hid_age").val();
	var hid_reviewstar = $("#hid_reviewstar").val();
	var hid_gender = $("#hid_gender").val();
	$("input:radio[name='reviewStar']:radio[value='"+hid_reviewstar+"']").prop('checked', true);
	$("input:radio[name='gender']:radio[value='"+hid_gender+"']").prop('checked', true);
	$(".age").val(hid_age).prop("selected",true);
	
	//댓글 표시
	var hid_num = $("#hid_num").val();
	var hid_index = $("#hid_index").val();
	//유저아이디 가져오기
	var count = Number($("#count2").val());
	for(let i = 0; i<count+1; i++){
		var num = $("#num2"+i).val();
		  $.ajax({
				type : "post",
				url : "${path}/review_servlet/username2.do",
				data : {num:num},
				success : function(res){
					$("#username2"+i).html(res);
				}
			}); 
	}
	
});

//개별모달창 열기
function showmodal(index){
	var x = index;
	$("#modalid"+x).fadeIn();
}
//수정폼 모달 열기
function modifyreview(index){
	var y = index;
	$("#modify"+y).fadeIn();
}

function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
    	$("#image_container").html("");
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      img.style.width="80px";
      img.style.height="80px";
      document.querySelector("div#image_container").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
  }
  //수정하기
  function modify(index){
	  var i = index;
	  if(confirm("수정하시겠습니까?")){
		  $("#form"+i).attr("action","${path }/review_servlet/modify.do");
		  $("#form"+i).submit();
	  }
  }
  function deletereview(index){
	  var j = index;
	  if(confirm("삭제하시겠습니까?")){
		  $("#form"+j).attr("action","${path }/review_servlet/delete.do");
		  $("#form"+j).submit();
	  }
  }

  //댓글 ajax
  function showcomment(num,index){
	  var num = num;
	  var j = index;
	  $.ajax({
			type : "post",
			url : "${path}/review_servlet/showcomment.do",
			data : {num:num},
			success : function(res){
				$("#commentList"+j).html(res);
				 var submenu = $("#comment"+j);
				  if(submenu.is(":visible")){
					  submenu.slideUp();
				  }else{
					  submenu.slideDown();
				  }
			}
		});
  }
  function insertcomment(num,index){
	  var num = num;
	  var j = index;
	  var nickname = $("#nickname"+j).val();
	  var content = $("#com_content"+j).val();
	  var param = "board_num="+num+"&nickname="+nickname+"&content="+content;
	  $.ajax({
			type : "post",
			url : "${path}/review_servlet/comment_add.do",
			data : param,
			success : function(res){
				$("#nickname"+j).val("");
				$("#com_content"+j).val("");
				showcomment(num,j);
			}
		});
  }
</script>
<style type="text/css">
.comment{
width: 100%;
display: none;}
/* 주문하기 모달창 */
.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.7); top:0; left:0; 
  display:none;
}
.close_modal{
text-align: right; 
cursor: pointer;
font-size: 40px;
color: white;
padding-right: 20px;
font-weight: lighter;
display: inline;
float: right;
}
.close_modal2{
text-align: right; 
cursor: pointer;
font-size: 20px;
display: inline;
float: right;
}
.review_content{
  width:550px; height:840px;
  background:#fff; 
  position:relative; top:50%; left:50%;
  margin-top:-420px; margin-left:-275px;
  text-align:left;
  box-sizing:border-box; padding:0px;
  line-height:23px; 
}
.modal_content{
  width:500px; height:800px;
  position:relative; top:50%; left:50%;
  margin-top:-400px; margin-left:-250px;
  text-align:left;
  box-sizing:border-box; padding:0px;
  line-height:23px; 
}
.modal_content img{
width: 100%;
height: 100%;}
#myreview{
margin-top: 10px;
width: 100%;
border-top: 2px solid #222;
border-bottom: 2px solid #222;
font-size: 15px;}
#myreview .p{
padding: 5px;}
#reviewtable{
padding: 20px;
width: 100%;
}
#reviewtable td{
padding: 7px;}
#reviewstar input[type=radio]{
display: none;}
#reviewstar label{
font-size: 1.5em;
color: transparent;
text-shadow: 0 0 0 #f0f0f0;
}
#reviewstar label:hover{
text-shadow: 0 0 0 #a18672;}
#reviewstar label:hover ~ label{
 text-shadow: 0 0 0 #a18672;
}
#reviewstar input[type=radio]:checked ~ label{
text-shadow: 0 0 0 #a18672;
}
#reviewContents {
    width: 100%;
    height: 200px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
#image_container{
width: 100%;
height: 100px;
padding: 10px;
border: solid 1.5px #D3D3D3;}
#reviewtitle{
font-size: 15px;
background: #333;
width: 100%;
margin: 0px;
padding: 12px;
color: white;
}
#commenttable{
width: 100%; border-radius: 10px; background:#f7f9f8; padding: 10px; margin-top: 10px;}
#btnSave {
padding: 10px;
width: 200px;
border: 2px solid #222;
background: white;
border-radius: 7px;
font-weight: bold;}
#btnDelete{
padding: 10px;
width: 200px;
color: white;
background: #222;
border-radius: 7px;
font-weight: bold;
}
</style>
</head>
<body>
<div style="font-size: 20px;">REVIEW | 전체 리뷰</div>
<input type="hidden" value="${count }" id="count2">
<table id="myreview">
<tr>
<td>
<input id="keyword" name="keyword" placeholder="리뷰 키워드 또는 상품명 검색">
<button id="btnSearch" onclick="search()">검색</button>
</td>

<c:forEach var="re" items="${list }" varStatus="vs">
<tr>
<td colspan="3"><hr></td>
</tr>
<tr>
<td class="p"style="font-size: 20px; color: #a18672;">
<c:forEach var="i" begin="1" end="${re.review_star }">★</c:forEach>
${re.title }</td>
<td>${re.reg_date }</td>
<td rowspan="3" style="border-left: 1px solid #c8c9ca;padding-left: 20px;width: 25%;">
<input type="hidden" id="num2${vs.index }" value="${re.num }" > 
<div id="username2${vs.index }"></div> 님의 리뷰입니다.<p>
<table id="review_mini">
<tr>
<th>연령대</th><td>${re.age }</td>
</tr><tr>
<th>성별</th><td>${re.gender }</td>
</tr><tr>
<th>회원등급</th><td> FAMILY</td>
</tr><tr>
<th>용량</th><td>${re.itemsDTO.volume }ml</td>
</tr>
</table>
</td>
</tr>
<tr>
<td class="p" style="font-weight: bold;">
<img alt="" src="image/${re.itemsDTO.picture }" style="width:70px; height:70px;">
${re.itemsDTO.iname }</td>
</tr>
<tr>
<td class="p">${re.content }</td>
</tr>
<tr>
<td class="p">
 <c:if test="${re.image_file != ' '}">
<img src="image/${re.image_file }" onclick="showmodal(${vs.index})" 
style="width:100px; height:100px; border-radius:10px; cursor: pointer;"></c:if>
<!--이미지 모달창  -->
<div id="modalid${vs.index }" class="modal">
 <div class="close_modal">X</div>
 <div class="modal_content">
 <img src="image/${re.image_file }">
 </div>
</div>
</td>
</tr>
<tr>
<td class="p"><a href="#" onclick="showcomment('${re.num}','${vs.index }'); return false;"> 댓글 <i class="fa-solid fa-angle-down"></i> 
<c:if test="${re.comment_count > 0}">
<span style="font-weight: bold;">(${re.comment_count})</span>
</c:if>
</a></td>
</tr>
<tr>
<td colspan="2">

<div class="comment" id="comment${vs.index }">
<!-- 댓글 쓰기 폼 -->
<div id="commentList${vs.index }"></div>
<table id="commenttable">
 <tr>
  <td><input id="nickname${vs.index }" placeholder="닉네임">
  <button onclick="insertcomment('${re.num}','${vs.index }')" type="button" style="width:50px;">확인</button></td>
 </tr>
 <tr>
  <td><textarea rows="3" cols="120" placeholder="내용을 입력하세요" 
  id="com_content${vs.index }"></textarea></td>
 </tr>
</table>
</div>


</td>
</tr>
<tr>
<td><button onclick="modifyreview(${vs.index})">수정</button></td>
</tr>
<tr>
<td>
    <!-- 모달창 -->
    <div id="modify${vs.index }" class="modal">
  	<div class="review_content">
  	<div id="reviewtitle">후기 남기기
    <div class="close_modal2">X</div>
  	</div>
  	<!--폼영역  -->
     <form name="form${vs.index }" id="form${vs.index }"enctype="multipart/form-data" 
      method="post">
      <table id="reviewtable">
      <tr>
      <td colspan="2"><img src="image/${re.itemsDTO.picture  }" style="width: 70px;height: 70px;">
      <b>${re.itemsDTO.iname  }</b>
      <input type="hidden" id="hid_num" name="num" value="${re.num }">
      <input type="hidden" id="hid_index" value="${vs.index}">
      </td>
      </tr>
      <tr>
      <td colspan="2"><hr></td>
      </tr>
      <tr>
      <td colspan="2">
      <div id="reviewstar">
      <input type="radio" class="reviewStar"name="reviewStar" value="5" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" class="reviewStar"name="reviewStar" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" class="reviewStar"name="reviewStar" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" class="reviewStar"name="reviewStar" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" class="reviewStar"name="reviewStar" value="1" id="rate5"><label
			for="rate5">★</label>
		  </div></td></tr><tr>
       <td colspan="2"><input  id="title" name="title" size="40"value="${re.title }"></td>
      </tr>
       <tr>
       <td>연령대 <select name="age" class="age">
        <option value="10대">10대</option>
        <option value="20대">20대</option>
        <option value="30대">30대</option>
        <option value="40대">40대</option>
        <option value="50대">50대</option>
       </select></td>
       <td>성별
        <input type="radio" class="gender" name="gender" value="woman" ><label for = "woman">여</label>
        <input type="radio" class="gender" name="gender" value="man" ><label for = "man">남</label>
       </td>
       <td>
       <input type="hidden" id="hid_age" value="${re.age }">
       <input type="hidden" id="hid_reviewstar" value="${re.review_star }">
       <input type="hidden" id="hid_gender" value="${re.gender }">
       </td>
       </tr>
       <tr>
       <td colspan="2">
       <textarea id="reviewContents" name="content" >${re.content }</textarea></td>
       </tr>
       <tr>
       <td style="width:100%;" colspan="2">
       <c:if test="${re.image_file != ' '}">
       ${re.image_file} <input type="checkbox" name="fileDel">첨부파일 삭제
    	</c:if>
       <input type="file" id = "image" name="image" style="width:50%;" onchange="setThumbnail(event);"/>
       </td></tr><tr><td colspan="2">
       <div id="image_container">
       <c:if test="${re.image_file != ' '}">
       <img src="image/${re.image_file }" style="width:80px;height:80px;"></c:if>
       </div>
       </td>
       </tr>
       <tr>
  		<td colspan="2" align="center">
   		<input type="button" value="수정" id="btnSave" onclick="modify('${vs.index }')">
   		<input type="button" value="삭제" id="btnDelete" onclick="deletereview('${vs.index }')">
  		</td>
  		</tr>
      </table>
     </form>
    </div>
    </div>
    </td>
</tr>
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
</body>
</html>