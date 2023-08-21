<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<head>
  <meta charset="UTF-8">
  <title>header</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common.css">
</head>
<body>
<header>
	<%-- <div class="logo_g">
		<a href="${contextPath}/mall_main.do"><img src="${contextPath}/resources/images/gorugoru_logo.gif" alt="회사로고"></a>
	</div>
	<nav>
		<ul>
			<li><a href="mall_product_list.jsp">상품</a></li>
			<li><a href="mall_order_list.jsp">주문</a></li>
		</ul>
	</nav>
	<div>
		<c:choose>
			<c:when test="${isLogOn == true  && member!= null}">
				<h4>${member.name}님 안녕하세요.</h4>
				<a href="${contextPath}/member/logout.do"><button>로그아웃</button></a>
			</c:when>
			<c:otherwise>
				<a href="${contextPath}/member/loginForm.do"><button>로그인</button></a>
			</c:otherwise>
		</c:choose>
	</div> --%>
</header>
</body>