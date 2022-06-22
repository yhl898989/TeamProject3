<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<center>
<h1>관리자 페이지</h1>

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
	<c:forEach items="${mlist}" var="dto">
		<tr>
			<td><a href="/member/mypage/${dto.mid}">${dto.mid}</a></td>
			<td>${dto.mpw}</td>
			<td>${dto.mname}</td>
			<td>${dto.memail}</td>
			<td>${dto.mphone}</td>
			<td>${dto.maddress}</td>
			<td>${dto.mbirth}</td>
			<td><a href="/member/update/${dto.mid}">수정</a></td>
			<td><a href="/member/delete/${dto.mid}">삭제</a></td>
		</tr>
		</c:forEach>
	</tbody>

</table>
</center>
</body>
</html>