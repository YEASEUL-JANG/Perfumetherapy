<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>navbar</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp" %>
<!-- Favicon-->
<link href="../Resources/css/styles.css" rel="stylesheet" />
<script type="text/javascript">
$(function(){
	if(${sessionScope.userid != null}){//세션아이디가 있으면
	    $("#loginli").hide();
		$("#joinli").hide();
		$("#logoutli").show();
	}else{//세션아이디가 없으면
		$("#loginli").show();
		$("#joinli").show();
		$("#logoutli").hide();
	}
	cartnum();
});
function cartnum(){
	$.ajax({
		type : "post",
		url : "${path}/order_servlet/cartnum.do",
		success : function(result){
			$("#cartnum").html(result);
		}
	});
}
function mypage(){//마이페이지 클릭 시
	if(${sessionScope.userid != null}){
		location.href="${path}/order_servlet/mypage.do";
	}else{
		location.href="mypage.jsp";
	}
}
</script>
</head>
    <!-- 메뉴바-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="index.jsp">Perfumetherapy</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="#!">Best 12</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">9월 신상</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">For Her</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="${path }/myweb/list.jsp?category=all">All Products</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list.jsp?category=green">시트러스|그린</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list.jsp?category=pink">플로럴|화이트플로럴</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list.jsp?category=white">머스크|앰버</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list.jsp?category=gold">스위트|바닐라</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">For Him</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">All Products</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="#!">시트러스|그린</a></li>
                            <li><a class="dropdown-item" href="#!">우디|베티버</a></li>
                            <li><a class="dropdown-item" href="#!">웜스파이시|통카빈</a></li>
                            <li><a class="dropdown-item" href="#!">머스크|앰버</a></li>
                        </ul>
                    </li>
                     <li class="nav-item"><a class="nav-link" href="#!">브랜드별</a></li>
                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="${path }/myweb/review.jsp">고객리뷰</a></li>
                        <li class="nav-item"><a class="nav-link" href="${path }/myweb/qna.jsp">Q&A</a></li>
                        <li class="nav-item dropdown">
                         <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-user"></i></a>
                          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li id="loginli"><a class="dropdown-item" href="${path }/myweb/login.jsp">로그인</a></li>
                            <li id="joinli"><a class="dropdown-item" href="${path }/myweb/join.jsp">회원가입</a></li>
                            <li id="logoutli"><a class="dropdown-item" href="#" onclick="location.href='${path}/user_servlet/logout.do'">로그아웃</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/cart.jsp">장바구니</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/orderlist.jsp">주문조회</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/mypage.jsp">마이페이지</a></li>
                       	  </ul>
                   		 </li>
                    </ul>
                    <button class="btn btn-outline-dark" onclick="location.href='${path }/myweb/cart.jsp';">
                        <i class="fa-solid fa-cart-shopping"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill"><div id="cartnum"></div></span>
                    </button>
                
                <form name = "mypageform" method="post">
                 <input type="hidden" value="${sessionScope.userid }" id="id" name="id">
                </form>
            </div>
        </div>
    </nav>
</html>