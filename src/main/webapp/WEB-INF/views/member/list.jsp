<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href = "/resources/css/header.css" rel="stylesheet">
</head>
<body>
<header style="position: fixed; z-index: 10;">
<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div style="height: 54.5px;">
</div>
<c:choose>
    	<c:when test="${empty login}">
    	<a href="/item/list">쇼핑몰가기</a> 
    	<a href="/member/insert">회원가입</a>
    	  <a href="/member/login">Login</a>
    	</c:when>
    	<c:otherwise>
    		${login.mid}님, 환영합니다.
    		<a href="/member/logout">로그아웃</a>
    		<a href="/item/list">쇼핑몰가기</a> 
    	</c:otherwise>
    </c:choose>

<h1>회원 목록 화면</h1>

<table>
	<thead>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>번호</th>
			<th>주소</th>
			<th>생일</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${list}" var="dto">
		<tr>
			<td><a href="/member/read/${dto.mid}">${dto.mid}</a></td>
			<td>${dto.mpw}</td>
			<td>${dto.mname}</td>
			<td>${dto.memail}</td>
			<td>${dto.mphone}</td>
			<td>${dto.maddress1} / ${dto.maddress2} / ${dto.maddress3}</td>
			<td>${dto.mbirth}</td>
		</tr>
		</c:forEach>
	</tbody>

</table>

<center>
<a href = "/admin/mlist?curPage=${pt.curPage > 1? pt.curPage -1:1}">&laquo;</a>
	
	<c:forEach var = "i" begin="${pt.beginPageNum}" end = "${pt.finishPageNum }">
	<a href = "/admin/mlist?curPage=${i}" class = "${i == pt.curPage?'red':""}">
	
	${i}
	
	
	</a> &nbsp;&nbsp;
	
	</c:forEach>
	<a href = "/admin/mlist?curPage=${pt.curPage < pt.totalPage? pt.curPage + 1 : pt.totalPage}">&raquo;</a>
</center>	





</body>
</html>