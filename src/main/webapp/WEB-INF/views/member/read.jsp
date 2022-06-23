<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 자세히 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h1>회원 정보 자세히 보기</h1>
아이디 : ${dto.mid} <br>
비밀번호 : ${dto.mpw} <br>
이름 : ${dto.mname} <br>
이메일 : ${dto.memail} <br>
번호 : ${dto.mphone} <br>
우편번호 : ${dto.maddress1} <br>
주소 : ${dto.maddress2} <br>
상세주소 : ${dto.maddress3} <br>
생일 : ${dto.mbirth} <br>
금액 : ${dto.mmoney} <br>
<a href="/member/update/${dto.mid}">수정</a> <a href="/member/delete/${dto.mid}">삭제</a> <a href="/member/list">목록</a> 
</body>
</html>