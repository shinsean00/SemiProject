<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %> 
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[admin] gorugoru 멤버 상세</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common.css">
</head>
<body>

	<div class="content">
		<div class="title">
			<img id="titleImage" src="${contextPath}/resources/images/title.jpg" alt="타이틀 이미지">
			<h2 class="title-text">멤버 상세</h2>
		</div>
		<div class="breadcrumb">
			<a href="${contextPath}/member/listMembers.do">멤버 관리</a> > <a href="${contextPath}/member/listMembers.do">멤버 리스트</a> > <a class="current">멤버 상세</a>
		</div>

		<div class="member-detail">
			<div class="member-detail-left">
				<h3>멤버 구분</h3>
				<input type="text" value="${member.type}" disabled>
				<h3>아이디</h3>
				<input type="text" value="${member.id}" disabled>
				<h3>이름</h3>
				<input type="text" value="${member.name}" disabled>
				<h3>생일</h3>
				<input type="text" value="${member.birth}" disabled>
				<h3>이메일</h3>
				<input type="text" value="${member.email}" disabled>
				<h3>전화번호</h3>
				<input type="text" value="${member.tel}" disabled>
				<h3>주소</h3>
				<input type="text" value="${member.address}" disabled>
				<h3>등록일</h3>
				<input type="text" value="${member.joinDate}" disabled>
				<h3>수정일</h3>
				<input type="text" value="${member.modDate}" disabled>
				</br>
				</br>
				
				<a href="${contextPath}/member/updateMember.do?id=${member.id}"><button>멤버 정보 수정</button></a>
				<a href="${contextPath}/member/removeMember.do?id=${member.id}"><button onclick="if(!confirm('탈퇴처리하시겠습니까?')){return false;}">탈퇴</button></a>
			</div>
		</div>
	</div>

</body>
</html>