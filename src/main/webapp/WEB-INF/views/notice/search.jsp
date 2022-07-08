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

<body>
   <jsp:include page="../common/header.jsp" />
   <div class="jumbotron">
      <h1 class="text-center">공지사항</h1>
   </div>
   <br>
   <br>
   <!-- 문맥태그. -->
<style type="text/css">
#btn_1{
		border-top-left-radius:5px;
		border-bottom-left-radius:5px;
		margin-right: -4px;
	}
	
#btn_2{
		margin-left: -3px;
		margin-right: -4px;
		
	
}
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
ul {
			list-style: none;
			width : 30%;
			display: inline-block;
		}
		
		li {
			float: left;
			margin-left : 5px;
		}
.red{
	color : red;
}		
</style>
</head>


<div id="btn_group">
	<button id="btn_1" onclick="noticelist()">공지사항</button>
	<button id="btn_2" onclick="qnalist()">QNA</button>
</div>

<table class="list_table" ,border="1">
   		<c:if test="${category=='notice'}">
   		
   			<caption><h1>공지사항</h1></caption>
   		</c:if>
   		<c:if test="${category=='qna'}">
   		
   			<caption><h1>QNA</h1></caption>
   		</c:if>
   		
      <tr>
         <th>번호</th>
         <th>작성자</th>
         <th>제목</th>
         <th>작성일</th>
         <th>조회수</th>

      </tr>
      <c:forEach items="${pt.list}" var="blist">
         <colgroup>	
            <col width="10%" />
            <col width="30%" />
            <col width="15%" />
            <col width="20%" />
            <col width="15%" />
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
      


      
<nav aria-label="...">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="/notice/search?curpage=${pt.curPage <= 1? 1 :  pt.curPage-1}&criteria=${criteria}&keyword=${keyword}">Previous</a>
    </li>
    
    
    <c:forEach begin="${pt.beginPageNum}" end="${pt.finishPageNum}" var="page">
    	<c:if test="${page == pt.curPage}">
    	<li class="page-item active" aria-current="page">
      		<a class="page-link" href="/notice/search?curpage=${pt.curPage}&criteria=${criteria}&keyword=${keyword}">${page}</a>
    	</li>
    	</c:if>
    	
    	<c:if test="${page != pt.curPage}">
    	<li class="page-item">
    		<a class="page-link" href="/notice/search?curpage=${page}&criteria=${criteria}&keyword=${keyword}">${page}</a>
    	</li>
    	</c:if>
    </c:forEach>
    
    
    <li class="page-item">
      <a class="page-link" href="/notice/search?curpage=${pt.curPage >= pt.totalPage? pt.totalPage : pt.curPage+1}&criteria=${criteria}&keyword=${keyword}">Next</a>
    </li>
  </ul>
</nav>
      
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