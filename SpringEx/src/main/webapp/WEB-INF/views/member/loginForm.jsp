<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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

<title>로그인창</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/login.css">
<c:choose>
	<c:when test="${result=='loginFailed' }">
		<script>
			window.onload = function() {
				alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
			}
		</script>
	</c:when>
</c:choose>
</head>

<body>
	<div id="wrapper">
		<!-- 로그인 -->
		<section class="signin">
			<h1>
				<a href="${contextPath}/mall_main.do"><img src="${contextPath}/resources/images/gorugoru_logo.gif" alt="" class="goru"></a>
			</h1>
			<div class="signin__card">
				<form name="frmLogin" method="post"
					action="${contextPath}/member/login.do">
					<input type="text" name="id" size="20" placeholder="아이디를 입력하세요." />
					<input type="password" name="pwd" size="20"	placeholder="비밀번호를 입력하세요." /> 
					<input type="submit" title="메인 화면으로 이동" value="로그인" />
				</form>
				<div class="actions">
					<a href="${contextPath}/member/memberForm.do">가입하기</a>
					<!-- <a href="javascript:void(0)">아이디 찾기</a>
				    <a href="javascript:void(0)">비밀번호 찾기</a> -->
				</div>
			</div>
		</section>
	</div>
</body>
</html>
