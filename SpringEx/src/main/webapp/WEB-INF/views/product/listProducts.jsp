<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


<html>
<head>
<meta charset=UTF-8">
<title>상품 정보 출력창</title>
</head>
<body>
	<div class="content">
		<div class="title">
			<img id="titleImage" src="${contextPath}/resources/images/title.jpg" alt="타이틀 이미지">
			<h2 class="title-text">상품 리스트</h2>
		</div>
		<div class="breadcrumb">
			<a href="${contextPath}/product/listProducts.do">상품 관리</a> > <a class="current">상품 리스트</a>
		</div>
		<div class="button-container">
			<div class="reg-button">
				<a href="${contextPath}/product/productForm.do"><button>상품 등록</button></a>
			</div>
		</div>
		<div class="product-table-container">
			<table class="product-table">
				<tr>
					<th><b>상품번호</b></th>
					<th><b>상품구분</b></th>
					<th><b>상품명</b></th>
					<th><b>원산지</b></th>
					<th><b>가격</b></th>
					<th><b>재고</b></th>
					<th><b>등록자</b></th>
					<th><b>등록일</b></th>
					<th><b>수정자</b></th>
					<th><b>수정일</b></th>
					<th><b>삭제</b></th>
				</tr>
	
				<c:forEach var="product" items="${productsList}">
					<tr align="center">
						<td>${product.product_no}</td>
						<td>${product.product_type}</td>
						<td>${product.product_name}</td>
						<td>${product.product_origin}</td>
						<td>${product.product_price}</td>
						<td>${product.product_quantity}</td>
						<td>${product.product_regmember_id}</td>
						<td>${product.product_regdate}</td>
						<td>${product.product_modmember_id}</td>
						<td>${product.product_moddate}</td>
						<td><a
							href="${contextPath}/product/viewProduct.do?product_no=${product.product_no}">상세보기</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
