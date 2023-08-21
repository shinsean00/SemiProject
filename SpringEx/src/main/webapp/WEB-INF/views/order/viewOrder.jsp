<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="order" value="${order}" />
<c:set var="addressArray" value="${fn:split(order.order_address, '/')}"/>
<c:set var="telArray" value="${fn:split(order.order_tel,'-')}"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문 정보</title>
<link href="${contextPath}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/product.css" rel="stylesheet" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<c:set var="product" value="${productDetail}"/>
	
	<!-- content 영역  -->
	<div class="content">
		<div class="title">
			<img id="titleImage" src="${contextPath}/resources/images/title.jpg" alt="타이틀 이미지">
			<h2 class="title-text">주문 상세</h2>
		</div>

		<div class="breadcrumb">
			<a href="${contextPath}/order/listOrders.do">주문 관리</a> > <a class="current">주문 리스트</a> > <a class="current">주문 상세</a>
		</div>

		<div class="prd_detail">
			<div class="prdimage">
				<div class="bigImages">
					<img id="big"
						src="${contextPath}/resources/images/product/${order.product_no}_thumbnail_01.jpg"
						alt="썸네일 이미지1">
				</div>
				<div class="smallImages">
					<img class="small active" src="${contextPath}/resources/images/product/${order.product_no}_thumbnail_01.jpg" alt="썸네일 이미지1" onclick="showImage(this)" /> 
					<img class="small" src="${contextPath}/resources/images/product/${order.product_no}_thumbnail_02.jpg" alt="썸네일 이미지2" onclick="showImage(this)" /> 
					<img class="small" src="${contextPath}/resources/images/product/${order.product_no}_thumbnail_03.jpg" alt="썸네일 이미지3" onclick="showImage(this)" />
				</div>
			</div>
			
			
			<div class="prd_order">
				<div class="prd_info">
					<h3>상품 번호 : ${order.product_no} / 주문 번호 : ${order.order_no}</h3>
					<h1 style="color: black; margin-top: 0px;"> 상품명 : ${order.product.product_name}</h1>
					<br>
					<ul>
						<li>원산지 : ${order.product.product_origin}</li>
						<li>가격 : <fmt:formatNumber value="${order.product.product_price}" pattern="###,###원"/></li>
						<li><div class="qty_btn">
								<button class="down_btn">﹣</button>
								<input type="text" id="order_qty" inputmode="numeric" value="1">
								<button class="up_btn">﹢</button>
							</div></li>
					</ul>
				</div>
				
				<div class="order_info">
				<ul>
					<li><label>주문자와 동일  </label><input type="checkbox" id="order_cb" disabled><label for="order_cb"></label></li>
					<li>수취인명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><input type="text" id="recipient" class="address" value = "${order.order_name}"></li>
					<li>배송지 정보<br>
    					<input type="text" id="address_part1" class="address" value="${addressArray[0]}"  disabled><br>
   						<input type="text" id="address_part2" class="address" value="${addressArray[1]}" disabled><br>
    					<input type="text" id="address_part3" class="address" value="${addressArray[2]}" disabled>
    					<input type="text" id="address_part4" class="address" value="${addressArray[3]}" disabled>
					</li>
					<li>
					<label>연락처</label> 
					  <input type="text" class="phone_num" id="tel_first" value="${telArray[0]}" disabled>-					  
					  <input type="text" class="phone_num" id="tel_middle" value="${telArray[1]}" disabled>-<input type="text" class="phone_num" id="tel_last" value="${telArray[2]}"><br>
					</li>
				</ul>
				</div>
				<div class="order_section">
				  <span id="order_total">주문 금액 : <fmt:formatNumber value="${order.order_total_price}" pattern="###,###원"/></span>				 
 				  <a href="${contextPath}/order/removeOrder.do?order_no=${order.order_no}&id=${sessionScope.member.id}"><button class="order_btn btnPush" onclick="if(!confirm('취소하시겠습니까?')){return false;}">주문 취소</button></a>
				</div>
		</div>
		</div>
		</div>
		
		

	<!-- Script -->
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
	
	    // up, down button에 따른 주문량 개수 변화하는 함수
	    const upBtn = document.querySelector('.up_btn');
	    const downBtn = document.querySelector('.down_btn');
	    const input = document.querySelector('#order_qty');
	
	    upBtn.addEventListener('click', () => {
	      input.value = parseInt(input.value) + 1;
	      calculateOrderTotal();
	    });
	    downBtn.addEventListener('click',() => {
	      input.value = parseInt(input.value) -1;
	      if (input.value < 1) {
	        input.value = 1;
	      }
	      calculateOrderTotal();
	    })
	    
	    // 주문 금액 계산하는 함수
		const productPrice = ${product[0].product_price};
	    function calculateOrderTotal() {
	      const orderQty = parseInt(input.value);
	      const price = productPrice;
	      const orderTotal = orderQty * price;
	      const orderTotalElement = document.getElementById('order_total');
	      orderTotalElement.textContent = '주문 금액 : ' + orderTotal.toLocaleString() + '원';
	    }
	
	    input.addEventListener('input',calculateOrderTotal);
		
	    // 주문자 동일 체크박스 사용자 정보 가져오는 함수
	    const member = {
    		id: '${sessionScope.member.id}',
    		name: '${sessionScope.member.name}',
    		address: '${sessionScope.member.address}',
    		tel: '${sessionScope.member.tel}'
    		
 		};
	    function loadUserInfo(checkbox) {
			if (checkbox.checked) {
				if (member) {
					document.getElementById("recipient").value = member.name;
					
					// 주소 나누기
					var fullAddress = member.address;
				    var splitAddress = fullAddress.split('/');

				    // 분할된 주소를 필드에 각각 저장
				    document.getElementById("postcode").value = splitAddress[0]; // 우편번호
				    document.getElementById("address").value = splitAddress[1]; // 주소
				    document.getElementById("detailAddress").value = splitAddress[2]; // 상세주소
				    document.getElementById("extraAddress").value = splitAddress.slice(3).join(' '); // 참고항목 (3번 인덱스부터 끝까지 합치기)
				    
				    // 전화번호 나누기
				    var tel = member.tel;
				    var telParts = tel.split('-');
				    
				    document.getElementById("tel_first").value = telParts[0]; // 앞 번호
				    document.getElementById("tel_middle").value = telParts[1]; // 중간 번호
				    document.getElementById("tel_last").value = telParts[2]; // 마지막 번호
				}
			} else {
				document.getElementById("recipient").value = "";
				document.getElementById("postcode").value = "";
			    document.getElementById("address").value = "";
			    document.getElementById("detailAddress").value = "";
			    document.getElementById("extraAddress").value = "";
			    document.getElementById("tel_first").value = "";
			    document.getElementById("tel_middle").value = "";
			    document.getElementById("tel_last").value = "";
			}
		}
	    // kakao 지도 API
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value= addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	            }
	        }).open();
	    }
	    
	    // 주문 정보
	    function sendOrder() {
	    	var id = member.id;
		    var name = document.getElementById("recipient").value;
		    var address = document.getElementById("postcode").value + "/" + document.getElementById("address").value + "/" + document.getElementById("detailAddress").value + "/" + document.getElementById("extraAddress").value;
		    var tel = document.getElementById("tel_first").value + "-" + document.getElementById("tel_middle").value + "-" + document.getElementById("tel_last").value;
		    var quantity = document.getElementById("order_qty").value;
	    	var total_price = productPrice * quantity;
	    	var date = getTime();
	    	var productNo = "${product[0].product_no}";
 	    	console.log(id);
	    	console.log(name);
	    	console.log(address);
	    	console.log(tel);
	    	console.log(quantity);
	    	console.log(total_price);
	    	console.log(date);
	    	console.log(productNo);
	   
	    	if (member.id != '') {
	    		 var url = '${contextPath}/product/orderComplete.do' +
	    	      '?id=' + encodeURIComponent(id) +
	    	      '&name=' + encodeURIComponent(name) +
	    	      '&address=' + encodeURIComponent(address) +
	    	      '&tel=' + encodeURIComponent(tel) +
	    	      '&quantity=' + encodeURIComponent(quantity) +
	    	      '&total_price=' + encodeURIComponent(total_price) +
	    	      '&date=' + encodeURIComponent(date) +
	    	      '&productNo=' + encodeURIComponent(productNo);

	    	    	var xhr = new XMLHttpRequest();
	    	    	xhr.open('GET', url, true);
	    	    	xhr.send();
	    	    	console.log("주문 완료!");
	    	    	location.href = url;
	    		} else {
	    		  alert("로그인 상태에서만 주문이 가능합니다.");
	    		  location.href = '${contextPath}/member/loginForm.do';
	    	}
	    }
	    
	    // 현재 날짜와 시간 구하기
	    function getTime() {
	    	var today = new Date();
	    	
	    	var year = today.getFullYear();
	    	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	    	var day = ('0' + today.getDate()).slice(-2);

	    	var hours = ('0' + today.getHours()).slice(-2); 
	    	var minutes = ('0' + today.getMinutes()).slice(-2);
	    	var seconds = ('0' + today.getSeconds()).slice(-2); 

	    	var now = year + '-' + month  + '-' + day + " " + hours + ':' + minutes  + ':' + seconds;
	    	console.log("현재 : " + now);
			return now;
	    }
	</script>
</body>
</html>