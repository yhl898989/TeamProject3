<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/orderRead.css"> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
﻿<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<link href = "/resources/css/header.css" rel="stylesheet">

 <!-- 다음주소 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="content_area">

	<div class="content_subject"><span>주문내역 변경</span></div>
	
		<div class="content_main">
		

			
		<!--주소 정보  -->	
			<div class="addressInfo_div">
				<div class="addressInfo_button_div">
					<button class="address_btn address_btn_1"  style="background-color: #3c3838;">주소록</button>
					
				</div>
				<div class="addressInfo_input_div_wrap">
				
					<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
						<table>
									<colgroup>
										<col width="25%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th>이름</th>
											<td>
												<input class="addressee_input" value="${odto.addressee}">
											</td>
										</tr>
										<tr>
											<th>주소</th>
											<td>
										
												<input class="address1_input" readonly="readonly" value="${odto.memberAddr1}"> <a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a><br>
												<input class="address2_input" readonly="readonly" value="${odto.memberAddr2}"><br>
												<input class="address3_input" readonly="readonly" value="${odto.memberAddr3}">
											</td>
										</tr>
									</tbody>
								</table>
							
					</div>	
				
				</div>
			
			</div>
			
		
			<!--상품 정보 -->
			<div class="orderGoods_div">
				<!-- 상품 종류 -->
					<div class="goods_kind_div">
						주문상품 
					</div>
				<!--상품 테이블  -->
				<table class="goods_subject_table">
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
		
						</colgroup>
						<tbody>
							<tr>
								<th>주문번호</th>						
								<th>상품 정보</th>
								<th>판매가</th>
								<th>배송 상태</th>
							</tr>
						</tbody>
				</table>
						
				<table class="goods_table" style="center-align">
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
						
							
						</colgroup>					
						<tbody>
							<tr>
								<td>${oidto.orderId}</td>				 								
								<td>${oidto.iName}</td> 
								<td>${oidto.iPrice}</td>
								<td>${odto.orderState}</td>
							</tr>
						</tbody>
					</table>
			</div>			
			
			
			<!-- 주문 종합 정보 -->
				<div class="total_info_div">
					<!-- 가격 종합 정보 -->
				
						<img src="/displayfile?filename=${oidto.ifilename}" alt="${oidto.ifilename}" style="height: 250px; width: 350px;">
					
		
				</div>	

				
					<div class="total_info_btn_div">
							<a class="order_btn order_update-btn" href="#" data-orderId ="${oidto.orderId }">수정완료</a> 
							<a class="order_btn goback" href="#" >수정취소</a> 

					</div>
				</div>	
			
				

		</div>  <!--메인 div  -->
</div> <!--전체 div  -->

		<form class="order_update_form" action="/order/update" method="post">
				<input name="orderId" type="hidden" id="orderId">
				<input name="addressee" type="hidden" id="addressee">
				<input name="memberAddr1" type="hidden" id="memberAddr1">
				<input name="memberAddr2" type="hidden" id="memberAddr2">
				<input name="memberAddr3" type="hidden" id="memberAddr3">


		</form>



<script>

	$(document).ready(function(){

		
		$(".goback").click(function() {
			history.go(-1);
		});
		
	});
	
	
	$(".order_update-btn").click(function() {
		
		let orderId = $(this).attr("data-orderId");


		
		$("#orderId").val(orderId);
		$("#addressee").val($(".addressee_input").val());
		$("#memberAddr1").val($(".address1_input").val());
		$("#memberAddr2").val($(".address2_input").val());
		$("#memberAddr3").val($(".address3_input").val());
		
		$(".order_update_form").submit();
		
		
		
	});

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
</body>
</html>