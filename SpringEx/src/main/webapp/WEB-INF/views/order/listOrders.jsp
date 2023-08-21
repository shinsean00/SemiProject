<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


<html>
<head>
    <meta charset="UTF-8">
    <title>주문 정보 출력창</title>
</head>
<body>
<div class="content">
    <div class="title">
        <img id="titleImage" src="${contextPath}/resources/images/title.jpg" alt="타이틀 이미지">
        <h2 class="title-text">주문 리스트</h2>
    </div>
    <div class="breadcrumb">
        <a href="${contextPath}/order/listOrders.do">주문 관리</a> > <a class="current">주문 리스트</a>
    </div>
    <div class="order-table-container">
        <table class="order-table">
            <tr>
                <th><b>주문번호</b></th>
                <th><b>이미지</b></th>
                <th><b>상품명</b></th>
                <th><b>원산지</b></th>
                <th><b>가격</b></th>
                <th><b>주문수량</b></th>
                <th><b>상세보기</b></th>
            </tr>
            <c:forEach var="order" items="${ordersList}">
                <tr align="center">
                    <td>${order.order_no}</td>
                    <td><img src="${contextPath}/resources/images/product/${order.product_no}_thumbnail_01.jpg" alt="사과"></td>
                    <td>${order.product.product_name}</td>
                    <td>${order.product.product_origin}</td>
                    <td>${order.product.product_price}</td>
                    <td>${order.order_quantity}</td>
                    <td><a href="${contextPath}/order/viewOrderDetail.do?order_no=${order.order_no}">상세보기</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
