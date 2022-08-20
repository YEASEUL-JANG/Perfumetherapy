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
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico" />
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
#insert{
width:350px;
background: white;
height: 40px;
font-weight: bold;
border-radius: 10px;
margin-top: 10px;
}
</style>
<script type="text/javascript">
var cat = false;

function update_selected() {
  $("#category").val(0);
  $("#category").find("option[value!=0]").detach();

  $("#category").append(cat.filter(".c-" + $(this).val()));
}

$(function() {
	cat = $("#category").find("option[value!=0]");
	cat.detach();

  $("#big_category").change(update_selected);
  $("#big_category").trigger("change");
  
});

function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      document.querySelector("div#image_container").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
  }

function check(){
	let iname=$("#iname").val();
	let big_category=$("#big_category").val();
	let category=$("#category").val();
	let picture=$("#picture").val();
	let brand=$("#brand").val();
	let o_price=$("#o_price").val();
	let sale_price=$("#sale_price").val();
	let stock=$("#stock").val();
	let point=$("#point").val();
	let volume=$("#volume").val();
	let memo=$("#memo").val();
	 if(iname == ""){
		 alert("상품명을 입력하세요");
		 return;
	 }
	 if(big_category == 0){
		 alert("대분류를 선택하세요");
		 return;
	 }
	 if(category == 0){
		 alert("중분류를 선택하세요");
		 return;
	 }
	 if(picture == ""){
		 alert("사진을 등록하세요");
		 return;
	 }
	 if(brand == 0){
		 alert("브랜드를 선택하세요");
		 return;
	 }
	 if(o_price == ""){
		 alert("원가를 입력하세요");
		 return;
	 }
	 if(sale_price == ""){
		 alert("할인가를 입력하세요");
		 return;
	 }
	 if(stock == ""){
		 alert("재고를 입력하세요");
		 return;
	 }
	 if(point == ""){
		 alert("적립금을 입력하세요");
		 return;
	 }
	 if(volume == ""){
		 alert("용량을 입력하세요");
		 return;
	 }
	 if(memo == ""){
		 alert("메모를 입력하세요");
		 return;
	 }
	 
	if(confirm("상품을 등록하시겠습니까?")){
	document.input.action="${path}/item_servlet/insert.do";
	document.input.submit();
	alert("등록이 완료되었습니다.");
	}
}
</script>
</head>
<body>

<div id="layoutSidenav_content">
 <main>
     <div class="container-fluid px-4" >
         <h2 class="mt-4 fw-bold">상품 등록하기</h2>
         <div class="card mb-4 mt-4">
           <div class="card-body fw-normal">
            <b style="color:red;">*</b> 표시는 필수입력입니다.
            </div>
           </div>
         <div class="card mb-4 mt-4 bg-light">
          <div class="card-header">
                  <i class="fas fa-table me-1"></i>
                  Product Registration
              </div>
             <div class="card-body px-4 py-4">
               <form name="input" method="post" >
                 <table id="addtable" >
                  <tr>
                  <th>*상품명</th>
                  <td><input id="iname" name="iname" size="28" required></td>
                  <td rowspan="10"><div id="image_container"></div></td>
                  </tr><tr>
                  <th>*카테고리</th>
                  <td>
                  <select id="big_category" name="big_category" required>
                     <option value="0" selected="selected">대분류 선택</option>
                     <option value="woman">Woman</option>
                     <option value="man">Man</option>
                  </select>
                  >
                  <select id="category" name="category"required>
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
                  <td><input type="file" accept="image/*" 
                  onchange="setThumbnail(event);" id="picture" name="picture" required></td>
                  </tr><tr>
                  <th>*브랜드</th>
                  <td>
                  <select id="brand" name="brand" required>
                     <option value="0" selected>브랜드 선택</option>
                     <option value="구찌">구찌</option>
                     <option value="샤넬">샤넬</option>
                     <option value="딥티크">딥티크</option>
                     <option value="버버리">버버리</option>
                     <option value="메모">메모</option>
                     <option value="끌로에">끌로에</option>
                     <option value="에르메스">에르메스</option>
                     <option value="메종 마르지엘라">메종 마르지엘라</option>
                     <option value="로에베">로에베</option>
                     <option value="입생로랑">입생로랑</option>
                     <option value="불가리">불가리</option>
                  </select>
                  </td>
                  </tr><tr>
                  <th>*원가</th>
                  <td><input id="o_price" name="o_price" size="28" required></td>
                  </tr><tr>
                  <th>*할인가</th>
                  <td><input id="sale_price" name="sale_price" class="calc" size="28" required></td>
                  </tr><tr>
                  <th>*재고</th>
                  <td><input id="stock" name="stock" size="28" required></td>
                  </tr><tr>
                  <th>*적립금(1%)</th>
                  <td><input id="point" name="point" size="28" required></td>
                  </tr><tr>
                  <th>*용량(ml)</th>
                  <td><input id="volume" name="volume" size="28" required></td>
                  </tr><tr>
                  <th>*메모</th>
                  <td><textarea rows="5" cols="30" id="memo" name="memo" required></textarea></td>
                  </tr><tr>
                  </tr>
                  <tr><td colspan="2" align="center">
                 </td></tr>
                  <tr><td colspan="2"><input type="button" id="insert" value="등록" onclick="check()"></td></tr>
                 </table>
                </form>
             </div>
         </div>
     </div>
 </main>
</div>
</body>
</html>