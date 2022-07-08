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
      <h1 class="text-center">QnA</h1>
   </div>
   <br>
   <br>
   <!-- 문맥태그. -->
<style type="text/css">

table {
	border-collapse: collapse;
	width: 100%;
	text-align:center;
	border:2px solid;
	}
th, td {
padding: 10px;
border-bottom: 1px solid #CD5C5C;
}
tr:nth-child(2n+0){backgroundcolor-color:green;}

tr:hover { background-color: #F5F5F5; }

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
#btn_group{
	left:700px;
	display:flex;
	justify-content:center;
	align-items:center;
}
.th{
	left:100px;
}
#btn_group button{
	border-top-left-radius:5px;
	border-bottom-left-radius:5px;
	margin-right: -4px;
	height: 100px;
	width: 150px;
	font-size : 20px;
}
#searchcenter{
	left:700px;
	display:flex;
	justify-content:center;
	align-items:center;
	text-align: center;
}
.th{
font-size : 12px;
}

.searchcss{
	align-items: center;
	margin-left: 40%;
	margin-right: 20%;
}
</style>

</head>

<div id="btn_group">
	<button id="btn_1" onclick="noticelist()">공지사항</button>
	<button id="btn_2" onclick="qnalist()">QNA</button>
</div>
<br>
<br>
<br>

<table class="list_table" ,border="1">
   		<c:if test="${category=='notice'}">
   		
   			<h1>공지사항</h1>
   		</c:if>
   		<c:if test="${category=='qna'}">
   		
   			<h1>QNA</h1>
   		</c:if>
   		

  
 <table class="list_table" border="1">
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
            <td>${blist.qno}</td>
            <td>${blist.mid}</td>
            <td><a class="qtitle" data-qno="${blist.qno}" data-mid="${blist.mid}" href="#">${blist.qtitle}</a>
            </td>
            <td>${blist.qupdateday}</td>
            <td>${blist.qreadcnt}</td>
         </tr>
      </c:forEach>
   </table>
	<br>
      <a class="btn btn-primary" href="/qa/insert" style="margin-left: 1032px"> 글 쓰 기 </a>
      <br>
      <br>
      
      <center>
<a href = "/qa/list?curPage=${pt.curPage > 1? pt.curPage -1:1}">&laquo;</a>
   
   <c:forEach var = "i" begin="${pt.beginPageNum}" end = "${pt.finishPageNum }">
   <a href = "/qa/list?curPage=${i}" class = "${i == pt.curPage?'red':""}">
   
   ${i}
   
   
   
   </a> &nbsp;&nbsp;
   
   </c:forEach>
   <a href = "/qa/list?curPage=${pt.curPage < pt.totalPage? pt.curPage + 1 : pt.totalPage}">&raquo;</a>
</center> 
<br>
<br>
<br>


<form action="/qa/search" method="get">
<div class="searchcss">
<div class="input-group mb-3">
  <select name="criteria">
  	<option selected>검색 조건</option>
  	<option value="mid">작성자</option>
  	<option value="qtitle">제목</option>
  	<option value="qcontent">내용</option>
  </select>
  <input type="form-control" name="keyword">
  <div class="input-group-append">
    <button class="btn btn-info" type="submit">검색</span>
  </div>
</div>
</div>
</form>
      
<%-- <c:if test="${page.startnum}">
		<span>{ <a href="/notice/list?curPage=${page.beginPageNum - 1}">이전</a> }</span>
	</c:if>
	
	<c:forEach begin="${page.beginPageNum}" end="${page.finishedPageNum}" var="num">

	</c:forEach>

	
	<c:if test="${page.next}">
		<span>{ <a href="/notice/listPage?num=${page.endPageNum + 1}">다음</a> }</span>
	</c:if> --%>
		
	<script type="text/javascript">
	
		$("body").on("click", ".qtitle", function(event) {
			event.preventDefault();
			
			
			let mid = "${login.mid}";
			let alogin = "${alogin}";
			let userId = $(this).attr("data-mid");
			let qno = $(this).attr("data-qno");
			
			
			
			
			if(mid == userId || alogin != ""){
				location.href="/qa/read/"+qno;
			}else{
				location.href="/member/loginui";
			}
			
		});

		function noticelist(){
			location.assign("/notice/list?category=free");
		}
		function qnalist(){
			location.assign("/qa/list?category=qna");
		}
 	</script>
 
</body>
</html>