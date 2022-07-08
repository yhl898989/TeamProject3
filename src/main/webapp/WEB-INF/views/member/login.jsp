<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<link href = "/resources/css/itemmain.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$("#find_id_btn").click(function() {
			location.href='../member/findidform';
		});
	});
	
	$(function() {
		$("#find_pw_btn").click(function() {
			location.href='../member/pw2';
		});
	});


</script>
</head>
<body>
<div style="position: fixed; z-index: 10;">
<jsp:include page="../common/header.jsp"></jsp:include>
</div>
<div>
<br>
<br>
<br>
<br>
<br>
<h1>일반 회원 로그인</h1>
	<form action="/member/login" method="post">
	
		ID: <input name="mid"> <br>
		PW: <input name="mpw" type="password"> <br>
		<input type="submit" value="로그인 완료"> <br>
		<a href="#" id="find_id_btn">아이디 찾기</a>
		<a href="#" id="find_pw_btn">비밀번호 찾기</a>
		
		<br>
		<a href="/naver/login">네이버</a>
	

	</form>

</body>
</html>