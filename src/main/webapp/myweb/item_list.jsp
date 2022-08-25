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
</style>
<script type="text/javascript">

</script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico" />
<link href="../Resources/css/styles.css" rel="stylesheet" />
</head>
  <body>
    <!-- 컨텐츠페이지-->
    총 상품수 : ${count }<br>
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
                                <span class="text-muted text-decoration-line-through">${item.o_price }</span>&nbsp;${item.sale_price }
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