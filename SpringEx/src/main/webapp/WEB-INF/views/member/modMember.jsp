<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

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
<title>회원 정보 수정창</title>
<style>
   .text_center{
     text-align:center;
   }
</style>
</head>
<body>

	<div class="content">
		<div class="title">
			<img id="titleImage" src="${contextPath}/resources/images/title.jpg" alt="타이틀 이미지">
			<h2 class="title-text">멤버 정보 수정</h2>
		</div>
		<div class="breadcrumb">
			<a href="${contextPath}/member/listMembers.do">멤버 관리</a> > <a href="${contextPath}/member/listMembers.do">멤버 리스트</a> > <a href="${contextPath}/member/viewMember.do?id=${member.id}">멤버 상세</a> > <a class="current">멤버 정보 수정</a>
		</div>
		<form method="post"   action="${contextPath}/member/modMember.do">
		<input type="hidden" name="id" value="${member.id}">
		<div class="member-detail">
			<div class="member-detail-left">
				<h3>멤버 구분</h3>
				<select name="type">
					<option value="${member.type}">${member.type}</option>
					<option value="user">user</option>
					<option value="manager">manager</option>
				</select> 
				<h3>아이디</h3>
				<input type="text" value="${member.id}" name="id" disabled>
				<h3>이름</h3>
				<input type="text" value="${member.name}" name="name">
				<h3>생일</h3>
				<input type="text" value="${member.birth}" name="birth">
				<h3>이메일</h3>
				<input type="text" value="${member.email}" name="email">
				<h3>전화번호</h3>
				<input type="text" value="${member.tel}" name="tel">
				<h3>주소</h3>
				<input type="text" value="${member.address}" name="address">
				<h3>등록일</h3>
				<input type="text" value="${member.joinDate}" name="joinDate" disabled>
				<h3>수정일</h3>
				<input type="text" value="${member.modDate}" name="modDate" disabled>
				<input type="hidden" name="modDate" value="<%= currentDate %>">
				</br> 
				</br>
				<button type="reset">초기화</button>
				<button type="submit" onclick="if(!confirm('수정하시겠습니까?')){return false}; return checkPassword(); ">수정</button>
			
			</div>
			<div class="member-detail-right">
				<h3>비밀번호</h3>
				<input type="password" value="${member.pwd}" name="pwd" id="password" /> 
				<h3>비밀번호 확인</h3>
				<input type="password" value="${member.pwd}" name="confirmPwd" id="confirmPassword" /> 

			</div>
		</div>
	</form>
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
</html>