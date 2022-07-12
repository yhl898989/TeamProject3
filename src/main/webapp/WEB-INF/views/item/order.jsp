<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
	<table>
		<colgroup>
			<col width="25%">
			<col width="*">
		</colgroup>
		<tbody>
			<tr>
				<th>이름</th>
				<td> ${memberInfo.memberName}
				</td>
			</tr>
			<tr>
				<th> 주소 </th>
					<td>
						${memberInfo.memberAddr1} ${memberInfo.memberAddr2} <br> ${memberInfo.memberAddr3}
						<input class="selectAddress" value="T" type="hidden">
						<input class="addressee_input" value="${memberInfo.memberName}" type="hidden">
						<input class="address1_input" type="hidden" value="${memberInfo.memberAddr1}">
						<input class="address2_input" type="hidden" value="${memberinfo.memberAddr2}">
						<input class="address3_input" type="hidden" value="${memberinfo.memberAddr3}">
					</td>
				</tr>
			</tbody>
	</table>
</div>

<div class="addressInfo_input_div addressInfo_input_div_2" style="display: block">
	<table>
		<colgroup>
			<col width="25%">
			<col width="*">
		</colgroup>
		<tbody>
			<tr>
				<th>이름</th>
				<td> <input class="addressee_input">
				</td>
			</tr>
			<tr>
				<th> 주소 </th>
					<td>
						<input class="selectAddress" value="F" type="hidden">
						<input class="address1_input" readonly="readonly" value="${memberInfo.memberAddr1}"><a class="address_serach_btn"></a>
						<input class="address2_input" readonly="readonly" value="${memberinfo.memberAddr2}">
						<input class="address3_input" readonly="readonly" value="${memberinfo.memberAddr3}">
					</td>
				</tr>
			</tbody>
	</table>
</div>
<script type="text/javascript">
function showAdress(className){}
	$(".addressInfo_input_div").each(function(i, obj){
		$(obj).find(".selectAddress").val("F");
	})
}
</script>
</body>
</html>