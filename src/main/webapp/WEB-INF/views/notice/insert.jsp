<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link href="/resources/css/header.css" rel="stylesheet">
<link href="/resources/css/noticeqa.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
.form {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

.form-group now {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="jumbotron">
		<h1 class="text-center">공지사항 작성</h1>
	</div>

				<form action="/notice/insert" method="post">

					<table width="100%" class="table02">
						<caption style="height:100px">							
							<strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong>
							<br>
						</caption>
						<colgroup>
							<col width="20%">
							<col width="*">
						</colgroup>
						<tbody id="tbody">
							<tr>
								<th>제목<span class="t_red">*</span></th>
								<td><input name="ntitle"
									class="form-control form-control-lg" id="ntitle"
									placeholder="제목 입력"></td>
							</tr>
							<tr>
								<th>작성자<span class="t_red">*</span></th>
								<td><input name="nwriter"
									class="form-control form-control-lg" id="aid"
									placeholder="작성자 입력" value="${alogin.aid}" readonly="readonly"></td>
							</tr>
							<tr>
								<th>내용<span class="t_red">*</span></th>
								<td><textarea name="ncontent" class="form-control"
										id="ncontent" rows="7"></textarea></td>
							</tr>
						</tbody>
					</table>
				</form>

	<br>
	<br>
	<div class="form-group row">
		<input class="form-control btn btn-primary col-sm-2 offset-sm-5"
			type="submit" value="공지사항 작성 완료" id="btn_submit">
	</div>
	<%-- ${login} --%>

	<script type="text/javascript" src="/resources/js/tl.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#btn_submit").on("click", function() {

				let formData = new FormData();
				let title = $("#ntitle").val();

				let content = $("#ncontent").val();

				let aid = $("#aid").val();

				formData.append("ntitle", title);

				formData.append("ncontent", content);

				formData.append("aid", aid);
				$.ajax({

					type : "post",

					url : "/notice/insert",

					processData : false,

					contentType : false,

					data : formData,

					dataType : "text",

					success : function(nno) {

						location.assign("/notice/read/" + nno);

					}

				});
			})

		});
	</script>

</body>
</html>