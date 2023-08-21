<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[mall] gorugoru 상품 정보</title>
<link href="${contextPath}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/order.css" rel="stylesheet" type="text/css">
<c:set var="order" value="${orderDetail}" />
<c:set var="product" value="${productDetail}" />
<c:set var="addressArray" value="${fn:split(order[0].order_address, '/')}"/>
<c:set var="telArray" value="${fn:split(order[0].order_tel,'-')}"/>
</head>
<body>
	<!-- content 영역  -->
	<div class="content">
		<div class="title">
			<img id="titleImage" src="${contextPath}/resources/images/title.jpg" alt="타이틀 이미지">
			<h2 class="title-text">주문 상세</h2>
		</div>

		<div class="breadcrumb">
			<a>주문 관리</a> > <a href="${contextPath}/order/listOrders.do">주문 리스트</a> > <a href="${contextPath}/order/viewOrderDetail.do?id=${order[0].order_no}" class="current">주문 상세</a>
		</div>

		<div class="prd_detail">
			<div class="prdimage">
				<div class="bigImages">
					<img id="big" src="${contextPath}/resources/images/product/${product[0].product_no}_thumbnail_01.jpg" alt="썸네일 이미지1">
				</div>
				<div class="smallImages">
					<img class="small active" src="${contextPath}/resources/images/product/${product[0].product_no}_thumbnail_01.jpg" alt="썸네일 이미지1" onclick="showImage(this)" /> 
					<img class="small" src="${contextPath}/resources/images/product/${product[0].product_no}_thumbnail_02.jpg" alt="썸네일 이미지2" onclick="showImage(this)" /> 
					<img class="small" src="${contextPath}/resources/images/product/${product[0].product_no}_thumbnail_03.jpg" alt="썸네일 이미지3" onclick="showImage(this)" />
				</div>
			</div>
			
			<div class="prd_order">
				<div class="prd_info">
					<h3>상품 번호 : ${product[0].product_no} / 주문번호 : ${order[0].order_no}</h3>
					<h1 style="color: black; margin-top: 0px;"> 상품명 : ${product[0].product_name}</h1>
					<br>
					<ul>
						<li>원산지 : ${product[0].product_origin}</li>
						<li>가격 : <fmt:formatNumber value="${product[0].product_price}" pattern="###,###원"/></li>
						<li><div class="qty_btn">
								<button class="down_btn" disabled>﹣</button>
								<input type="text" id="order_qty" inputmode="numeric" value="${order[0].order_quantity}" disabled>
								<button class="up_btn" disabled>﹢</button>
							</div></li>
					</ul>
				</div>
				<div class="order_info">
				<ul>
					<li>수취인명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><input type="text" id="recipient" class="address" value="${order[0].order_name}" disabled></li>
					<li><form>배송지 정보<br>
						<input type="text" id="postcode" class="address" value="${addressArray[0]}" disabled><br>
						<input type="text" id="address" class="address" value="${addressArray[1]}" disabled><br>
						<input type="text" id="detailAddress" class="address"  value="${addressArray[2]}" disabled>
						<input type="text" id="extraAddress" class="address"  value="${addressArray[3]}" disabled>
					</form></li>
					<li>연락처<br>
					   <input type="text" class="phone_num" id="tel_first" value="${telArray[0]}">-<input type="text" class="phone_num" id="tel_middle" value="${telArray[1]}">-<input type="text" class="phone_num" id="tel_last" value="${telArray[2]}"><br>
					</li>
				</ul>
				</div>
				  <span id="order_total">주문 금액 : <fmt:formatNumber value="${order[0].order_total_price}" pattern="###,###원"/></span>
				<div class="order_section">
 				  <button class="order_btn btnPush" id="btn1" onclick="clickBtn1()" >주문 처리 ✓</button>
 				  <button class="order_btn btnPush" id="btn2" onclick="clickBtn2()">주문 취소 ✖︎</button>
				</div>
		</div>
	</div>
	</div>

	<!-- Script -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	  // <!-- 사진 클릭 -->
	  var bigPic = document.querySelector("#big"); // 큰사진
	  var smallPics = document.querySelectorAll(".small"); // 작은사진(여러개)
	
	  for(var i=0; i<smallPics.length; i++){
	    smallPics[i].addEventListener("click",changepic); // 이벤트 처리
	  }
	
	  function changepic() { //사진 바꾸는함수
	    var smallPicAttribute = this.getAttribute("src");
	    bigPic.setAttribute("src",smallPicAttribute);
	  }
	
	  // 선택한 사진 제외하곤 투명하게 조정하는 함수
	  function showImage(element) {
	      const thumbnails = document.querySelectorAll(".small");
	      thumbnails.forEach((thumbnail) => {
	        thumbnail.classList.remove("active");
	      });
	      element.classList.add("active");
	    }
	  
	 // 주문 처리 버튼
	 function clickBtn1() {
		 alert("주문 처리가 완료되었습니다!");
		 window.location.href = "${contextPath}/order/listOrders.do";
	 }
	 
	 function clickBtn2() {
         var result = confirm("주문을 취소하시겠습니까?");
         if (result) {
        	 var orderNo = ${order[0].order_no};
             window.location.href = "${contextPath}/order/removeOrderManager.do?order_no=" + orderNo;
         } else {

         }
     }
	</script>
</body>
</html>