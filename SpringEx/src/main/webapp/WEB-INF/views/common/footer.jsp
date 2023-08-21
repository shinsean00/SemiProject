<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>footer</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common.css">
</head>
<body>
	<footer>
		<div>
			<div class="info">
				<span>사업자 등록번호 123-45-67890</span> <span>(주)고루고루 마켓 대표이사 홍길동</span>
				<span>TEL : 02) 1234-5678 / FAX : 02) 5678-1234</span> <span>개인정보
					책임자: 성춘향</span>
			</div>
			<p class="copyright">COPYRIGHT&copy; 2023 Sangboo3Jo. All Rights
				Reserved.</p>
			<div class="logo_s">
				<img src="${contextPath}/resources/images/sangboo3jo_logo.gif" alt="회사로고">
			</div>
		</div>
	</footer>
</body>
</html>