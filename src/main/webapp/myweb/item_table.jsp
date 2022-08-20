<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>전체 상품조회</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<script src="../include/jquery-3.3.1.min.js"></script>
 <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp" %>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico" />
<link href="../Resources/css/admin.styles.css" rel="stylesheet" />
</head>
<body>
<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h2 class="mt-4 fw-bold">전체 상품조회</h2>
                        <div class="card mb-4 mt-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                            </div>
                        </div>
                    </div>
                </main>
  <main>
      <div class="container-fluid px-4">
          <div class="card mb-4">
              <div class="card-header fw-bold">
                  <i class="fas fa-table me-1"></i>
                  Product Table
              </div>
              <div class="card-body">
				
전체 상품 : ${count }개
 
<form name="form1" id="form1" method="post">
 <select name="searchkey" id="searchkey">
<c:choose>
  <c:when test="${searchkey=='iname' }">
 	<option value="iname" selected>상품명</option>
 	<option value="brand">브랜드</option>
 	<option value="big_category">대분류</option>
 	<option value="category">중분류</option>
 </c:when> 
 <c:when test="${searchkey=='brand' }">
 	<option value="iname" >상품명</option>
 	<option value="brand" selected>브랜드</option>
 	<option value="big_category">대분류</option>
 	<option value="category">중분류</option>
 </c:when> 
 <c:when test="${searchkey=='big_category' }">
 	<option value="iname" >상품명</option>
 	<option value="brand" >브랜드</option>
 	<option value="big_category" selected>대분류</option>
 	<option value="category">중분류</option>
 </c:when> 
 <c:when test="${searchkey=='category' }">
 	<option value="iname" >상품명</option>
 	<option value="brand" >브랜드</option>
 	<option value="big_category" >대분류</option>
 	<option value="category" selected>중분류</option>
 </c:when> 
 </c:choose> 
 </select>
 <input name="search" id="search" value="${search }">
 <input type="button" value="조회" onclick="gb_search()">
</form>

<table id="datatablesSimple" style="width:100%">
<thead>
 <tr>
 <th>IDX</th>
 <th>이미지</th>
 <th>상품명</th>
 <th>브랜드</th>
 <th>용량</th>
 <th>원가</th>
 <th>할인가</th>
 <th>적립금</th>
 <th>대분류</th>
 <th>중분류</th>
 <th>재고</th>
 <th>게시일자</th>
 </tr>
 </thead>
 <c:forEach var = "item" items="${list }">
  <tbody>
  <tr>
   <td>${item.idx }</td>
   <td><img src="image/${item.picture }" style="width:50px;height:50px;"></td>
   <td><a href="#" onclick="view('${item.idx }')">${item.iname }</a></td>
   <td>${item.brand }</td>
   <td>${item.volume }</td>
   <td>${item.o_price }</td>
   <td>${item.sale_price }</td>
   <td>${item.point }</td>
   <td>${item.big_category }</td>
   <td>${item.category }</td>
   <td>${item.stock }</td>
   <td>${item.post_date }</td>
  </tr>
  </tbody>
 </c:forEach>
 <!-- 페이지 네비게이션 -->
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
</main>
  
  
   <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
  
 <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
</body>
</html>