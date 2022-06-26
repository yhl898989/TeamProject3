<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>

<style type="text/css">

body{
	width:1920px;
}

thead{
text-align: center;
}
tbody{
text-align: center;
}
.modal-body{
	height : 500px;
}
.red{
	color : red;
}

</style>

</head>
<body>
<h1>관리자 상품관리</h1>

<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">상품번호</th>
      <th scope="col">상품이름</th>
      <th scope="col">상품가격</th>
      <th scope="col">상품할인율</th>
      <th scope="col">상품수량</th>
      <th scope="col">상품사진</th>
      <th scope="col">상품카테고리</th>
      <th scope="col">편집</th>
    </tr>
  </thead>
  <tbody class = "tbody">
    <c:forEach items = "${pt.list}" var = "adminlist">
			<tr>
				<td class = "adminlistiId">${adminlist.iId}</td>
				<td class = "adminlistiName">${adminlist.iName}</td>
				<td class = "adminlistiPrice">${adminlist.iPrice}원</td>
				<td class = "adminlistiDc">${adminlist.iDc}%</td>
				<td class = "adminlistiCount">${adminlist.iCount}개</td>
				<td class = "adminlistifilename"><img alt="" src="/displayfile?filename=${adminlist.ifilename}" height = 100px width = 100px></td>
				<td class = "adminlistii_CATEGORY">${adminlist.i_CATEGORY}</td>
				<td class = "button"> <button id = "item_update_btn"
						data-iId = "${adminlist.iId}"
						data-iName = "${adminlist.iName}"
						data-iPrice = "${adminlist.iPrice}"
						data-iDc = "${adminlist.iDc}"
						data-iCount = "${adminlist.iCount}"
						data-ifilename = "${adminlist.ifilename}"
						data-i_CATEGORY = "${adminlist.i_CATEGORY}"
				>수정</button>
				 <button data-iId = "${adminlist.iId}" id = "item_delete_btn">삭제</button> <div>
				 <button data-iId = "${adminlist.iId}" id = "item_imgupdate_btn"
				 data-toggle="modal" data-target="#exampleModal">이미지수정</button></div>
				
				</td>
				
			</tr>
			</c:forEach>
  </tbody>
</table>
<center>
<a href = "/item/adminlist?curPage=${pt.curPage > 1? pt.curPage -1:1}">&laquo;</a>
	
	<c:forEach var = "i" begin="${pt.beginPageNum}" end = "${pt.finishPageNum }">
	<a href = "/item/adminlist?curPage=${i}" class = "${i == pt.curPage?'red':""}">
	
	${i}
	
	
	
	</a> &nbsp;&nbsp;
	
	</c:forEach>
	<a href = "/item/adminlist?curPage=${pt.curPage < pt.totalPage? pt.curPage + 1 : pt.totalPage}">&raquo;</a>
</center>	
	

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">이미지 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        미구현입니당
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src = "/resources/js/item.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	 
	  
$(".tbody").on("click","#item_update_btn", function() {
	let adminlistiId = $(this).attr("data-iId");
	let adminlistiName = $(this).attr("data-iName");
	let adminlistiPrice = $(this).attr("data-iPrice");
	let adminlistiDc = $(this).attr("data-iDc");
	let adminlistiCount = $(this).attr("data-iCount");
	let adminlistifilename = $(this).attr("data-ifilename");
	let adminlistii_CATEGORY = $(this).attr("data-i_CATEGORY");
	
	let str = updateitem(adminlistiId,adminlistiName,adminlistiPrice,adminlistiDc,
			adminlistiCount,adminlistifilename,adminlistii_CATEGORY);
	$(this).parent().parent().html(str);
	$(".button").remove();
	$("tr").append('<td></td>');
	
})
$(".tbody").on("click","#item_updatefinish_btn", function() {
	let updateiId = $("#updateiId").val();
	let updateiName = $("#updateiName").val();
	let updateiPrice = $("#updateiPrice").val();
	let updateiDc = $("#updateiDc").val();
	let updateiCount = $("#updateiCount").val();
	let updatei_CATEGORY = $(".updatei_CATEGORY").val();
	
	let formData = new FormData();
	formData.append("updateiId",updateiId);
	formData.append("updateiName",updateiName);
	formData.append("updateiPrice",updateiPrice);
	formData.append("updateiDc",updateiDc);
	formData.append("updateiCount",updateiCount);
	formData.append("updatei_CATEGORY",updatei_CATEGORY);
	
	$.ajax({
		
		type : "post",
		url : "/item/update",
		data : formData,
		processData : false,
		contentType : false,
		dataType : "text",
		success : function(result) {
			if(result == "SUCCESS"){
				location.assign("/item/adminlist");
			}		
		}
	
	})

})
$(".tbody").on("click","#item_delete_btn", function() {
	let adminlistiId = $(this).attr("data-iId");
	let formData = new FormData();
	formData.append("adminlistiId",adminlistiId);
$.ajax({
		
		type : "post",
		url : "/item/delete",
		data : formData,
		processData : false,
		contentType : false,
		dataType : "text",
		success : function(result) {
			if(result == "SUCCESS"){
				location.assign("/item/adminlist");
			}		
		}
	
	})
})
})

</script>
</body>
</html>