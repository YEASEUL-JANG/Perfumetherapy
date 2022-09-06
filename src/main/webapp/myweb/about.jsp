<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Perfumetheraphy</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp" %>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico.png" />
<link href="../Resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
.sa {
        opacity: 0;
        transition: all .5s ease;
      }

      /* 아래에서 위로 페이드 인 */
      .sa-up {
        transform: translate(0, 100px);
      }
}
 section {
        display: flex;
        justify-content: space-between;
        padding: 5%;
      }
      section div {
        background-color: #ff9800;
        width: 23%;
        height: 300px;
      }
        .sa.show {
        opacity: 1;
        transform: none;
      }
</style>
<script type="text/javascript">
const saTriggerMargin = 300;
const saElementList = document.querySelectorAll('.sa');

const saFunc = function() {
  for (const element of saElementList) {
    if (!element.classList.contains('show')) {
      if (window.innerHeight > element.getBoundingClientRect().top + saTriggerMargin) {
        element.classList.add('show');
      }
    }
  }
}

window.addEventListener('load', saFunc);
window.addEventListener('scroll', saFunc);
</script>
</head>
  <body>
  <!-- nav -->
  <header>
  <jsp:include page="navbar.jsp"></jsp:include>
  </header>
   
    <!-- 컨텐츠페이지-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
               <section>
        <div class="sa sa-up">디비전 1</div>
        <div class="sa sa-up">디비전 2</div>
        <div class="sa sa-up">디비전 3</div>
        <div class="sa sa-up">디비전 4</div>
      </section>
    
               
               
            </div>
    </section>
    
  <!-- Footer-->
  <footer>
  <jsp:include page="footer.jsp"></jsp:include>
  </footer>
    
 </body>
</html>