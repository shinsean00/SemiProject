<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[mall] gorugoru 상품 리스트</title>
<link href="${contextPath}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/product.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- content 영역  -->
	<div class="content">
		<div class="title">
			<img id="titleImage" src="${contextPath}/resources/images/title.jpg" alt="타이틀 이미지">
			<h2 class="title-text">상품 리스트</h2>
		</div>

		<div class="breadcrumb">
			<a href="${contextPath}/product/mall_product_list.do">상품</a> > <a class="current">상품 리스트</a>
		</div>

		<!-- 상품 리스트 불러오기-->
		<div class="prdlist_prd">
			<c:forEach var="product" items="${productsList}">
				<div class="prdlist_prd_list" id="prdNum${product.product_no}">
					<a href="mall_product_detail.do?product_no=${product.product_no}">
						<img class="prd_image"
						src="${contextPath}/resources/images/product/${product.product_no}_thumbnail_01.jpg" alt="${product.product_name}">
						<div class="prd_underInfo">
							<div class="prd_name">${product.product_name}</div>
							<div class="prd_price"><fmt:formatNumber value="${product.product_price}" pattern="###,###원"/></div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
