<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<h1>회원 정보 자세히 보기</h1>
아이디 : ${dto.mid} <br>
이름 : ${dto.mname} <br>
잔액 : ${dto.mmoney}  &nbsp;  <input name="chargemmoney" id="chargemmoney"> <input id="charge" type="submit" value="충천"> <br> 
<a id="delete" href="#">삭제</a> <a href="/item/main">목록</a> 
<a href="/myorderList/${dto.mid}">주문 내용</a>


<input id ="mmoney" type="hidden" value = "${dto.mmoney}">
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
				location.href="/member/s_mypage/${dto.mid}";
			}
	});
});
});
	
	
	
	$(document).ready(function() {
		$("#delete").on("click", function() {
			if(confirm("정말 삭제하시겠습니까?") == true){
				location.href="/member/s_delete/";
			} else{
				return;
			}
		});
	});
	


</script>


</body>
</html>