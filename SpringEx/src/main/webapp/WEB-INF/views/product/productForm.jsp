<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록창</title>
</head>
<body>
	<div class="content">
		<div class="title">
			<img id="titleImage" src="${contextPath}/resources/images/title.jpg" alt="타이틀 이미지">
			<h2 class="title-text">상품 등록</h2>
		</div>
		<div class="breadcrumb">
			<a href="${contextPath}/product/listProducts.do">상품 관리</a> > <a class="current">상품 등록</a>
		</div>
		<div id="wrapper">
		<!-- 상품등록 -->
		<div class="product-reg">
			<form method="post" action="${contextPath}/product/addProduct.do">
	            <div class="product-reg-left">
	                <h3>상품 구분</h3>
	                <select name="product_type">
	                    <option>과일류</option>
	                    <option>엽채류</option>
	                    <option>경채류</option>
	                    <option>근채류</option>
	                    <option>구근류</option>
	                    <option>과채류</option>
	                    <option>화채류</option>
	                </select>
	                <h3>상품명</h3>
	                <input type="text" name="product_name" placeholder="상품명" />
	                <h3>원산지</h3>
	                <input type="text" name="product_origin" placeholder="원산지" />
	                <h3>가격</h3>
	                <input type="number" name="product_price" />
	                <h3>재고</h3>
	                <input type="number" name="product_quantity" />
	                <input type="hidden" name="product_regmember_id"  value="${member.id}"/></br></br>
	                <button type="reset">초기화</button>
	                <button type="submit" onclick="if(!confirm('등록하시겠습니까?')){return false;}">등록</button>
	            </div>
	            <div class="product-reg-midlle">
	                <h3>상품 이미지(썸네일)</h3>
	                <input type="file" id="thumbnail_fileInput" style="display: none;">
	                <div>
	                    <span id="thumbnail_fileName"></span>
	                    <img id="previewImage" style="display: none; width: 200px;">
	                </div>
	                </br>
	                <button onclick="document.getElementById('thumbnail_fileInput').click()">파일 첨부</button>
	              </div>
	              
	              <div class="product-reg-right">
	                <h3>상품 이미지(상세)</h3>
	                <input type="file" id="detail_fileInput" style="display: none;">
	                <div>
	                    <span id="detail_fileName"></span>
	                    <img id="detailPreviewImage" style="display: none; width: 200px;">
	                </div>
	                </br>
	                <button onclick="document.getElementById('detail_fileInput').click()">파일 첨부</button>
	              </div>
              </form>
        </div>
	</div>
		
	</div>
	
	
	<!-- 이미지 첨부 관련 script -->
    <script src="${contextPath}/resources/js/script.js"></script>

</body>
