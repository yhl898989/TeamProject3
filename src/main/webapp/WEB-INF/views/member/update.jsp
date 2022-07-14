<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 화면</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"   crossorigin="anonymous"></script>
<link href = "/resources/css/header.css" rel="stylesheet">
<style type="text/css">
.joinForm {
   width: 440px;
   height: 400px;
   padding: 30px, 20px;
   text-align: center;
   top: 40%;
   left: 50%;
   border-radius: 15px;
}

input[type='date']::before {
   content: attr(data-placeholder);
   width: 100%;
   color: #636e72;
}

input[type='date']:focus::before, input[type='date']:valid::before {
   display: none;
}

input[type="date"] {
   width: 320px;
   content: attr(data-placeholder);
}

h1 {
  text-align: center;
}

.textForm {
  border-bottom: 2px solid #adadad;
  padding: 15px 15px;
  text-align: left;
}

.insertInfo {
  width: 55%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.infobtn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-top: 40px;
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.infobtn:hover {
  background-position: right;
}

.checkBtn {
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
}

.checkBtn:hover {
  background-position: right;
}
</style>
</head>
<body>
<header style="position: fixed; z-index: 10;">
<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div style="height: 54.5px;">
</div>
<h1>회원 정보 수정</h1>
<center>
<form class="joinForm" action="/member/update" method="post" onsubmit="return formCheck()">
   <div class="textForm">
      아이디 : <input name="mid" class="insertInfo" value="${dto.mid}" readonly="readonly"> <br>
   </div>
   <div class="textForm">
      비밀번호 : <input name="mpw" value="${dto.mpw}" id="mpw" class="insertInfo"><br>
   </div>
   <div class="textForm">
      비밀번호 확인 : <input id="mpwCheck" class="insertInfo" value="${dto.mpw}"><br>
   </div>
   <div class="textForm">
      이름 : <input id="mname" name="mname" class="insertInfo" value="${dto.mname}"><br>
   </div>
   <div class="textForm">
      이메일 : <input id="memail" name="memail" class="insertInfo" value="${dto.memail}"><br>
   </div>
   <div class="textForm">
      번호 : <input id="mphone" name="mphone" class="insertInfo" value="${dto.mphone}"><br>
   </div>
   <div class="textForm">
      우편번호 : <input id="maddress1" id="maddress1" name="maddress1" class="insertInfo" value="${dto.maddress1}"> <button type="button" class="checkBtn" onclick="findAddr()">주소찾기</button> <br>
   </div>
   <div class="textForm">
         주소 : <input  id="maddress2"  name="maddress2" class="insertInfo" value="${dto.maddress2}"><br>
    </div>
    <div class="textForm">
       상세주소 : <input id="maddress3"  name="maddress3" class="insertInfo" value="${dto.maddress3}"><br>
    </div>
    <div class="textForm" class="insertInfo">
      생일 : <input id="mbirth" name="mbirth" type="date" value="${dto.mbirth}"><br>
   </div>
   <input type="submit" class="infobtn" value="수정 완료">
</form>
</center>
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

function formCheck() {
   let mpw = document.getElementById("mpw");
   let mpwCheck = document.getElementById("mpwCheck");
   let mname = document.getElementById("mname");
   let memail = document.getElementById("memail");
   let mphone = document.getElementById("mphone");
   let maddress1 = document.getElementById("maddress1");
   let maddress2 = document.getElementById("maddress2");
   let maddress3 = document.getElementById("maddress3");
   let mbirth = document.getElementById("mbirth");

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