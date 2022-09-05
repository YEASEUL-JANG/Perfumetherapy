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
<script type="text/javascript">
function viewdetail(orderid){
	 const key = orderid;
	$.ajax({
		type : "post",
		data : {orderid : key},
		url : "${path}/order_servlet/adminDetailOrder.do",
		success : function(res){
			$("#view").html(res);
		}
	});
}  

</script>
<style type="text/css">
#ordertable1{
width: 100%;
border: 1px solid #ddd;
color: #333;
font-size: 15px;
padding: 0px;
}
#ordertable1 th{
background: #fbfbfb;
padding: 15px;
border-bottom: 1px solid #ddd;
text-align: left;
}
#ordertable1 td{
padding: 15px;}
#ordertable1 a:link{text-decoration: none; color:#959595; }
#ordertable1 a:visited{text-decoration: none; color:#959595; }
#ordertable1 a:hover{text-decoration: underline; color:#836e53;}

</style>
</head>
<body>
 <main>
     <div class="container-fluid px-4">
         <h2 class="mt-4 fw-bold">전체 상품조회</h2>
         <div class="card mb-4 mt-4">
             <div class="card-body">
                  * 가장 최근 주문건부터 보여집니다.
             </div>
         </div>
     </div>
 </main>
  <main>
      <div class="container-fluid px-4">
          <div class="card mb-4">
              <div class="card-header fw-bold">
                  <i class="fas fa-table me-1"></i>
                  Order Table
              </div>
              <div class="card-body">
				
전체 상품 : ${count }개
  <!-- content -->
  <section class="py-5">
   <div class="justify-content-center flex-sm-column d-sm-flex align-items-center">
    <table id="ordertable1">
    <colgroup>
     <col width="20%">
     <col width="20%">
     <col width="20%">
     <col width="20%">
     <col width="20%">
    </colgroup>
    <tr>
    <th >주문일자[주문번호]</th>
    <th >주문일자</th>
    <th >결제 금액</th>
    <th >주문상태</th>
    <th >취소/반품</th>
    </tr>
    <c:forEach var="o" items="${list }">
    <tr>
    <td><a href="#" onclick="viewdetail('${o.orderid}')" >${o.orderid}</a></td>
    <td>${o.order_date}</td>
    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${o.sum_price }"/>원</td>
    <td class="deliveryState">${o.delivery }</td>
    <td>
    <select id="cancelOrder" name = "cancelOrder" onchange="cancelOrder('${o.delivery }','${o.orderid }')">
     <option value="" selected>==선택==</option>
     <option value="return">반품신청</option>
     <option value="cancel">취소요청</option>
    </select>
    </td>
	</tr>
    <input type ="hidden" id="hid_orderid" value="${o.orderid}">
	</c:forEach>
    
  

 <!-- 페이지 네비게이션 -->
 <tr>
  <td colspan="5" align="center">
   <c:if test="${page.curPage > 1}">
    <a href="#" onclick="table2('1')">[처음]</a>
   </c:if>
   <c:if test="${page.curBlock > 1}">
    <a href="#" onclick="table2('${page.prevPage}')">[이전]</a>
   </c:if>
   <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
    <c:choose>
     <c:when test="${num == page.curPage}">
      <span style="color: red;">${num}</span>
     </c:when>
     <c:otherwise>
      <a href="#" onclick="table2('${num}')">${num}</a>
     </c:otherwise>
    </c:choose>
   </c:forEach>
   <c:if test="${page.curBlock < page.totBlock}">
    <a href="#" onclick="table2('${page.nextPage}')">[다음]</a>
   </c:if>
   <c:if test="${page.curPage < page.totPage}">
    <a href="#" onclick="table2('${page.totPage}')">[끝]</a>
   </c:if>
  </td>
 </tr>
</table> 

<div id="view" style="width: 100%;"></div>

 
</div>    
 </section>
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
  
 <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
</body>
</html>