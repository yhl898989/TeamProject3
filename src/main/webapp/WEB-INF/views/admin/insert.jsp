<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 계정 생성</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<link href = "/resources/css/header.css" rel="stylesheet">
</head>
<body>
<header style="position: fixed; z-index: 10;">
<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div style="height: 54.5px;">
</div>
<h1>관리자 계정 생성</h1>
<form action="/admin/insert" method="post" onsubmit="return formCheck()">
	관리자 ID : <input  name = "aid"><br>
	관리자 PW : <input id = "apw" name = "apw"><br>
	관리자 PW 확인 : <input id="apwCheck"><br>
	이름 : <input name = "aname"><br>
	<input type="submit" value="신청">
</form>

<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript">
function formCheck() {
	let apw = document.getElementById("apw");
	let apwCheck = document.getElementById("apwCheck");
	
	if (apw.value != apwCheck.value) {
		alert("비밀번호가 일치하지 않습니다");
		apw.focus();
		return false;
	}
	
	return true;
}
</script>
</body>
</html>