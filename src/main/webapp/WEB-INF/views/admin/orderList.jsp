<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert  here</title>
<link rel="stylesheet" href="/resources/css/orderList.css"> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
﻿<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<link href = "/resources/css/header.css" rel="stylesheet">
</head>
<body>
<header style="position: fixed; z-index: 10;">
<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div style="height: 54.5px;"></div>
<br>
<center>

<h4 style="margin-top: 2%; text-align: center;"> 전체 주문 내역 </h4>

</center>
<div>
   <table class="order_table">
                          <colgroup>
                             <col width="300px;">
                             <col width="200px;">
                             <col width="180px;">
                             <col width="160px;">
                             <col width="140px;">
                             <col width="140px;">
                          </colgroup>
                             <thead>
                                <tr>
                                   <td class="th_column_1">주문 번호</td>
                                   <td class="th_column_2">주문자 아이디</td>
                                   <td class="th_column_3">주문 날짜</td>
                                   <td class="th_column_4">주문 상태</td>
                                   <td class="th_column_5">완료</td>
                                   <td class="th_column_6">취소</td>
                                </tr>
                             </thead>
                             <tbody class="order_body">
                           <c:forEach items="${olist}" var="list">
                              <tr>
                                 <td class="th_column_1"><a href="/order/orderRead2/${list.orderId}">${list.orderId}</a></td>
                                 <td class="th_column_2">${list.mid}</td>
                                 <td class="th_column_3"><fmt:formatDate pattern="yyyy-MM-dd" value="${list.orderDate}"></fmt:formatDate></td>
                                 <td class="th_column_4">${list.orderState}</td>
                                 <td class="th_column_5">
                                    <c:if test="${list.orderState == '배송준비' }">
                                    <button data-orderId = "${list.orderId}"  data-savePoint = "${list.savePoint}" data-mid = "${list.mid}"  id = "order_update_btn">완료</button>
                                    </c:if>
                                 </td>
                                 <td class="th_column_6">
                                    <c:if test="${list.orderState == '배송준비'&& list.mid !='탈퇴한회원' }">
                                    
                                        <button data-orderId = "${list.orderId}" data-mid = "${list.mid }"  id = "order_delete_btn">삭제</button> 
                                    </c:if>
                                 </td>
                              </tr>
                           </c:forEach>
                        </tbody>
         </table>



  <ul class="pagination nav justify-content-center bg-light">
    <li class="page-item">
      <a class="page-link" href="/orderList?curpage=${pt.curPage <=1? 1: pt.curPage-1}">&laquo;</a>
    </li>
    
    
    <c:forEach begin="${pt.beginPageNum }" end="${pt.finishPageNum}" var="page">
       <c:if test="${page == pt.curPage }">
            <li class="page-item active" aria-current="page">
                <a class="page-link" href="/orderList?curpage=${pt.curPage }">${page }</a>
            </li>
       </c:if>
       <c:if test="${page != pt.curPage }">
          <li class="page-item">
             <a class="page-link" href="/orderList?curpage=${page }">${page}</a>
          </li>
       </c:if>         
    </c:forEach>
    

    <li class="page-item">
      <a class="page-link" href="/orderList?curpage=${pt.curPage >= pt.totalPage? pt.curPage:pt.curPage+1 }">&raquo;</a>
    </li>
  </ul>

<br><br><br><br><br><br>
 
 <div style="margin: 1% 15% 1% 15%">
 <table class="order_table">
                          <colgroup>
                             <col width="20%">
                             <col width="16%">               
                          </colgroup>
                             <thead>
                                <tr>
                                   <td class="th_column_1">총 매출</td>
                                   <td class="th_column_2">오늘 매출</td>
                                </tr>
                             </thead>
                             <tbody class="order_body">
                        
                              <tr>
                                 <td class="td_column_1" id="td1"></td>
                                 <td class="td_column_2" id="td2"></td>               
                              </tr>
                        
                        </tbody>
         </table>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">주문을 취소 하시겠습니까 ??</span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
         <div class="modal-body">
            <div class="form-group">
               주문번호: <input id="order_input_delete_orderId" class="form-control" value="홍길동">
            </div>
            <div class="form-group">
               주문고객: <input id="order_input_delete_mid" class="form-control" value="똥">
            </div>
         </div>
            <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button id="order_btn_delete_submit" type="button" class="btn btn-primary" data-dismiss="modal">주문 취소</button>
      </div>
    </div>
  </div>
</div>
</div>         
         
</body>

<script type="text/javascript">


$(".order_body").on("click", "#order_delete_btn", function() {
    $("#myModal").modal("show");
    
    
    let orderId = $(this).attr("data-orderId");
    let mid = $(this).attr("data-mid");

    
    
    $("#order_input_delete_orderId").val(orderId);
    $("#order_input_delete_mid").val(mid);


    
 });






$("#order_btn_delete_submit").click(function() {

   let orderId = $("#order_input_delete_orderId").val();
   let mid = $("#order_input_delete_mid").val();

   
   
   let formData = new FormData();
   formData.append("orderId",orderId);
   formData.append("mid",mid);

$.ajax({
      
      type : "post",
      url : "/order/orderCancle",
      data : formData,
      processData : false,
      contentType : false,
      dataType : "text",
      success : function(result) {
         if(result == "SUCCESS"){
            location.assign("/orderList");
         }
      }
   
   })
   
   
});


/* $(".order_body").on("click","#order_delete_btn", function() {

   let orderId = $(this).attr("data-orderId");
   let mid = $(this).attr("data-mid");
   
   
   let formData = new FormData();
   formData.append("orderId",orderId);
   formData.append("mid",mid);
   console.log(formData)
$.ajax({
      
      type : "post",
      url : "/order/orderCancle",
      data : formData,
      processData : false,
      contentType : false,
      dataType : "text",
      success : function(result) {
         if(result == "SUCCESS"){
            location.assign("/admin/orderList");
         }      
      }
   
   })
   

});  */



$(".order_body").on("click","#order_update_btn", function() {
   let orderId = $(this).attr("data-orderId");
   let savePoint = $(this).attr("data-savePoint");
   let mid = $(this).attr("data-mid");
   let formData = new FormData();
   formData.append("orderId",orderId);
   formData.append("savePoint",savePoint);
   formData.append("mid",mid);
$.ajax({
      type : "post",
      url : "/order/check",
      data : formData,
      processData : false,
      contentType : false,
      dataType : "text",
      success : function(result) {
         if(result == "SUCCESS"){
            location.assign("/orderList");
         }      
      }
   })

})



let t1 = ${allprice};
let Newt1 = t1.toLocaleString('ko-KR'); 
let td1 = document.getElementById("td1");
td1.innerText = Newt1+"원";

let t2 = ${toprice};
let Newt2 = t2.toLocaleString('ko-KR');
let td2 = document.getElementById("td2");
td2.innerText = Newt2+"원"; 
</script>



</html>