<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<style type="text/css">
button{ position:absolute; top:50%; left:50%;
  width:120px; height:30px; margin-top:-15px; margin-left:-60px;
  line-height:15px; cursor:pointer;
}

.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.5); top:0; left:0; display:none;
}

.modal_content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}
</style>
<script type="text/javascript">
$(function(){ 
	  $("button").click(function(){
	    $(".modal").fadeIn();
	  });
	  
	  $(".close_modal").click(function(){
	    $(".modal").fadeOut();
	  });
	  
	});
</script>
</head>
<body>
 <button>모달창</button>
 
    <div class="modal">
  	<div class="modal_content">
  	<div class="close_modal"> x</div>
    여기에 모달창 내용을 적어줍니다.<br>
    이미지여도 좋고 글이어도 좋습니다.
  	 </div>
	</div>
</body>
</html>