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
<center>
<h1>관리자 페이지</h1>
<br>
<table border="1px">
	<h3>일반회원 관리</h3>
	<thead style="text-align: center ">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>번호</th>
			<th>주소</th>
			<th>생일</th>
		</tr>
	</thead>
	
	<tbody style="text-align: center">
	<c:forEach items="${pt.list}" var="dto">
		<tr>
			<td width="100"><a href="/member/mypage/${dto.mid}">${dto.mid}</a></td>
			<td width="100">${dto.mpw}</td>
			<td width="100">${dto.mname}</td>
			<td width="150">${dto.memail}</td>
			<td width="150">${dto.mphone}</td>
			<td width="400">${dto.maddress1} / ${dto.maddress2} / ${dto.maddress3}</td>
			<td width="200">${dto.mbirth}</td>
			<td width="100"><a href="/member/update/${dto.mid}">수정</a></td>
			<td width="100"><a href="/member/delete/${dto.mid}">삭제</a></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<br>

<form action="/admin/search" method="get">
	<select name = "criteria">
		<option value = "mid">회원 아이디</option>
		<option value = "mname">회원 이름</option>
	</select>
	<input name = "keyword">
	<input type = "submit" value = "검색">
	</form>
	
<center>
<a href = "/admin/mlist?curPage=${pt.curPage > 1? pt.curPage -1:1}">&laquo;</a>
	
	<c:forEach var = "i" begin="${pt.beginPageNum}" end = "${pt.finishPageNum }">
	<a href = "/admin/mlist?curPage=${i}" class = "${i == pt.curPage?'red':""}">
	
	${i}
	
	
	</a> &nbsp;&nbsp;
	
	</c:forEach>
	<a href = "/admin/mlist?curPage=${pt.curPage < pt.totalPage? pt.curPage + 1 : pt.totalPage}">&raquo;</a>
</center>	

<br><br>
<c:if test="${alogin.aauth == 2}">
<h3>관리자 계정 관리</h3>

<table border="1px">
		
	<thead style="text-align: center">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>권한상태</th>
			<th>권한부여</th>
		</tr>
	</thead>

	<tbody style="text-align: center">
	<c:forEach items="${alist}" var="aDto">
		<tr>
			<td>${aDto.aid}</td>
			<td>${aDto.apw}</td>
			<td>${aDto.aname}</td>
			<td>${aDto.aauth}</td>
			<td>
			
			
			<form action="/admin/giveauth" method="post">
				<c:if test="${aDto.aauth == 0}">
					<input name="aid" type="hidden" value="${aDto.aid}">
					<input name="aauth" type="hidden" value="1">
					<input type="submit" value="승인">
				</c:if>
				<c:if test="${aDto.aauth == 1}">
					<input name="aid" type="hidden" value="${aDto.aid}">
					<input name="aauth" type="hidden" value="-1">
					<input type="submit" value="취소">
				</c:if>
			</td>
			</form>
		</tr>
		</c:forEach>
	</tbody>
</table>
</c:if>
</center>
</body>
<script type="text/javascript">

</script>
</html>