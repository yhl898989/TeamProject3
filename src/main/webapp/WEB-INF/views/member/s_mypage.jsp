<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<link href="/resources/css/header.css" rel="stylesheet">

<style type="text/css">

.mybody{

   width: 500px;
   height: 400px;
   padding: 30px, 20px;
   text-align: center;
   top: 37%;
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
  margin-top: 2%;
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
  text-align: center;
}

.insertInfo {
  border:none;
  outline:none;
  color: #636e72;
  background: none;
  text-align: left;
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

</style>
</head>
<body>
   <jsp:include page="../common/header.jsp" />
   <h1>내 정보</h1>

	<center>
   <div class="mybody">

      <div class="form-group row textForm">
         <label for="staticEmail" class="col-sm-3 col-form-label text-left">아이디</label>
         <div class="col-sm-9">
            <input type="text" readonly class="form-control-plaintext insertInfo staticEmail"   value="${dto.mid}">
         </div>
      </div>

      <div class="form-group row textForm">
         <label for="staticEmail" class="col-sm-3 col-form-label text-left">이름</label>
         <div class="col-sm-9">
            <input type="text" readonly  class="form-control-plaintext insertInfo staticEmail"   value="${dto.mname}">
         </div>
      </div>

      <div class="form-group row textForm">
             <label for="staticEmail" class="col-sm-3 col-form-label text-left">잔액</label>
             <div class="col-sm-9">
               <input type="text" readonly class="form-control-plaintext insertInfo " class="staticEmail" id="mmoney2">
               <input name="chargemmoney" id="chargemmoney" type="number"> <input id="charge" type="submit" value="충전">
             </div>
           </div>
           
               <div class="form-group row textForm">
             <label for="staticEmail" class="col-sm-3 col-form-label text-left">포인트</label>
             <div class="col-sm-9">
               <input type="text" readonly class="form-control-plaintext insertInfo " class="staticEmail" id="mpoint">
             </div>
           </div>

      <a class="btn btn-outline-dark" href="#" id="delete">삭제</a>



   </div>
	</center>


   <input id="mmoney" type="hidden" value="${dto.mmoney}">
   <script type="text/javascript">
   $(document).ready(function() {
      
      //let mbirth = document.getElementById("mbirth");
      
      $("#charge").on("click", function() {
         let formdata = new FormData();
         
         let mmoney = $("#mmoney").val();
         let cargemmoney = $("#chargemmoney").val();
         let plusmoney = Number(mmoney) + Number(cargemmoney);

         
         if (chargemmoney.value == '') {
            alert("충전 할 금액을 입력하세요.");
            chargemmoney.focus();
            return false;
         }
         
         if (chargemmoney.value <= 0) {
            alert("충전 할 수 없는 금액입니다.");
            chargemmoney.focus();
            return false;
         }
            formdata.append('mmoney', plusmoney);
            $.ajax({
               url : '/member/charge',
               type : 'post',
               data : formdata,
               processData : false,
               contentType : false,
               dataType : "text",
               success : function(result) {
                  alert("충전 완료");
                  location.href = "/member/s_mypage/${dto.mid}";
               }
            });
         });
      });

      $(document).ready(function() {
         $("#delete").on("click", function() {
            if (confirm("정말 삭제하시겠습니까?") == true) {
               location.href = "/member/s_delete/";
            } else {
               return;
            }
         });
      });
      
      let t1 = ${dto.mmoney};
      let newt1 = t1.toLocaleString('ko-KR');
      console.log(newt1);
      let mmoney2 = document.getElementById("mmoney2");
      mmoney2.value = newt1+"원";
      
      let t2 = ${dto.mpoint};
      let newt2 = t2.toLocaleString('ko-KR');
      console.log(newt2);
      let mpoint = document.getElementById("mpoint");
      mpoint.value = newt2+" P";
      
   </script>


</body>
</html>