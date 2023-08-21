<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>[mall] gorugoru 상품 주문 완료</title>
<link href="${contextPath}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/product.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="content">
		<div class="title">
			<img id="titleImage" src="${contextPath}/resources/images/title.jpg"
				alt="타이틀 이미지">
			<h2 class="title-text">주문 완료</h2>
		</div>

		<div class="breadcrumb">
			<a href="${contextPath}/product/mall_product_list.do">상품</a> > <a href="${contextPath}/product/mall_product_list.do">상품리스트</a> > <a>상품
				상세</a> > <a class="current">주문 완료</a>
		</div>
		<div class="complete_head">
			<img class="complete_img" src="${contextPath}/resources/images/vegetable.png" />
			<h1 style="margin-top: 0px; padding-top: 5px; font-size: 35px;">주문이 완료되었습니다!</h1>
		</div>
		<div class="complete_info">
			<div>
				<table class="table-fill">
					<thead>
						<tr>
							<th colspan="2" class="text-title">주문 상세정보</th>
						</tr>
					</thead>
					<tbody class="table-hover">
						<tr>
							<td class="td-1">주문 번호</td>
							<td class="td-2">${orderNo}</td>
						</tr>
						<tr>
							<td class="td-1">수취인명</td>
							<td class="td-2">${orderName}</td>
						</tr>
						<tr>
							<td class="td-1">배송지 정보</td>
							<td class="td-2">${orderAddress}</td>
						</tr>
						<tr>
							<td class="td-1">주문 날짜</td>
							<td class="td-2">${orderDate}</td>
						</tr>
						<tr>
							<td class="td-1">결제 가격</td>
							<td class="td-2"><fmt:formatNumber value="${orderPrice}" pattern="###,###원"/></td>
						</tr>
					</tbody>
				</table>
				<div class="ThankYou">
					<a href="${contextPath}/mall_main.do">gorugoru를 이용해주셔서 감사합니다.</a>
				</div>
			</div>
		</div>

	</div>
</body>
</html>