<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
<title>상품 상세</title>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/common.css">
</head>
<body>


	<div class="title">
		<img id="titleImage" src="${contextPath}/resources/images/title.jpg"
			alt="타이틀 이미지">
		<h2 class="title-text">상품 상세</h2>
	</div>
	<div class="breadcrumb">
		<a href="${contextPath}/product/listProducts.do">상품 관리</a> > <a
			href="${contextPath}/product/listProducts.do">상품 리스트</a> > <a class="current">상품 상세</a>
	</div>
	<!-- content 영역  -->
	<div class="content">
			<div class="product-reg">
			<div class="product-reg-left">
				<h3>상품 번호</h3>
				<input type="text" value="${product.product_no}" disabled>
				<h3>상품 구분</h3>
				<input type="text" value="${product.product_type}" disabled>
				<h3>상품명</h3>
				<input type="text" value="${product.product_name}" disabled>
				<h3>원산지</h3>
				<input type="text" value="${product.product_origin}" disabled>
				<h3>가격</h3>
				<input type="text" value="${product.product_price}" disabled>
				<h3>재고</h3>
				<input type="text" value="${product.product_quantity}" disabled>
				<h3>등록자</h3>
				<input type="text" value="${product.product_regmember_id}" disabled>
				<h3>등록일</h3>
				<input type="text" value="${product.product_regdate}" disabled>
				<h3>수정자</h3>
				<input type="text" value="${product.product_modmember_id}" disabled>
				<h3>수정일</h3>
				<input type="text" value="${product.product_moddate}" disabled></br>
				</br>
				<a href="${contextPath}/product/editProduct.do?product_no=${product.product_no}"><button>상품 정보 수정</button></a>
				
				<a href="${contextPath}/product/removeProduct.do?product_no=${product.product_no}"><button onclick="if(!confirm('삭제하시겠습니까?')){return false;}">상품 삭제</button></a>
			</div>
			<div class="product-reg-midlle">
				<h3>상품 이미지(썸네일)</h3>
				<div width="15%">
					<img id="thumbnail"
						src="${contextPath}/resources/images/thumbnail_01.jpg" width="400"
						height="400" />
				</div>
				<input type="file" id="thumbnail_fileInput" style="display: none;">
				<div>
					<span id="thumbnail_fileName"></span> <img id="previewImage"
						style="display: none; width: 200px;">
				</div>
				</br>

			</div>
			<div class="product-reg-right">
				<h3>상품 이미지(상세)</h3>
				<div width="15%">
					<img src="${contextPath}/resources/images/thumbnail_01.jpg"
						width="400" height="400" />
				</div>
				<input type="file" id="detail_fileInput" style="display: none;">
				<div>
					<span id="detail_fileName"></span> <img id="detailPreviewImage"
						style="display: none; width: 200px;">
				</div>
				</br>
			</div>
		</div>
	</div>


	<!-- 이미지 첨부 관련 script -->
	<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>