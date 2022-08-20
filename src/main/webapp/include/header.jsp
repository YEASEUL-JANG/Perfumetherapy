<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
1) JSTL(Jsp Standard Tag Library : 표준태그 라이브러리)
2) 사용이유 : model1은 jsp페이지 중심의 방식이고 model2는 java코드(서블릿,모델)위주
jsp웹페이지에서 java코드를 써야할때가 많다. 이를 최소화하기 위해 JSTL과 EL기법을 쓴다.
즉,JSP내부의 복잡한 자바코드를 대체하기 위한 하나의 코드.
3) taglib prifix="태그 접두어" uri="태그라이브러리의 식별자"
4) core tag(핵심태그, 제일 자주사용되는 태그들)
  -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
  <c:set var="path" value="${pageContext.request.contextPath}"/>