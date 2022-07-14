<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"   crossorigin="anonymous"></script>
<link href="/resources/css/header.css" rel="stylesheet">
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

.textForm {
  border-bottom: 2px solid #adadad;
  padding: 15px 15px;
  text-align: left;
}
.btn {
  position:relative;
  margin-top: 40px;
  margin-bottom: 40px;
  width:50%;
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

.btn:hover {
  background-position: right;
}
</style>
</head>
<body>
   <jsp:include page="../common/header.jsp" />
   <center>
      <div>
         <h1>회원 탈퇴</h1><br><br>
         <form class="joinForm" action="/member/delete" method="post">
            <div class="textForm">
               <input name="mid" value="${mid}" readonly="readonly" type="hidden">
            </div>
            <div class="textForm">
               PW : <input type="password" name="mpw" placeholder="비밀번호 입력"><br>
            </div>
            <div>
               <button class="btn">탈퇴 완료</button>
            </div>
            
         </form>
      </div>
   </center>


</body>
</html>