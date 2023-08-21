<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    // 현재 날짜 가져오기
    Date now = new Date();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    String currentDate = format.format(now);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 정보 수정</title>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/common.css">
	
</head>
<body>
	
	<div class="content">
		<div class="title">
			<img id="titleImage" src="${contextPath}/resources/images/title.jpg"
				alt="타이틀 이미지">
			<h2 class="title-text">상품 정보 수정</h2>
		</div>
		<div class="breadcrumb">
			<a href="${contextPath}/product/listProducts.do">상품 관리</a> > <a
				href="${contextPath}/product/listProducts.do">상품 리스트</a> > <a
				href="${contextPath}/product/viewProduct.do?product_no=${product.product_no}">상품 상세</a> > <a class="current">상품 정보 수정</a>
		</div>
		<div class="product-mod">
			<form action="${contextPath}/product/updateProduct.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
				<div class="product-mod-left">
					<h3>상품 번호</h3>
					<input type="text" name="product_no" 
						value="${product.product_no}" disabled>
					<input type="hidden" name="product_no" 
						value="${product.product_no}" readonly>
					<h3>상품 구분</h3>
					<select name="product_type">
							<option>${product.product_type}</option>
		                    <option>과일류</option>
		                    <option>엽채류</option>
		                    <option>경채류</option>
		                    <option>근채류</option>
		                    <option>구근류</option>
		                    <option>과채류</option>
		                    <option>화채류</option>
		                </select>
					<h3>상품명</h3>
					<input type="text" name="product_name"
						value="${product.product_name}" >
					<h3>원산지</h3>
					<input type="text" name="product_origin"
						value="${product.product_origin}" >
					<h3>가격</h3>
					<input type="number" name="product_price"
						value="${product.product_price}" >
					<h3>재고</h3>
					<input type="number" name="product_quantity"
						value="${product.product_quantity}" >
					<h3>등록자</h3>
					<input type="text" name="product_regmember_id"
						value="${product.product_regmember_id}" disabled>
					<h3>등록일</h3>
					<input type="text" name="product_regdate"
						value="${product.product_regdate}" disabled>
					<h3>수정자</h3>
					<input type="text" name="product_modmember_id"
						value="${product.product_modmember_id}" disabled>
					<input type="hidden" name="product_modmember_id"  value="${member.id}"/>
					<h3>수정일</h3>
					<input type="text" name="product_moddate"
						value="${product.product_moddate}" disabled>
					<input type="hidden" name="product_moddate" value="<%= currentDate %>">
						</br> </br>
					<button type="reset" >초기화</button>
					<button type="submit">수정</button>
				</div>
	
			</form>
			<div class="product-mod-midlle">
				<h3>상품 이미지(썸네일)</h3>
				<div width="15%">
					<img src="${contextPath}/resources/images/thumbnail_01.jpg"
						width="400" height="400" />
				</div>
				<input type="file" id="thumbnail_fileInput" style="display: none;">
				<div>
					<span id="thumbnail_fileName"></span> <img id="previewImage"
						style="display: none; width: 380px;">
				</div>
				</br>
				<button>이미지 첨부</button>
			</div>
			<div class="product-mod-right">
				<h3>상품 이미지(상세)</h3>
				<div width="15%">
					<img src="${contextPath}/resources/images/thumbnail_01.jpg"
						width="400" height="400" />
				</div>
				<input type="file" id="detail_fileInput" style="display: none;">
				<div>
					<span id="detail_fileName"></span> <img id="detailPreviewImage"
						style="display: none; width: 380px;">
				</div>
				</br>
				<button>이미지 첨부</button>
			</div>
		</div>
	</div>


</body>
</html>