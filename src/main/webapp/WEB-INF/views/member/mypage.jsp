<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"	integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"	crossorigin="anonymous"></script>
<link href = "/resources/css/header.css" rel="stylesheet">
<style type="text/css">

.mybody{

	position: absolute;
	width: 400px;
	height: 400px;
	padding: 30px, 20px;
	text-align: center;
	top: 37%;
	left: 50%;
	transform: translate(-50%, -50%);
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
	

	
<div class="mybody">

		<div class="form-group row textForm">
		    <label for="staticEmail" class="col-sm-3 col-form-label text-left">이름</label>
		    <div class="col-sm-9">
		      <input type="text" readonly class="form-control-plaintext insertInfo " id="staticEmail" value="${dto.mname}">
		    </div>
		  </div>
		  
  		<div class="form-group row textForm">
		    <label for="staticEmail" class="col-sm-3 col-form-label text-left">이메일</label>
		    <div class="col-sm-9">
		      <input type="text" readonly class="form-control-plaintext insertInfo " id="staticEmail" value="${dto.memail}">
		    </div>
		  </div>
		  
    		<div class="form-group row textForm">
		    <label for="staticEmail" class="col-sm-3 col-form-label text-left">번호</label>
		    <div class="col-sm-9">
		      <input type="text" readonly class="form-control-plaintext insertInfo " id="staticEmail" value="${dto.mphone}">
		    </div>
		  </div>
		  
    		<div class="form-group row textForm">
		    <label for="staticEmail" class="col-sm-3 col-form-label text-left">우편번호</label>
		    <div class="col-sm-9">
		      <input type="text" readonly class="form-control-plaintext insertInfo " id="staticEmail" value="${dto.maddress1}">
		    </div>
		  </div>
		  
    		<div class="form-group row textForm">
		    <label for="staticEmail" class="col-sm-3 col-form-label text-left">주소</label>
		    <div class="col-sm-9">
		      <input type="text" readonly class="form-control-plaintext insertInfo " id="staticEmail" value="${dto.maddress2}">
		    </div>
		  </div>
		  
    		<div class="form-group row textForm">
		    <label for="staticEmail" class="col-sm-3 col-form-label text-left">상세주소</label>
		    <div class="col-sm-9">
		      <input type="text" readonly class="form-control-plaintext insertInfo " id="staticEmail" value="${dto.maddress3}">
		    </div>
		  </div>
		  
      		<div class="form-group row textForm">
			    <label for="staticEmail" class="col-sm-3 col-form-label text-left">생일</label>
			    <div class="col-sm-9">
			      <input type="text" readonly class="form-control-plaintext insertInfo " id="staticEmail" value="${dto.mbirth}">
			    </div>
			  </div>   
			   		
  			<div class="form-group row textForm">
			    <label for="staticEmail" class="col-sm-3 col-form-label text-left">잔액</label>
			    <div class="col-sm-9">
			      <input type="text" readonly class="form-control-plaintext insertInfo " id="staticEmail" value="${dto.mmoney}">
			      <input name="chargemmoney" id="chargemmoney"> <input id="charge" type="submit" value="충전">
			    </div>
			  </div>
			  
			  		<a class="btn btn-outline-dark" href="/member/update/${dto.mid}">수정</a>
				<a class="btn btn-outline-dark" href="/member/delete/${dto.mid}">삭제</a>


  

	


	<input id="mmoney" type="hidden" value="${dto.mmoney}">
	</div>

	
	<script type="text/javascript">
	
	
	
	let formdata = new FormData();
	
	$(document).ready(function() {
		$("#charge").on("click", function() {
			let mmoney = $("#mmoney").val();
			let cargemmoney = $("#chargemmoney").val();
			let plusmoney = Number(mmoney) + Number(cargemmoney);
			formdata.append('mmoney',plusmoney);
			$.ajax({
				url:'/member/charge',
				type:'post',
				data: formdata,
				processData : false,
		         contentType : false,
		         dataType : "text",
				success:function(result){
					alert("충전 완료");
					location.assign("/member/mypage/"+${dto.mid});
				}
			});
		});
	});

</script>

</body>
</html>