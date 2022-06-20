<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h1>회원 정보 수정 화면</h1>
<form action="/member/update" method="post">
	ID : <input name="mid" value="${dto.mid}" readonly="readonly"> <br>
	PW : <input type="password" name="mpw"><br>
	이름 : <input name="mname" value="${dto.mname}"><br>
	이메일 : <input name="memail" value="${dto.memail}"><br>
	번호 : <input name="mphone" value="${dto.mphone}"><br>
	주소 : <input name="maddress" value="${dto.address}"><br>
	생일 : <input name="mbirth" type="date" value="${dto.mbirth}"><br>
	<input type="submit" value="입력 완료">


</form>
</body>
</html>