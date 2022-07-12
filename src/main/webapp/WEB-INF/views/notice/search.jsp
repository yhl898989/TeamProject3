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
<link href = "/resources/css/header.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/noticesearch.css"> 
<style type="text/css">
</style>
</head>

<body>
   <jsp:include page="../common/header.jsp" />
   <div class="jumbotron">
      <h1 class="text-center">공지사항</h1>
   </div>
   <br>
   <br>

<div id="btn_group">
	<button id="btn_1" onclick="noticelist()">공지사항</button>
	<button id="btn_2" onclick="qnalist()">QNA</button>
</div>
<br>
<br>
<br>

<table class="table">
	<thread style="background:#eee">
      <tr>
         <th>번호</th>
         <th>작성자</th>
         <th>제목</th>
         <th>작성일</th>
         <th>조회수</th>

      </tr>
     </thread>
      <c:forEach items="${pt.list}" var="blist">
         <colgroup>	
            <col width="12%" />
            <col width="16%" />
            <col width="42%" />
            <col width="20%" />
            <col width="10%" />
         </colgroup>

         <tr>
            <td>${blist.nno}</td>
            <td>${blist.aid}</td>
            <td><a href="/notice/read/${blist.nno}">${blist.ntitle}</a>
            </td>
            <td>${blist.nupdateday}</td>
            <td>${blist.nreadcnt}</td>
         </tr>
      </c:forEach>
   </table>
   		<c:if test="${(not empty alogin)}">
      <a class="btn btn-primary" href="/notice/insert"> 글 쓰 기 </a>
      	</c:if>
      <br>
      <br>



<div class="pagecss">
      <nav aria-label="Page navigation example">
      <ul class="pagination">
       <li class="page-item disabled">
		<a class="page-link" href = "/notice/list?curPage=${pt.curPage > 1? pt.curPage -1:1}">Previous</a>
   	   </li>
   <c:forEach var = "i" begin="${pt.beginPageNum}" end = "${pt.finishPageNum }">
    <li class="${i == pt.curPage?'page-item active':'page-item'}" aria-current = "${i == pt.curPage?'page':''}">
   <a href = "/notice/list?curPage=${i}" class = "page-link">
   
   ${i}
   
   
   
   </a></li>
   
   </c:forEach>
   <li class="page-item">
   <a class="page-link" href = "/notice/list?curPage=${pt.curPage < pt.totalPage? pt.curPage + 1 : pt.totalPage}">Next</a>
    </li>
    </ul>
    </nav>  
</div>
<br>
<br>
<br>


      
<%-- <c:if test="${page.startnum}">
		<span>{ <a href="/notice/list?curPage=${page.beginPageNum - 1}">이전</a> }</span>
	</c:if>
	
	<c:forEach begin="${page.beginPageNum}" end="${page.finishedPageNum}" var="num">

	</c:forEach>

	
	<c:if test="${page.next}">
		<span>{ <a href="/notice/listPage?num=${page.endPageNum + 1}">다음</a> }</span>
	</c:if> --%>

	<script type="text/javascript">

		function noticelist(){
			location.assign("/notice/list?category=free");
		}
		function qnalist(){
			location.assign("/qa/list?category=qna");
		}
 	</script>
</body>
</html>