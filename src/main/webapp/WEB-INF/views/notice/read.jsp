<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<link href="/resources/css/noticeqa.css" rel="stylesheet">
<link href="/resources/css/noticelistpage.css" rel="stylesheet">
<link href="/resources/css/header.css" rel="stylesheet">

<link href = "/resources/css/header.css" rel="stylesheet">
<link href="/resources/css/noticeqa.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="jumbotron">
   <h1 class="text-center">공지사항</h1>
</div>

	<form action="/notice/read" method="post">
		<table width="100%" class="table02">
			<colgroup>
				<col width="20%">
				<col width="*">
			</colgroup>
			<tbody id="tbody">
				<tr>
					<th>제목</th>
					<td><input readonly class="form-control" id="ntitle" value="${ndto.ntitle}"></td>
					<th>조회수</th>
					<td><input readonly class="form-control" id="nreadcnt" value="${ndto.nreadcnt}"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input readonly class="form-control form-control-lg" id="aid" value="${ndto.aid}"></td>
					<th>작성일</th>
					<td><input readonly class="form-control form-control-lg"  id="nupdateday" value="${ndto.nupdateday}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan='3'><textarea readonly class="form-control" id="ncontent" rows="5" style="height:300px; resize: none;">${ndto.ncontent}</textarea></td>
				</tr>
			</tbody>
		</table>
	</form>

<br>
<br>
<div class="text-right">
<c:if test="${(not empty alogin)}">
<a class="btn btn-warning" href="/notice/update/${ndto.nno}">수정</a> 

<a class="btn btn-danger delete" href="/notice/delete/${ndto.nno}">삭제</a> 
</c:if>
<a class="btn btn-info" href="/notice/list">목록</a> 
</div>




</body>
</html>