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
<jsp:include page="../common/header.jsp"/>
<h1>회원 정보 수정 화면</h1>
<form action="/member/update" method="post">
	ID : <input name="mid" value="${dto.mid}" readonly="readonly"> <br>
	PW : <input type="password" name="mpw"><br>
	이름 : <input name="mname" value="${dto.mname}"><br>
	이메일 : <input name="memail" value="${dto.memail}"><br>
	번호 : <input name="mphone" value="${dto.mphone}"><br>
	우편번호 :<input id="maddress1"  name="maddress1"> <button type="button" onclick="findAddr()">주소찾기</button> <br>
    주소 :  <input size="50" id="maddress2"  name="maddress2"><br>
    상세주소 : <input size="50" id="maddress3"  name="maddress3"><br>
	생일 : <input name="mbirth" type="date" value="${dto.mbirth}"><br>
	금액 : <input name="mmoney" value="${dto.mmoney}"><br>
	<input type="submit" value="입력 완료">
</form>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function findAddr() {
	   new daum.Postcode({
	      
	       oncomplete: function(data) {
	    	   document.querySelector("#maddress1").value = data.zonecode;
	            document.querySelector("#maddress2").value =  data.address;
	             }
	      }).open();   
	   }



</script>
</body>
</html>