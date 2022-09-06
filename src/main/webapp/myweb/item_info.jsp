<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 페이지</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp" %>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico.png" />
<link href="../Resources/css/admin.styles.css" rel="stylesheet" />
<style type="text/css">
#image_container img{
height: 450px;
}
#addtable{
height: 500px;
font-size: 15px;}
#addtable th{
width:100px;
}
#update, #delete{
width:170px;
background: white;
height: 40px;
font-weight: bold;
border-radius: 10px;
margin: 10px;
}
</style>
</head>
<script type="text/javascript">
function updateItem(){
if(confirm("정보를 수정하시겠습니까?")){
 var fileCheck = document.getElementById("picture").value;
 if(!fileCheck){
	 alert("사진을 첨부하세요."); return;
 }
 document.form1.action="${path}/item_servlet/update.do";
 document.form1.submit();
 alert("수정이 완료되었습니다.");
 }
}

function deleteItem(){
	if(confirm("정말 삭제하시겠습니까?")){
 	 document.form1.action="${path}/item_servlet/delete.do";
	 document.form1.submit();
	 alert("삭제 완료되었습니다.");
	}
}
function setThumbnail(event) {
    var reader = new FileReader();
    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      document.querySelector("div#image_container").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
  }
$(function(){
	var big_category = $("#h_big_category").val();
	var category = $("#h_category").val();
	$("#big_category").val(big_category).prop("selected",true);
	$("#category").val(category).prop("selected",true);
});
</script>
</head>
<body>

<main>
<div class="container-fluid px-4" >
<h2 class="mt-4 fw-bold">상품 수정하기</h2>
<div class="card mb-4 mt-4">
 <div class="card-body fw-normal">
  <b><a href="#" onclick="table('1')"><i class="fa-solid fa-angles-left"></i> 목록으로 돌아가기</a></b>
  </div>
 </div>
<div class="card mb-4 mt-4 bg-light">
<div class="card-header fw-bold mt-4">
<i class="fas fa-table me-1"></i>
 Product Information
</div>
<div class="card-body px-4 py-4">
<form name="form1" id="form1" method="post">
<table id="addtable">
 <tr>
 <th>*상품명</th>
 <td><input id="iname" name="iname" size="28" value="${dto.iname }"></td>
 <td rowspan="11"><div id="image_container"></div></td>
 </tr><tr>
 <th>*카테고리</th>
 <td>
 <select id="big_category" name="big_category" >
    <option value="0" selected="selected">대분류 선택</option>
    <option value="woman">Woman</option>
    <option value="man">Man</option>
 </select>
 >
 <select id="category" name="category">
    <option value="0">중분류 선택</option>
    <option value="green" class="c-woman">시트러스|그린</option>
    <option value="pink" class="c-woman">플로럴|화이트플로럴</option>
    <option value="white" class="c-woman">머스크|앰버</option>
    <option value="gold" class="c-woman">스위트|바닐라</option>
    <option value="brown" class="c-man">우디|베티버</option>
    <option value="red" class="c-man">웜스파이시|통카빈</option>
    <option value="white" class="c-man">머스크|앰버</option>
    <option value="purple" class="c-man">라벤더|워터리</option>
 </select>
</td>
 </tr>
 <tr>
 <th>*이미지</th>
 <td><img src="image/${dto.picture }" style="width:70px;height:70px;">
 <input type="file" accept="image/*" onchange="setThumbnail(event);" id="picture" name="picture" ></td>
 </tr><tr>
 <th>*브랜드</th>
 <td><input id="brand" name="brand" size="28" value="${dto.brand }" >
 </td>
 </tr><tr>
 <th>*원가</th>
 <td><input id="o_price" name="o_price" size="28" value="${dto.o_price }" ></td>
 </tr><tr>
 <th>*할인가</th>
 <td><input id="sale_price" name="sale_price" size="28" value="${dto.sale_price }"></td>
 </tr><tr>
 <th>*재고</th>
 <td><input id="stock" name="stock" size="28" value="${dto.stock }"></td>
 </tr><tr>
 <th>*적립금(1%)</th>
 <td><input id="point" name="point" size="28" value="${dto.point }"></td>
 </tr><tr>
 <th>*용량(ml)</th>
 <td><input id="volume" name="volume" size="28" value="${dto.volume }"></td>
 </tr><tr>
 <th>*메모</th>
 <td><textarea rows="5" cols="30" id="memo" name="memo">${dto.memo }</textarea></td>
 </tr>
 <tr></tr>
 <tr><td colspan="2" align="left">
 <input type="button" value="수정" id="update" onclick="updateItem()">
 <input type="button" value="삭제"  id="delete" onclick="deleteItem()"></td></tr>
 <tr><td ><input type="hidden" id="h_big_category" value="${dto.big_category }"></td></tr>
 <tr><td><input type="hidden" id="h_category" value="${dto.category }"></td></tr>
 <tr><td><input type="hidden" name="idx" id="idx" value="${dto.idx}"></td></tr>
</table>
</form>
</div>
</div>
</div>
</main>
</body>
</html>