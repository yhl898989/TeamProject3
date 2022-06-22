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
<form action="/member/insert" method="post">
	ID : <input id="mid" name="mid"> <button type="button" onclick="idCheckFn()">아이디 중복확인</button> <br>
	PW : <input type="password" name="mpw"><br>
	이름 : <input name="mname"><br>
	이메일 : <input name="memail" type="email"><br>
	번호 : <input name="mphone"><br>
	우편번호 : <input name="maddress1" class="address1_input" readonly="readonly"> <a class="" onclick="execution_daum_address()">주소 찾기</a><br>
    주소 :     <input name="maddress2" class="address2_input" readonly="readonly" size="50"><br>
    상세주소 :     <input name="maddress3" class="address3_input" readonly="readonly" size="50">
	
	
	<!-- <input id="maddress"  name="maddress"> <button type="button" onclick="findAddr()">주소찾기</button> <br> -->
	<br>
	생일 : <input name="mbirth" type="date"><br>
	<input id="OK" type="submit" value="입력 완료">
</form>


<script>

/* 다음 주소 연동 */
function execution_daum_address(){
       console.log("동작");
      new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
               
              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                   addr += ' ';
                }
 
                // 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address1_input").val(data.zonecode);
                $(".address2_input").val(addr);            
                // 커서를 상세주소 필드로 이동한다.
                $(".address3_input").attr("readonly", false);
                $(".address3_input").focus();    
               
               
           }
       }).open();     
}


</script>

<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript">
/* function findAddr() {
	   new daum.Postcode({
	      
	       oncomplete: function(data) {
	            document.querySelector("#maddress").value =  data.address;
	             }
	      }).open();   
	   }
 */
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








</script>


</body>
</html>