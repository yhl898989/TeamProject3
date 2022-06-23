<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<h1>회원 정보 삭제</h1>

<form action="/member/delete" method="post">
	<input name="mid" value="${mid}" type="hidden">
	PW : <input type="password" name="mpw">
	<button>삭제 완료</button> 


</form>

</body>
</html>