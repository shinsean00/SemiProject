<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


<html>
<head>
<meta charset=UTF-8">
<title>회원 정보 출력창</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/join.css">
</head>
<body>
	<div class="content">
		<div class="title">
            <img id="titleImage" src="${contextPath}/resources/images/title.jpg" alt="타이틀 이미지">
            <h2 class="title-text">멤버 리스트</h2>
        </div>
        <div class="breadcrumb">
            <a href="${contextPath}/member/listMembers.do">멤버 관리</a> > <a class="current">멤버 리스트</a>
        </div>
		<div class="member-table-container">
		<table class="member-table">
			<tr>
				<th><b>타입</b></th>
				<th><b>아이디</b></th>
				<th><b>비밀번호</b></th>
				<th><b>이름</b></th>
				<th><b>생일</b></th>
				<th><b>이메일</b></th>
				<th><b>연락처</b></th>
				<th><b>주소</b></th>
				<th><b>가입일</b></th>
				<th><b>상세보기</b></th>
			</tr>

			<c:forEach var="member" items="${membersList}">
				<tr align="center">
					<td>${member.type}</td>
					<td>${member.id}</td>
					<td>${member.pwd}</td>
					<td>${member.name}</td>
					<td>${member.birth}</td>
					<td>${member.email}</td>
					<td>${member.tel}</td>
					<td>${member.address}</td>
					<td>${member.joinDate}</td>
					<td><a href="${contextPath}/member/viewMember.do?id=${member.id}">상세보기 </a></td>
				</tr>
			</c:forEach>
		</table>
		<!-- <a href="${contextPath}/member/memberForm.do"><h1 style="text-align: center">회원가입</h1></a> -->
	</div>
	</div>
</body>
</html>
