<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
<div align="center" style="margin-top: 5%;">
<h1 style="margin-bottom: 5%;">관리자 페이지</h1>

 <a href="/admin/mlist"><img src="/resources/img/회원관리.png" width="200px"  height="200px"></a> <br>
<a href="/notice/list"><img src="/resources/img/공지사항.png" width="200px"  height="200px"></a>
 <img src="/resources/img/라인2.png" width="300px"  height="300px">
<a href="/item/adminlist"> <img src="/resources/img/상품관리.png" width="200px"  height="200px"> </a><br>
<a href="/orderList"> <img src="/resources/img/주문관리.png" width="200px"  height="200px"> </a>
<c:if test="${alogin.aauth == 2}">  
<a href="/order/orderSale">  <img src="/resources/img/매출현황.png" width="200px"  height="200px"> </a>
</c:if> 


</div>
 <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>