<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/orderRead.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
﻿
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
	integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
	crossorigin="anonymous"></script>
<link href="/resources/css/header.css" rel="stylesheet">
</head>
<body>
	<header style="position: fixed; z-index: 10;">
<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div style="height: 54.5px;">
</div>

	<div class="content_area">

		<div class="content_subject" style="text-align: center;">
			<span>주문내역</span>
		</div>

		<div class="content_main">



			<!--주소 정보  -->
			<div class="addressInfo_div">
				<div class="addressInfo_button_div">
					<button class="address_btn address_btn_1" onclick="showAdress('1')"
						style="background-color: #3c3838;">주소록</button>

				</div>
				<div class="addressInfo_input_div_wrap">

					<div class="addressInfo_input_div addressInfo_input_div_1"
						style="display: block">
						<table>
							<colgroup>
								<col width="25%">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th>이름</th>
									<td>${odto.addressee}</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${odto.memberAddr1}<br> ${odto.memberAddr2}<br>
										${odto.memberAddr3}

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
					<div class="goods_kind_div">주문상품</div>
					<!--상품 테이블  -->
					<table class="goods_subject_table">
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<tbody>
							<tr>
								<th>주문번호</th>
								<th>상품 정보</th>
								<th>상품 개수</th>
								<th>판매가</th>
								<th>배송 상태</th>
							</tr>
						</tbody>
					</table>


					<table class="goods_table" style="">
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<tbody>
							<tr style="text-align: center;">
								<td>${oidto.orderId}</td>
								<td>${oidto.iName}</td>
								<td>${oidto.iCount}</td>
								<td>${oidto.iPrice}</td>
								<td>${odto.orderState}</td>
							</tr>
						</tbody>
					</table>
				</div>


				<div class="total_info_div">


					<img src="/displayfile?filename=${oidto.ifilename}"
						alt="${oidto.ifilename}" style="height: 250px; width: 350px;">


				</div>
			

			<div class="total_info_btn_div">

				<a class="btn btn-outline-dark goback" href="#">목록</a>

			</div>
		
		</div>



	</div>
	<!--메인 div  -->
	</div>
	<!--전체 div  -->

	<form class="delete_form" action="/order/orderCancle2" method="post">
		<input type="hidden" name="mid" value="${odto.mid}"> <input
			type="hidden" name="orderId" value="${oidto.orderId}">


	</form>


	<script type="text/javascript">
		$(document).ready(function() {

			$(".goback").click(function() {
				history.go(-1);
			});

		});
	</script>
</body>
</html>