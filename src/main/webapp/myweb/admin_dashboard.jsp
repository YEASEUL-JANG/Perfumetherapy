<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
</head>
<body>
    <main>
        <div class="container-fluid">
            <h1 class="mt-4">Dashboard</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">Dashboard</li>
            </ol>
            <div class="row">
                <div class="col-xl-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-area me-1"></i>
                            월 수익현황
                        </div>
                        <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>
                </div>
                <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        카테고리별 주문 수요
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
            </div>
 		</div>
 	</main>
     <main>
      <div class="container-fluid px-4">
          <div class="card mb-4">
              <div class="card-header fw-bold">
                  <i class="fas fa-table me-1"></i>
                  All itemlist
              </div>
              <div class="card-body">
전체 상품 : ${count }개
<table id="datatablesSimple" style="width:100%;margin-top: 20px;">
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
    <a href="#" onclick="table4('1'); return false;">[처음]</a>
   </c:if>
   <c:if test="${page.curBlock > 1}">
    <a href="#" onclick="table4('${page.prevPage}'); return false;">[이전]</a>
   </c:if>
   <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
    <c:choose>
     <c:when test="${num == page.curPage}">
      <span style="color: red;">${num}</span>
     </c:when>
     <c:otherwise>
      <a href="#" onclick="table4('${num}'); return false;">${num}</a>
     </c:otherwise>
    </c:choose>
   </c:forEach>
   <c:if test="${page.curBlock < page.totBlock}">
    <a href="#" onclick="table4('${page.nextPage}'); return false;">[다음]</a>
   </c:if>
   <c:if test="${page.curPage < page.totPage}">
    <a href="#" onclick="table4('${page.totPage}'); return false;">[끝]</a>
   </c:if>
  </td>
 </tr>
</table>      
</div>    
</div>
</div>
</main>   		
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../Resources/assets/demo/chart-area-demo.js"></script>
        <script src="../Resources/assets/demo/chart-bar-demo.js"></script>
        <script src="../Resources/assets/demo/chart-pie-demo.js"></script>           		
</body>
</html>