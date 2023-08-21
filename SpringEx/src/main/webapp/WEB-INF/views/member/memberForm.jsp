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
<title>회원 가입창</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/join.css">
</head>
<body>
	<div id="wrapper">
		<!-- 회원가입 -->
		<section class="Join">
			<h1>
				<a href="${contextPath}/mall_main.do"><img src="${contextPath}/resources/images/gorugoru_logo.gif" alt="" class="goru"></a>
			</h1>
			<!-- <h4>가입 정보 입력 </h4> -->
			<div class="join__card">
				<h4>가입 정보 입력</h4>
				<form method="post"   action="${contextPath}/member/addMember.do">
					<select name="type">
						<option value="user">user</option>
						<option value="manager">manager</option>
					</select> 
					<input type="text" name="id" placeholder="아이디" /> 
					<input type="password" name="pwd" id="password" placeholder="비밀번호" /> 
					<input type="password" name="confirmPwd" id="confirmPassword" placeholder="비밀번호 재입력" /> 
					<input type="text" name="name" placeholder="이름" />
					<input type="date" name="birth" placeholder="생일" />

					<div class="emil">
						<input type="text" name="email" placeholder="이메일" value="test"/> 
						<select id="email" name="emailDomain" >
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.com">daum.com</option>
							<option value="kakao.com">kakao.com</option>
							<option value="nate.com">nate.com</option>
							<option value="yahoo.com">yahoo.com</option>
						</select>				
					</div>

					<input type="text" name="tel" placeholder="전화번호" /> 
					<input type="text" name="address" placeholder="주소" /> 
					<input type="submit" value="가입" onclick="return checkPassword();" />

				</form>
				
			</div>
		</section>
	</div>
	<script>
		function checkPassword() {
			var password = document.getElementById('password').value;
			var confirmPassword = document.getElementById('confirmPassword').value;

			if (password !== confirmPassword) {
				alert('비밀번호가 일치하지 않습니다.');
				return false;
			}

			return true;
		}
	</script>
</body>
