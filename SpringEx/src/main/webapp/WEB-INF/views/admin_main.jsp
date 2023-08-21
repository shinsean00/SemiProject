<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<%
  request.setCharacterEncoding("UTF-8");
%>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
   <!-- content 영역  -->
    <div class="content">
		<div class="title">
			<img id="titleImage" src="${contextPath}/resources/images/title.jpg" alt="타이틀 이미지">
			<h2 class="title-text">대시보드</h2>
		</div>
		<div class="admin-main">
			<br/>
			<div class="admin-main-left">
				<h3>주문 통계</h3>
				<ul>
					<li>-주문 처리 필요 : 25 건</li>
					<li>-총 주문 건수 : 554 건</li>
				</ul>
			</div>
			<div class="admin-main-midlle">
				<h3>매출</h3>
				<ul>
					<li>-과일류 : 9,450,000 원</li>
					<li>-엽채류 : 5,000,000 원</li>
					<li>-경채류 : 1,250,000 원</li>
					<li>-근채류 : 400,000 원</li>
					<li>-구근류 : 2,000,000 원</li>
					<li>-화채류 : 450,000 원</li>
				</ul>
			</div>

			<div class="admin-main-right">
				<h3>상품 등록 현황</h3>
				<ul>
					<li>-과일류 : 9,450 건</li>
					<li>-엽채류 : 5,000 건</li>
					<li>-경채류 : 1,250 건</li>
					<li>-근채류 : 400 건</li>
					<li>-구근류 : 2,000 건</li>
					<li>-화채류 : 450 건</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>