<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert here</title>
<link rel="stylesheet" href="/resources/css/orderList.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
﻿
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"	integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"	crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script	src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<h5>전체 주문 내역</h5>
	<table class="order_table">
		<colgroup>
			<col width="20%">
			<col width="16%">
		</colgroup>
		<thead>
			<tr>
				<td class="th_column_1">총 매출</td>
				<td class="th_column_2">오늘 매출</td>
				<td class="th_column_2">선택 매출</td>
			</tr>
		</thead>
		<tbody class="order_body">
			<tr>
				<td class="th_column_1">${allprice}</td>
				<td class="th_column_2">${toprice}</td>
				<td class="th_column_2">
					<div id="reportrange" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
						<i class="fa fa-calendar"></i>&nbsp; <span id="span1"></span> <span></span>
						<span id="span2"></span> <i class="fa fa-caret-down"></i>
					</div> <input id="submit" type="submit" value="입력"><br> <br>
					매출 결과: <input id="sale">


				</td>

			</tr>

		</tbody>
	</table>
	<br>
	
	<center>
	<h1>7일간 매출 현황</h1>
	
	<div style="width: 900px; height: 500px;">
		<!--차트가 그려질 부분-->
		<canvas id="myChart1"></canvas>
	</div>
	
	<h1>월별 총 매출</h1>
	<div style="width: 900px; height: 500px;">
		<!--차트가 그려질 부분-->
		<canvas id="myChart2"></canvas>
	</div>
	</center>
	<!--  
	<table = class="order_table">
		<colgroup>
			<col width="20%">
			<col width="40%">
		</colgroup>
		<thead>
			<tr>
				<th class="th_columns_1">날짜</th>
				<th class="th_columns_2">가격</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach begin="0" end="${Month.size() -1}" var="idx">
				<tr>
					<td>${Month.get(idx)}</td>
					<td>${MonthSales.get(idx)}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	-->
	
	<table class="order_table">
		<colgroup>
			<col width="50%">
		</colgroup>
		<thead>
			<th class="th_columnss_1">당일 결제 주문 금액</th>
		</thead>
		<tbody>
			<c:forEach items="${todaytotal}" var="todayDto">
				<tr>
					<td>${todayDto}원</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>

<script type="text/javascript">
	$(document).ready(
			function() {
				$(function() {

					var start = moment().subtract(29, 'days');
					var end = moment();

					function cb(start, end) {
						$('#reportrange span:eq(0)').html(
								start.format('YYYY-MM-DD'));
						$('#reportrange span:eq(1)').html(' - ');
						$('#reportrange span:eq(2)').html(
								end.format('YYYY-MM-DD'));
					}

					$('#reportrange').daterangepicker(
							{
								startDate : start,
								endDate : end,
								ranges : {
									'Today' : [ moment(), moment() ],
									'Yesterday' : [ moment().subtract(1, 'days'), moment().subtract(1, 'days') ],
									'Last 7 Days' : [ moment().subtract(6, 'days'),	moment() ],
									'Last 30 Days' : [ moment().subtract(29, 'days'), moment() ],
									'This Month' : [ moment().startOf('month'),	moment().endOf('month') ],
									'Last Month' : [ moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month') ]
								}
							}, cb);

					cb(start, end);

				});

			});

	$("#submit").click(function() {

		var val = "";
		var val2 = "";
		val = document.getElementById('span1').innerHTML;
		val2 = document.getElementById('span2').innerHTML;

		let formData = new FormData();
		formData.append("start", val);
		formData.append("end", val2);
		$.ajax({

			type : "post",
			url : "/order/sale",
			data : formData,
			processData : false,
			contentType : false,
			dataType : "text",
			success : function(sale) {
				console.log(sale)
				$("#sale").val(sale);

			}

		})

	});

	let labels1 = "${list}".substring(1, "${list}".length-1).split(", ");
	let data1 = "${salesday}".substring(1, "${salesday}".length-1).split(", ");
	
	// chart.js
	
	let context1 = document.getElementById('myChart1').getContext('2d');
	let myChart1 = new Chart(context1,
			{
				type : 'line', // 차트의 형태
				data : { // 차트에 들어갈 데이터
					labels : labels1,
					datasets : [ { //데이터
						label : '7일간 매출 현황', //차트 제목
						fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data : data1,
						backgroundColor : [
						//색상
						'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [
						//경계선 색상
						'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1,
						tension: 0
					//경계선 굵기
					} /* ,
					     {
							   label: 'test2',
						       fill: false,
						       data: [
						       8, 34, 12, 24
						       ],
						       backgroundColor: 'rgb(157, 109, 12)',
							   borderColor: 'rgb(157, 109, 12)'
						  } */
					]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
	
	
	
	
	
	let tmp1 = "${Month}".substring(1, "${Month}".length-1).split(", ");
	let labels2 = [];
	for (let i = tmp1.length-1; i >= 0; i--) {
		labels2.push(tmp1[i]);
	}
	
	let tmp2 = "${MonthSales}".substring(1, "${MonthSales}".length-1).split(", ");
	let data2 = [];
	for (let i = tmp2.length-1; i >= 0; i--) {
		data2.push(tmp2[i]);
	}
	
	// chart.js	
	
	let context2 = document.getElementById('myChart2').getContext('2d');
	let myChart2 = new Chart(context2,
			{
				type : 'bar', // 차트의 형태
				data : { // 차트에 들어갈 데이터
					labels : labels2,
					datasets : [ { //데이터
						label : '월별 총 매출	', //차트 제목
						fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data : data2,
						backgroundColor : [
						//색상
							'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)'
							],
						borderColor : [
						//경계선 색상
							'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)',
							'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)',
							'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)',
							'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)'
							],
						borderWidth : 1
					//경계선 굵기
					} /* ,
					     {
							   label: 'test2',
						       fill: false,
						       data: [
						       8, 34, 12, 24
						       ],
						       backgroundColor: 'rgb(157, 109, 12)',
							   borderColor: 'rgb(157, 109, 12)'
						  } */
					]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
	
	
</script>
</html>