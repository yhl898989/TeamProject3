<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 입력 화면</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<h1>회원 정보 입력 화면</h1>
<form action="/member/insert" method="post" onsubmit="return formCheck()">
	ID : <input id="mid" name="mid"> <button type="button" onclick="idCheckFn()">아이디 중복확인</button> <br>
	PW : <input type="password" name="mpw" id="mpw"><br>
	PW 재확인 : <input type="password" id="mpwCheck"><br>
	이름 : <input name="mname" id="mname"><br>
	이메일 : <input name="memail" type="email" id="memail"><br>
	번호 : <input name="mphone" id="mphone"><br>
	우편번호 :<input  id="maddress1"  name="maddress1" readonly="readonly"> <button type="button" onclick="findAddr()">주소찾기</button> <br>
    주소 :  <input size="50" id="maddress2"  name="maddress2" readonly="readonly"><br>
    상세주소 : <input size="50" id="maddress3"  name="maddress3"><br>
	생일 : <input name="mbirth" type="date" id="mbirth"><br>
	<input id="OK" type="submit" value="입력 완료">
</form>




<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript">
 function findAddr() {
	   new daum.Postcode({
	      
	       oncomplete: function(data) {
	    	   document.querySelector("#maddress1").value = data.zonecode;
	            document.querySelector("#maddress2").value =  data.address;
	             }
	      }).open();   
	   }

function idCheckFn() {
	
	var mid = {mid: $("#mid").val()};
	
	$.ajax({
		url:'/member/idCheck',
		type:'post',
		data: mid,
		success:function(result){
			if(result==1){
				alert("이미 사용중인 아이디입니다.")
				$("#OK").attr('disabled','disabled');
			}else{
				alert("사용 가능한 아이디입니다.")
				$("#OK").removeAttr('disabled');
			}
		}
	});
}

function formCheck() {
	let mid = document.getElementById("mid");
	let mpw = document.getElementById("mpw");
	let mpwCheck = document.getElementById("mpwCheck");
	let mname = document.getElementById("mname");
	let memail = document.getElementById("memail");
	let mphone = document.getElementById("mphone");
	let maddress1 = document.getElementById("maddress1");
	let maddress2 = document.getElementById("maddress2");
	let maddress3 = document.getElementById("maddress3");
	let mbirth = document.getElementById("mbirth");
	
	if (mid.value == '') {
		alert("아이디를 입력하세요");
		mid.focus();
		return false;
	}
	
	if (mpw.value == '') {
		alert("비밀번호를 입력하세요");
		mpw.focus();
		return false;
	}
	
	if (mpw.value != mpwCheck.value) {
		alert("비밀번호가 일치하지 않습니다");
		mpw.focus();
		return false;
	}
	
	if (mname.value == '') {
		alert("이름을 입력하세요");
		mname.focus();
		return false;
	}
	
	if (memail.value == '') {
		alert("이메일을 입력하세요");
		memail.focus();
		return false;
	}
	
	if (mphone.value == '') {
		alert("전화번호를 입력하세요");
		mphone.focus();
		return false;
	}
	
	if (maddress1.value == '') {
		alert("주소를 입력하세요");
		maddress1.focus();
		return false;
	}
	
	if (maddress3.value == '') {
		alert("상세주소를 입력하세요");
		maddress3.focus();
		return false;
	}
	
	if (mbirth.value == '') {
		alert("생년월일을 입력하세요");
		mbirth.focus();
		return false;
	}
	
	
	
	return true;
}

</script>


</body>
</html>