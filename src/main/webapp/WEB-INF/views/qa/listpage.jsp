<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/qalistpage.css">
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
<link href="/resources/css/noticeqa.css" rel="stylesheet">



<!-- 문맥태그. -->
<style type="text/css">
td {
	border: none;
}

body {
	width: 1190px;
}
/* .jumbotron {
 background-image: url("../../../resources/img/sky.jpg");
} */
</style>

</head>

<body>


	<header style="position: fixed; z-index: 10;">
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<div style="height: 54.5px;"></div>
	<div class="jumbotron">

		<ul id="noticeposition" class="nav justify-content-start bg-light">
			<li class="nav-item"><img
				src="../../../resources/img/questionpicture.jpg" alt="물음표"
				width="150px" height="150px" align="middle"></li>
			<li class="nav-item" style="text-align: center margin-top:80px;">
				<br> <br>
				<h1 class="text-center" align="middle">&nbsp QnA</h1>
			</li>

		</ul>
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
		<colgroup>
			<col width="12%" />
			<col width="16%" />
			<col width="42%" />
			<col width="20%" />
			<col width="10%" />
		</colgroup>
		<thead style="background: #eee">
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>

			</tr>
		</thead>
		<c:forEach items="${pt.list}" var="blist">


			<tr>
				<td>${blist.qno}</td>
				<td>${blist.mid}</td>
				<td><a class="qtitle" data-qno="${blist.qno}"
					data-mid="${blist.mid}" href="#">${blist.qtitle}</a></td>
				<td>${blist.qupdateday}</td>
				<td>${blist.qreadcnt}</td>
			</tr>
		</c:forEach>
	</table>
	<br>

	<div class="text-right">
		<c:if test="${(not empty login)}">
			<a class="btn btn-primary" href="/qa/insert"> 글 쓰 기 </a>
		</c:if>
		<c:if test="${(empty login)}">
			<a class="btn btn-primary" href="#" style="visibility: hidden;"> 글 쓰 기 </a>
		</c:if>
	</div>

	<br>

	<form action="/qa/search" method="get">
		<div class="searchcsss">
			<div class="input-group mb-35">
				<select name="criteria">
					<option selected>검색 조건</option>
					<option value="mid">작성자</option>
					<option value="qtitle">제목</option>
					<option value="qcontent">내용</option>
				</select> <input class="form-control" name="keyword">
				<div class="input-group-append">
					<button class="btn btn-info" type="submit">검색</button>
				</div>
			</div>
		</div>
	</form>
	<br>
	<div class="pagecss">
		<nav aria-label="...">
			<ul class="pagination">
				<li class="page-item disabled"><a class="page-link"
					href="/qa/list?curPage=${pt.curPage > 1? pt.curPage -1:1}">&laquo;</a>
				</li>
				<c:forEach var="i" begin="${pt.beginPageNum}"
					end="${pt.finishPageNum }">
					<li class="${i == pt.curPage?'page-item active':'page-item'}"
						aria-current="${i == pt.curPage?'page':''}"><a
						href="/qa/list?curPage=${i}" class="page-link"> ${i} </a></li>

				</c:forEach>
				<li class="page-item"><a class="page-link"
					href="/qa/list?curPage=${pt.curPage < pt.totalPage? pt.curPage + 1 : pt.totalPage}">&raquo;</a>
				</li>
			</ul>
		</nav>
	</div>


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

			if (mid == userId || alogin != "") {
				location.href = "/qa/read/" + qno;
			} else {
				location.href = "/member/loginui";
			}

		});

		function noticelist() {
			location.assign("/notice/list?category=free");
		}
		function qnalist() {
			location.assign("/qa/list?category=qna");
		}
	</script>

</body>
</html>