<%@page import="kr.co.dw.domain.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
   integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
   crossorigin="anonymous">

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
</head>
<body>
   <jsp:include page="../common/header.jsp" />
   <div class="jumbotron">
      <h1 class="text-center">QnA</h1>
   </div>
   <br>
   <br>
   <!-- 문맥태그. -->
   <style type="text/css">
.list_table tbody td.title {
   text-align: left;
}

.list_table {
   width: 80%;
   margin-left: 10%;
   margin-right: 10%;
}

.list_table tbody td {
   padding: 5px 0;
   text-align: center;
   border-bottom: 1px solid #e5e5e5;
}

.list_table tbody td.title {
   text-align: left;
}

.list_table thead th {
   border-top: 1px solid #e5e5e5;
   border-bottom: 2px solid #000000;
   padding: 5px 0;
   text-align: center;
   background: #eeeeee;
}

caption {
   padding-bottom: 30px;
}

.btn btn-primary {
   margin-left: 30px;
}
</style>
   <table class="list_table" ,border="1">
      <tr>
         <th>번호</th>
         <th>작성자</th>
         <th>제목</th>
         <th>작성일</th>
         <th>조회수</th>

      </tr>
      <c:forEach items="${list}" var="list">
         <colgroup>
            <col width="10%" />
            <col width="30%" />
            <col width="15%" />
            <col width="20%" />
            <col width="15%" />
         </colgroup>

         <tr>
            <td>${list.qno}</td>
            <td>${list.mid}</td>
            <td><a href="/qa/read/${list.qno}">${list.qtitle}</a>
            </td>
            <td>${list.qupdateday}</td>
            <td>${list.qreadcnt}</td>
         </tr>
      </c:forEach>
   </table>
   
   
   
   <a class="btn btn-primary" href="/qa/insert"> 글 쓰 기 </a>
   

    
   
</html>