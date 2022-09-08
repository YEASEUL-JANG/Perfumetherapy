<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Bare - Start Bootstrap Template</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<%@ include file="../include/header.jsp" %>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<style type="text/css">
.jb-wrap{
position: relative;}
.jb-text{
width: 150px;
position: absolute;
top: 50%;
left: 50%;
transform: translate( -50%, -50% );
visibility: hidden;
}
.jb-wrap:hover img{
opacity: 0.5;
}
.jb-wrap:hover .jb-text{
visibility: visible;
opacity: 1!important;}
#cate{
width: 100%;
display: flex;
justify-content: right;}
#cate li{
float: left;
margin: 8px;
}
#lookingfor_item{
border: 3px solid #f0f0f0;
padding: 50px;
align-items: center;
margin: 30px 0px;
width: 100%;}
#btnlookfor{
background: #222;
border-radius: 5px;
padding: 7px;
width: 150px;
color: white;
font-size: 14px;
margin-top: 30px;
}
#pagenav a:link{text-decoration: none; color:#959595; }
#pagenav a:visited{text-decoration: none; color:#959595; }
#pagenav a:hover{text-decoration: none; color:#836e53; font-weight: bold;}
#cate a:link{text-decoration: none; color:#959595; }
#cate a:visited{text-decoration: none; color:#959595; }
#cate a:hover{text-decoration: none; color:#836e53; font-weight: bold;}
</style>
<script type="text/javascript">
$(function(){
	let start_price = "${start_price}";
	let end_price = "${end_price}";
	let big_category = "${big_category}";
	let category = "${category}";
	let keyword = "${keyword}";
	if(start_price != 0){
		$("#start_price").val(start_price);
	}
	if(end_price != 1000000){
		$("#end_price").val(end_price);
	}
	if(big_category != ""){
		$("#big_category").val(big_category).prop("selected",true);
	}
	if(category != ""){
		$("#category").val(category).prop("selected",true);
	}
});
var cat = false;
function update_selected() {
  $("#category").val('n');
  $("#category").find("option[value!='n']").detach();
  $("#category").append(cat.filter(".c-" + $(this).val()));
}
$(function(){
	cat = $("#category").find("option[value!='n']");
	cat.detach();
  $("#big_category").change(update_selected);
  $("#big_category").trigger("change");
});
</script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico" />
<link href="../Resources/css/styles.css" rel="stylesheet" />
</head>
  <body>
    <!-- 컨텐츠페이지-->
 <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
                <!--검색조건창  -->
   <div id="lookingfor_item" align="center">
    <table id="lookfor"  >
     <tr>
      <th>상품분류</th>
      <td>
       <select id="big_category" name="big_category" size="4" style="width: 130px;  display: inline;">
        <option value="n" selected>==대분류 선택==</option>
        <option value="all">All</option>
        <option value="woman">For Her</option>
        <option value="man">For Him</option>
       </select> > 
        <select id="category" name="category" size="4" style="width: 180px; display: inline;text-align: center;">
          <option value="n" selected>====중분류 선택====</option>
         <option value="all" class="c-woman c-man c-all">All</option>
         <option value="green" class="c-woman c-all">시트러스|그린</option>
         <option value="pink" class="c-woman c-all">플로럴|화이트플로럴</option>
         <option value="white" class="c-woman c-all">머스크|앰버</option>
         <option value="gold" class="c-woman c-all">스위트|바닐라</option>
         <option value="green" class="c-man">시트러스|그린</option>
         <option value="brown" class="c-man c-all">우디|베티버</option>
         <option value="red" class="c-man c-all">웜스파이시|통카빈</option>
         <option value="white" class="c-man">머스크|앰버</option>
       </select>
      </td>
     </tr>
     <tr>
      <th>검색키워드</th>
      <td><input name="keyword" id="keyword" value="${keyword }" style="width: 100%;"></td>
     </tr>
     <tr>
     <th>판매가격대</th>
     <td><input id="start_price" name="start_price" >~<input id="end_price" name="end_price" >원</td>
     </tr>
     <tr>
     <td colspan="2" align="center"><input type="button" id="btnlookfor" value="검색" 
     onclick="itemlookfor()"></td>
     </tr>
    </table>
   </div>
   
 <!--카테고리  -->
 <div id="cate" >
 <ul style="list-style: none">
  <li><a href="#" onclick="cat_name()"> 상품명 </a></li>
  <li> | </li>
  <li><a href="#" onclick="cat_new()"> 신상품 </a></li>
  <li> | </li>
  <li><a href="#" onclick="cat_lower()">낮은가격 </a></li>
  <li> | </li>
  <li><a href="#" onclick="cat_higher()"> 높은가격 </a></li>
 </ul>
 </div>
  <div style="color: #5a3e19; font-size: 15px;">총 ${count }개의 상품이 검색되었습니다.</div>
 </div>
 </section>
 <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">   
                
                <!-- 상품 -->
                <c:forEach var="item" items="${list}">
              <div class="col mb-5">
                    <div class="card h-100">
                        <!-- 상품이미지-->
                        <div class="jb-wrap">
                        <a href="#" onclick="detailview('${item.idx }')" >
                        <img class="card-img-top" src="image/${item.picture }" /></a>
                        <div class="p-4 jb-text text-center">
                            <a class="btn btn-outline-dark mt-auto" href="#" onclick="likeit(${item.idx})">
                            <i class="fa-brands fa-gratipay"></i> Like it!</a>
                        </div>
                        </div>
                        <!-- 상품디테일-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- 상품이름-->
                                <h6 class="fw-bolder">${item.iname }</h6>
                                <!-- 상품가격-->
                                <span class="text-muted text-decoration-line-through">
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${item.o_price }"/>원
                                </span>&nbsp;
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${item.sale_price }"/>원
                                <div class="item_sub">${item.memo }</div>
                            </div>
                        </div>
                        <!-- Product actions-->
                        
                    </div>
                </div>
               </c:forEach> 
<!-- 페이지 네비게이션 -->
<div id="pagenav" style="width:100%;" align="center">
   <table>
   <tr>
  <td colspan="12" align="center">
   <c:if test="${page.curPage > 1}">
    <a href="#" onclick="table('1')">[처음]</a>
   </c:if>
   <c:if test="${page.curBlock > 1}">
    <a href="#" onclick="table('${page.prevPage}')">[이전]</a>
   </c:if>
   <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
    <c:choose>
     <c:when test="${num == page.curPage}">
      <span style="color: red;">${num}</span>
     </c:when>
     <c:otherwise>
      <a href="#" onclick="table('${num}')">${num}</a>
     </c:otherwise>
    </c:choose>
   </c:forEach>
   <c:if test="${page.curBlock < page.totBlock}">
    <a href="#" onclick="table('${page.nextPage}')">[다음]</a>
   </c:if>
   <c:if test="${page.curPage < page.totPage}">
    <a href="#" onclick="table('${page.totPage}')">[끝]</a>
   </c:if>
  </td>
 </tr>
</table>    
</div>           
                </div>
            </div>
    </section> 
 </body>
</html>