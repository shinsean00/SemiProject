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
  <title>[Mall]메인 페이지</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
   <!-- content 영역  -->
    <div class="content">
        <div class="slider">
            <img id="sliderImage" src="${contextPath}/resources/images/slider1.jpg" alt="슬라이드 이미지">
			<div class="slider-text">
				<h2>친환경 채소를 최저가로!</h2>
				<p class="slider-subtext">- 고루고루 -</p>
			</div>
		</div>
        <h1>최저가 TOP3</h1>
        <section class="image-grid">
            <div class="grid-item">
                <div class="product-info">
                    <span>상품명: 당도 보장 충주 사과(3개)</span>
                    <span>가격: 2,000원</span>
                </div>
                <a href="product/mall_product_detail.do?product_no=1"><img src="${contextPath}/resources/images/product/1_thumbnail_01.jpg" alt="사과"></a>
            </div>
            <div class="grid-item">
                <div class="product-info">
                    <span>상품명: 국산 바나나 1송이</span>
                    <span>가격: 4,000원</span>
                </div>
                <a href="product/mall_product_detail.do?product_no=2"><img src="${contextPath}/resources/images/product/2_thumbnail_01.jpg" alt="바나나"></a>
            </div>
            <div class="grid-item">
                <div class="product-info">
                    <span>상품명: 강원도 알감자(5Kg)</span>
                    <span>가격: 10,000원</span>
                </div>
                <a href="product/mall_product_detail.do?product_no=38"><img src="${contextPath}/resources/images/product/38_thumbnail_01.jpg" alt="감자"></a>
            </div>
        </section>
    </div>
    
    <!-- sliderImage 스크립트  -->
    <script>
	    function changeSliderImage() {
	        var sliderImage = document.getElementById("sliderImage");
	        var imageIndex = 1;
	        var images = [
	            "${contextPath}/resources/images/slider1.jpg",
				"${contextPath}/resources/images/slider2.jpg",
				"${contextPath}/resources/images/slider3.jpg"
	        ];
	
	        setInterval(function() {
	            sliderImage.style.opacity = 0; // 이미지 투명도를 0으로 설정
	            setTimeout(function() {
	                sliderImage.src = images[imageIndex];
	                sliderImage.style.opacity = 1; // 이미지 투명도를 1로 설정
	                imageIndex++;
	                if (imageIndex >= images.length) {
	                    imageIndex = 0;
	                }
	            }, 500); // 이미지 변경 후 0.5초 후에 투명도를 다시 1로 설정
	        }, 5000);
	    }
	    window.addEventListener("load", changeSliderImage);
    </script>
</body>
</html>