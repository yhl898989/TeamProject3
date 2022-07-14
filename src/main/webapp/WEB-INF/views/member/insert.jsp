<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 입력 화면</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"   crossorigin="anonymous"></script>
<link href = "/resources/css/header.css" rel="stylesheet">
<style type="text/css">
.joinForm {
   width: 400px;
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
   width: 360px;
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
  width: 98%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}
.insertInfo2 {
  width: 76%;
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
   <jsp:include page="../common/header.jsp" />

   <h1>회원 가입</h1>
   <center>
   <form class="joinForm" action="/member/insert" method="post" onsubmit="return formCheck()">
      <div class="textForm">
         <input id="mid" name="mid" class="insertInfo2" placeholder="아이디" type="text"> <button type="button" class="checkBtn" onclick="idCheckFn()">중복확인</button><br>
      </div>
      <div class="textForm">
         <input type="password" name="mpw" id="mpw" class="insertInfo" placeholder="비밀번호"><br>
      </div>
      <div class="textForm">
         <input type="password" id="mpwCheck" class="insertInfo" placeholder="비밀번호 확인"><br>
      </div>
      <div class="textForm">
         <input name="mname" id="mname" class="insertInfo" placeholder="이름"><br>
      </div>
      <div class="textForm">
         <input name="memail" type="email" id="memail" class="insertInfo"   placeholder="이메일"><br>
      </div>
      <div class="textForm">
         <input name="mphone" id="mphone" class="insertInfo" placeholder="전화번호"><br>
      </div>
      <div class="textForm">
         <input id="maddress1" class="insertInfo2" name="maddress1" readonly="readonly" placeholder="우편번호"> <button type="button" class="checkBtn" onclick="findAddr()">주소찾기</button><br>
      </div>
      <div class="textForm">
         <input id="maddress2" class="insertInfo" name="maddress2" readonly="readonly" placeholder="주소"><br>
      </div>
      <div class="textForm">
         <input id="maddress3" class="insertInfo" name="maddress3" placeholder="상세주소"><br>
      </div>
      <div class="textForm">
         <input name="mbirth" type="date" id="mbirth" class="insertInfo" data-placeholder="생년월일"><br>
      </div>
      <input id="OK" type="submit" class="infobtn" value="가입 완료">
   </form>
	</center>



   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
   <script type="text/javascript">
      let cnt = 0;
      
      function findAddr() {
         new daum.Postcode({
            oncomplete : function(data) {
               document.querySelector("#maddress1").value = data.zonecode;
               document.querySelector("#maddress2").value = data.address;
            }
         }).open();
      }

      function idCheckFn() {

         var mid = {
            mid : $("#mid").val()
         };

         $.ajax({
            url : '/member/idCheck',
            type : 'post',
            data : mid,
            success : function(result) {
               if (result == 1) {
                  alert("이미 사용중인 아이디입니다.")
                  $("#OK").attr('disabled', 'disabled');
                  cnt = 0;
               } else {
                  alert("사용 가능한 아이디입니다.")
                  $("#OK").removeAttr('disabled');
                  cnt++;
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

         if (cnt == 0) {
            alert("아이디 중복확인을 해주세요");
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