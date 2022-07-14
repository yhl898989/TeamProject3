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
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"   integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"   crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script   src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
<script   src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.bundle.min.js"></script>
<link href = "/resources/css/header.css" rel="stylesheet">

</head>
<body>
      <header style="position: fixed; z-index: 10;">
<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div style="height: 54.5px;">
</div>
   <h4 style="text-align: center; margin-top: 1%">전체 주문 내역</h4>
   <div>
   <table class="order_table">
      <colgroup>
         <col width="160px">
         <col width="160px">
         <col width="500px">
         <col width="200px">
      </colgroup>
      <thead>
         <tr>
            <td class="th_column_1">총 매출</td>
            <td class="th_column_2">오늘 매출</td>
            <td class="th_column_3">선택 매출</td>
            <td class="th_column_4">매출 결과</td>
         </tr>
      </thead>
      <tbody class="order_body">
         <tr>
            <td class="th_column_1" id="td1"> </td>
            <td class="th_column_2" id="td2"> </td>
            <td class="th_column_3">
               <div id="reportrange" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 360px; float: left;">
                  <i class="fa fa-calendar"></i>&nbsp; <span id="span1"></span> <span></span>
                  <span id="span2"></span> <i class="fa fa-caret-down"></i>
              </div> <div style="width: 0px; float: left; margin-left: 10px"><input id="submit" type="submit" value="입력" style="margin-top: 5px; width: 95px;"></div><div style="float: right; width: 0px">  </div>
            </td>
            <td class="th_column_4"><input id="sale"></td>
         </tr>
      </tbody>
   </table>
   <br>
   </div>
   <center>
      <h1>금일 품목 별 매출</h1>
   <div style="width: 900px; height: 500px;">
      <!--차트가 그려질 부분-->
      <canvas id="myChart3"></canvas>
   </div>

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
                           'Last 7 Days' : [ moment().subtract(6, 'days'),   moment() ],
                           'Last 30 Days' : [ moment().subtract(29, 'days'), moment() ],
                           'This Month' : [ moment().startOf('month'),   moment().endOf('month') ],
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
            let nu = parseInt(sale)
            let sales = nu.toLocaleString('ko-KR');
            $("#sale").val(sales+"원");

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
                  label : '월별 총 매출   ', //차트 제목
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
   
   let labels3 = "${arr}".substring(1, "${arr}".length - 1).split(", ");
   console.log(labels3);
   let data3 = "${category}".substring(1, "${category}".length - 1)
         .split(", ");
   console.log(data3);

   let context3 = document.getElementById('myChart3').getContext('2d');
   let myChart3 = new Chart(context3,
         {
            type : 'pie', // 차트의 형태
            data : { // 차트에 들어갈 데이터
               labels : labels3,
               datasets : [ { //데이터
                  label : '7일간 매출 현황', //차트 제목
                  fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                  data : data3,
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
                  tension : 0
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
let allprice = ${allprice}
let toprice = ${toprice}
let LocaleAllPrice = allprice.toLocaleString('kr-KO');
let LocaleToPrice = toprice.toLocaleString('kr-KO');
$("#td1").text(LocaleAllPrice+"원");
let donqwer = document.getElementById("td2");
donqwer.innerText = LocaleToPrice+"원";

console.log(LocaleAllPrice)
console.log(LocaleToPrice)

</script>
</html>