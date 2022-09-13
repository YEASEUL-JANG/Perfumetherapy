<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>navbar</title>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp" %>
<!-- Favicon-->
<link href="../Resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
*{font-family: 'Noto Serif KR', serif;}
.modal{ 
  position:absolute; width:100%; height:100%; 
  background: rgba(255,255,255,0.8); top:0; left:0; 
  display:none;
}
.close_modal{
text-align: right; 
cursor: pointer;
font-size: 40px;
color: #333;
padding-right: 20px;
font-weight: lighter;
display: inline;
float: right;
}
.modal_content{
  width:600px; height:100px;
  position:relative; top:50%; left:50%;
  margin-top:-50px; margin-left:-300px;
  text-align:center;
  box-sizing:border-box; padding:0px;
  line-height:23px; 
}
.modal_content #s_item{
width: 80%;
font-size: 25px;
text-align: center;
display: inline;
background: none;
border: none;
padding: 15px;
border-radius: 25px;}
.modal_content a:link{text-decoration: none; color: #333; font-size: 30px;}
.modal_content a:visited{text-decoration: none; color: #333; font-size: 30px;}
.modal_content a:hover{text-decoration: none; color: #333; font-size: 30px;}
#s_text{
display: inline;
background: #e8e8e8;
font-size: 15px;
border-radius: 25px;
padding: 10px 20px;}
</style>
<script type="text/javascript">
$(function(){
	if(${sessionScope.userid != null}){//세션아이디가 있으면
		if(${sessionScope.userid == 'admin'}){
			$("#adminli").show();
			$("#loginli").hide();
			$("#joinli").hide();
			$("#logoutli").show();
			$("#cartli").hide();
			$("#orderli").hide();
			$("#mypageli").hide();
		}else{
		$("#adminli").hide();
	    $("#loginli").hide();
		$("#joinli").hide();
		$("#logoutli").show();
		}
	}else{//세션아이디가 없으면
		$("#loginli").show();
		$("#joinli").show();
		$("#logoutli").hide();
		$("#adminli").hide();
	}
	cartnum();
	
	//모달창 닫기
	$(".close_modal").click(function(){
		  $(".modal").fadeOut();
		 });
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
function showmodal(){
	$("#searchitem").fadeIn();
}
function itemsearch(){
	 const item = $("#s_item").val();
	 if(item == ''){
		 alert("찾으시는 키워드를 입력하세요"); return;
	 }
	 location.href="${path}/myweb/lookforitem.jsp?keyword="+item;
			 
}
</script>
</head>
    <!-- 메뉴바-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light" id="navbar">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="${path }/myweb/index.jsp">Perfumetherapy</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item dropdown">
                    <a class="nav-link active dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">About</a>
                      <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="${path }/myweb/about.jsp">Brand Story</a></li>
                        <li><a class="dropdown-item" href="${path }/myweb/map.jsp">오시는 길</a></li>
                       </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="${path }/myweb/best12.jsp">Best 12</a></li>
                    <li class="nav-item"><a class="nav-link" href="${path }/myweb/list_new.jsp">9월 신상</a></li>
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
                            <li><a class="dropdown-item" href="${path }/myweb/list2.jsp?category=all">All Products</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list2.jsp?category=green">시트러스|그린</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list2.jsp?category=brown">우디|베티버</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list2.jsp?category=red">웜스파이시|통카빈</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list2.jsp?category=white">머스크|앰버</a></li>
                        </ul>
                    </li>
                       <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">브랜드별</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="${path }/myweb/list3.jsp?brand=구찌">구찌</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list3.jsp?brand=샤넬">샤넬</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list3.jsp?brand=딥디크">딥디크</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list3.jsp?brand=메모">메모</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list3.jsp?brand=끌로에">끌로에</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list3.jsp?brand=에르메스">에르메스</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list3.jsp?brand=메종 마르지엘라">메종 마르지엘라</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list3.jsp?brand=로에베">로에베</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list3.jsp?brand=입생로랑">입생로랑</a></li>
                            <li><a class="dropdown-item" href="${path }/myweb/list3.jsp?brand=불가리">불가리</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="${path }/myweb/review.jsp">고객리뷰</a></li>
                        <li class="nav-item"><a class="nav-link" href="${path }/myweb/qna.jsp">Q&A</a></li>
                        <li class="nav-item"><a class="nav-link" href="#" onclick="showmodal()"><i class="fa-solid fa-magnifying-glass"></i></a></li>
                        <li class="nav-item dropdown">
                         <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-user"></i></a>
                          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li id="adminli"><a class="dropdown-item" href="${path }/myweb/admin.jsp">관리자페이지</a></li>
                            <li id="loginli"><a class="dropdown-item" href="${path }/myweb/login.jsp">로그인</a></li>
                            <li id="joinli"><a class="dropdown-item" href="${path }/myweb/join.jsp">회원가입</a></li>
                            <li id="logoutli"><a class="dropdown-item" href="#" onclick="location.href='${path}/user_servlet/logout.do'">로그아웃</a></li>
                            <li id="cartli"><a class="dropdown-item" href="${path }/myweb/cart.jsp">장바구니</a></li>
                            <li id="orderli"><a class="dropdown-item" href="${path }/myweb/orderlist.jsp">주문조회</a></li>
                            <li id="mypageli"><a class="dropdown-item" href="${path }/myweb/mypage.jsp">마이페이지</a></li>
                       	  </ul>
                   		 </li>
                    </ul>
                    <button class="btn btn-outline-dark" onclick="location.href='${path }/myweb/cart.jsp';">
                        <i class="fa-solid fa-cart-shopping"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill"><div id="cartnum"></div></span>
                    </button>
                <!--전체검색 모달창 -->
                <div id="searchitem" class="modal">
				 <div class="close_modal">X</div>
				 <div class="modal_content">
				   <form name="s_item" action="${path }/item_servlet/lookingforItem.do" method="post">
				    <input type="search" id="s_item" name="s_item"><a href="#" onclick="itemsearch()">
				     <i class="fa-solid fa-magnifying-glass"></i></a>
				    <hr><br>
				    <div id="s_text" align="center"># 찾으시는 상품을 검색하세요.</div>
				   </form>
				 </div>
				</div>
                
                <form name = "mypageform" method="post">
                 <input type="hidden" value="${sessionScope.userid }" id="id" name="id">
                </form>
            </div>
        </div>
    </nav>
</html>