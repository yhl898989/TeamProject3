<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<div style="height: 54.5px;">
</div>

   <h2 align="center" style="margin-top: 5%;">내 주문 내역</h2>
<div>
	<table class="order_table">
	                    	<colgroup>
	                    		<col width="16%">
	                    		<col width="10%">
	                    		<col width="10%">
	                    		<col width="10%">
	                    		
	                    		
	                    	</colgroup>
	                    		<thead>
	                    			<tr>
	                    				<td class="th_column_1">주문 번호</td>
	                    				<td class="th_column_2">주문 아이디</td>
	                    				<td class="th_column_3">주문 날짜</td>
	                    				<td class="th_column_4">주문 상태</td>
	                    				
	                    			</tr>
	                    		</thead>
	<c:forEach items="${olist}" var="list">
		<tr>
			<td class="th_column_1"><a href="/order/orderRead/${list.orderId}">${list.orderId}</a></td>
			<td class="th_column_2">${list.mid}</td>
			<td class="th_column_3"><fmt:formatDate pattern="yyyy-MM-dd" value="${list.orderDate}"></fmt:formatDate></td>
			<td class="th_column_4">
				<c:if test="${list.orderState == '배송준비' }">
						<span>${list.orderState}</span> 
				</c:if>
				<c:if test="${list.orderState == '배송완료' }">
						<span style="color:blue">${list.orderState}</span> 
				</c:if>
				<c:if test="${list.orderState == '주문취소' }">
						<span style="color:red">${list.orderState}</span> 
				</c:if>
			</td>
		</tr>
	</c:forEach>
	</table>
 <ul class="pagination nav justify-content-center bg-light">
    <li class="page-item">
      <a class="page-link" href="/myorderList/${mid}?curpage=${pt.curPage <=1? 1: pt.curPage-1}">&laquo;</a>
    </li>
    
    <c:forEach begin="${pt.beginPageNum }" end="${pt.finishPageNum}" var="page">
    	<c:if test="${page == pt.curPage }">
    		  <li class="page-item active" aria-current="page">
			  	  <a class="page-link" href="/myorderList/${mid}?curpage=${pt.curPage }">${page }</a>
		      </li>
    	</c:if>
    	<c:if test="${page != pt.curPage }">
		    <li class="page-item">
		    	<a class="page-link" href="/myorderList/${mid}?curpage=${page }">${page}</a>
		    </li>

    	</c:if>	   	
    
    </c:forEach>
    <li class="page-item">
      <a class="page-link" href="/myorderList/${mid}?curpage=${pt.curPage >= pt.totalPage? pt.curPage:pt.curPage+1 }">&raquo;</a>
    </li>
  </ul>
</div>
<div align="center" style="margin-top: 30px">
	<a class="btn btn-outline-dark goback" href="#" style="color: black">뒤로가기</a>
</div>	
	<script type="text/javascript">
	$(".goback").click(function() {
		history.go(-1);
	});
	</script> 
</body>
</html>