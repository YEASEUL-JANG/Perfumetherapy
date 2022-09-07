<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="session_check.jsp" %>
<html>
 <head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 페이지</title>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp" %>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico.png" />
<link href="../Resources/css/admin.styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script type="text/javascript">
window.addEventListener('DOMContentLoaded', event => {
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});
$(function(){
	dashboard();
});
function table(curPage){
	var searchkey=$("#searchkey").val();
	var search=$("#search").val();
	var param="curPage="+curPage;
	if(searchkey != null){
		param= "curPage="+curPage+"&searchkey="+searchkey+"&search="+search;
	}
	$.ajax({
		type: "post",
		url: "${path}/item_servlet/table.do",
		dataType: "html",
		data: param,
		success: function(result){
			 $("#insert").children().remove();
			$("#insert").html(result);
			$("#insert2").html("");
		}
	});
	
}
function table2(page){
	$.ajax({
		type : "post",
		url : "${path}/order_servlet/adminOrder.do",
		data : {curPage:page},
		success : function(res){
			$("#insert").children().remove();
			$("#insert").html(res);
			$("#view").html("");
			$("#insert2").html("");
		}
	});
}
function gb_search(){
	var formdata= $("#form1").serialize();
	$.ajax({
		type: "post",
		url: "${path}/item_servlet/table.do",
		dataType: "html",
		data: formdata,
		success: function(result){
			 $("#insert").children().remove();
			$("#insert").html(result);
			$("#insert2").html("");
		}
	});
}
function add_item(){
	$.ajax({
		type: "post",
		url: "item_add.jsp",
		dataType: "html",
		success: function(result){
			 $("#insert").children().remove();
			$("#insert").html(result);
			$("#insert2").html("");
		}
	});
}
function view(idx){
	var param = "idx="+idx;
	$.ajax({
		type: "post",
		url: "${path}/item_servlet/view.do",
		dataType: "html",
		data: param,
		success: function(result){
			 $("#insert").children().remove();
			$("#insert").html(result);
			$("#insert2").html("");
		}
	});
}
function allorder(){
	$.ajax({
		type : "post",
		url : "${path}/order_servlet/adminOrder.do",
		success : function(res){
			$("#insert").children().remove();
			$("#insert").html(res);
			$("#view").html("");
			$("#insert2").html("");
		}
	});
}
function Orderstate(index){
	var i = index;
	var orderid = $("#hid_orderid"+i).val();
	var orderstate = $("#order_state"+i).val();
	$.ajax({
		type : "post",
		data : {orderid : orderid,
			delivery:orderstate},
		url : "${path}/order_servlet/changeState.do",
		success : function(){
			alert("["+orderid+"] 주문건이 "+orderstate+"으로 변경되었습니다.");
			allorder();
		}
	});
}
function orderback(){
	$.ajax({
		type : "post",
		url : "${path}/order_servlet/adminOrderBack.do",
		success : function(res){
			$("#insert2").html("");
			$("#insert").children().remove();
			$("#insert").html(res);
			$("#view").html("");
		}
	});
}
function orderreturn(){
	$.ajax({
		type : "post",
		url : "${path}/order_servlet/adminOrderReturn.do",
		success : function(res){
			$("#insert2").html("");
			$("#insert").children().remove();
			$("#insert").html(res);
			$("#view").html("");
		}
	});
}
function reviewlist(){
	$.ajax({
		type : "post",
		url : "${path}/review_servlet/allReview.do",
		success : function(res){
			$("#insert").html("");
			$("#insert2").html(res);
		}
	});
}
function list(page){
	$.ajax({
		type : "post",
		url : "${path}/review_servlet/allReview.do",
		data : {curPage:page},
		success : function(res){
			$("#insert2").children().remove();
			$("#insert2").html(res);
		}
	});
}
function qna(){
	$.ajax({
		type : "post",
		url : "${path}/qna_servlet/qnalist.do",
		success : function(res){
			$("#insert").html("");
			$("#insert2").children().remove();
			$("#insert2").html(res);
			
		}
	});
}
function table3(page){
	$.ajax({
		type : "post",
		url : "${path}/qna_servlet/qnalist.do",
		data : {curPage:page},
		success : function(res){
			$("#insert").html("");
			$("#insert2").children().remove();
			$("#insert2").html(res);
		}
	});
}
function category(){
	var category= $("#category_option").val();
	$.ajax({
		type : "post",
		data : {category:category},
		url : "${path}/qna_servlet/qnacategory.do",
		success : function(res){
			$("#insert2").html(res);
			$("#category_option").val(category).prop("selected",true);
		}
	});
}
function dashboard(){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/dashboard.do",
		success : function(res){
			$("#insert").html(res);
			$("#insert2").html("");
			
		}
	});
}
function table4(page){
	$.ajax({
		type : "post",
		url : "${path}/item_servlet/dashboard.do",
		data : {curPage:page},
		success : function(res){
			$("#insert").html("");
			$("#insert2").html(res);
		}
	});
}
</script>
<style type="text/css">
*{font-family: 'Noto Serif KR', serif;}
.nav-link:link{text-decoration: none; color: #6E6E6E;}
.nav-link:visited{text-decoration: none; color: #6E6E6E;}
.nav-link:hover{text-decoration: none; color: #6E6E6E;}
.btnlink:link{text-decoration: none; color: #6E6E6E;}
.btnlink:visited{text-decoration: none; color: #6E6E6E;}
.btnlink:hover{text-decoration: none; color: #6E6E6E;}
</style>
</head>
 <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand sb-sidenav-light">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="#" onclick="dashboard()">Perfumetherapy</a>
            <!-- Sidebar Toggle-->
            <button class="btn btnlink btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!" >
            <i class="fas fa-bars"></i></button>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" class="menu" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown" >
                        <li><a class="dropdown-item" href="${path }/myweb/index.jsp">mall</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#" onclick="location.href='${path}/user_servlet/logout.do'">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
 <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="#" onclick="dashboard()">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                상품관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#" onclick="table('1')" >전체 상품list</a>
                                    <a class="nav-link" href="#" onclick="add_item()">상품추가</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                주문 및 리뷰
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        주문현황
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="#" onclick="allorder()">전체주문현황</a>
                                            <a class="nav-link" href="#" onclick="orderback()">주문취소</a>
                                            <a class="nav-link" href="#" onclick="orderreturn()">반품신청</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        리뷰관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="#" onclick="reviewlist()">고객리뷰</a>
                                            <a class="nav-link" href="#" onclick="qna()">QnA게시판</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Perfumetherapy Admin
                    </div>
                </nav>
            </div>
          
            
           <div id="layoutSidenav_content" style="display: block;">
          <div id="insert" style="width:100%;"></div>
          <div id="insert2" style="width:100%; padding: 30px;"></div>
      </div><!--내용페이지  -->
   </div><!-- 전체페이지 -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
 <script src="../Resources/js/scripts.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../Resources/assets/demo/chart-area-demo.js"></script>
        <script src="../Resources/assets/demo/chart-bar-demo.js"></script>
        <script src="../Resources/assets/demo/chart-pie-demo.js"></script>      
</body>
</html>