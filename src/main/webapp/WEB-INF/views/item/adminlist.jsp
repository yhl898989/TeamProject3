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

<link href = "/resources/css/itemadminlist.css" rel="stylesheet">
<link href = "/resources/css/header.css" rel="stylesheet">
<style type="text/css">

#icategoryadmimlist{
text-align: center;
}
</style>


</head>
<body>
<header style="position: fixed; z-index: 10;">
<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div style="height: 54.5px;">
</div>
<h1>관리자 상품관리</h1>
<div id = "icategoryadmimlist">
<span><a href="/item/adminlist?category=all" class = "${category == 'all'?'menucss':''}">전체</a></span>&nbsp;&nbsp;
<span><a href="/item/adminlist?category=옷" class = "${category == '옷'?'menucss':''}">옷</a></span>&nbsp;&nbsp;
<span><a href="/item/adminlist?category=신발" class = "${category == '신발'?'menucss':''}">신발</a></span>&nbsp;&nbsp;
<span><a href="/item/adminlist?category=가방" class = "${category == '가방'?'menucss':''}">가방</a></span>&nbsp;&nbsp;
<span><a href="/item/adminlist?category=모자" class = "${category == '모자'?'menucss':''}">모자</a></span>&nbsp;&nbsp;
<span><a href="/item/adminlist?category=악세사리" class = "${category == '악세사리'?'menucss':''}">악세사리</a></span>
</div>
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
             <button data-iId = "${adminlist.iId}" id = "item_delete_btn">삭제</button><div>
             <button id = "item_imgupdate_btn" data-iName ="${adminlist.iName}" data-iId = "${adminlist.iId}">이미지 수정</button></div>
            
            </td>
            
         </tr>
         </c:forEach>
  </tbody>
</table>

<ul class="pagination nav justify-content-center">
    <li class="page-item">
      <a class="page-link" href = "/item/adminlist?category=${category}&&curPage=${pt.curPage > 1? pt.curPage -1:1}">&laquo;</a>
    </li>
    <c:forEach var = "i" begin="${pt.beginPageNum}" end = "${pt.finishPageNum}">
    <li class="${i == pt.curPage?'page-item active':'page-item'}" aria-current="${i == pt.curPage?'page':''}">
	<a  href = "/item/adminlist?category=${category}&&curPage=${i}" class = "page-link">
	
	${i}
	
	
	
	</a>
	</li>
	</c:forEach>
    
    <li class="page-item">
      <a class="page-link" href = "/item/adminlist?category=${category}&&curPage=${pt.curPage < pt.totalPage? pt.curPage + 1 : pt.totalPage}">&raquo;</a>
    </li>
  </ul> 
   

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop ="static" data-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModaliName"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <input type = "hidden" id = "ModaliId" value = "111">
          <div class = "getimg">
           <div id = "getmainimg"><input id = "mainimgedit" type = "checkbox" name = "selectupdate" >메인 이미지 편집</div>
           <div id = "getsubimg"><input id = "subimgedit" type = "checkbox" name = "selectupdate">서브 이미지 편집</div>
        </div>
             <div id = "itemimguploadedItems"></div>
        
      </div>
      <div class="modal-footer">
        <div id = "aabutton">
        
        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src = "/resources/js/item.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   let deletefilename = "";
   let deleteFilenameArr = [];
   let formData = new FormData();
   let idx = 0;
   let curPage = ${pt.curPage};
   let category = "${category}";
$(".tbody").on("click","#item_update_btn", function() {
   let adminlistiId = $(this).attr("data-iId");
   let adminlistiName = $(this).attr("data-iName");
   let adminlistiPrice = $(this).attr("data-iPrice");
   let adminlistiDc = $(this).attr("data-iDc");
   let adminlistiCount = $(this).attr("data-iCount");
   let adminlistifilename = $(this).attr("data-ifilename");
   let adminlistii_CATEGORY = $(this).attr("data-i_CATEGORY");
   
   let str = updateitem(adminlistiId,adminlistiName,adminlistiPrice,adminlistiDc,
         adminlistiCount,adminlistifilename,adminlistii_CATEGORY,curPage,category);
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
            location.assign("/item/adminlist?category=${category}&&curPage=${pt.curPage}");
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
        	 location.assign("/item/adminlist?category=${category}&&curPage=${pt.curPage}");
         }else if(result == "ordercheck"){
        	 alert("배송 준비 중인 상품입니다.");
         }      
      }
   
   })
})
$(".tbody").on("click","#item_imgupdate_btn", function() {
   $("#myModal").modal("show");
   let iName = $(this).attr("data-iName");
   let iId = $(this).attr("data-iId");   
   $("#ModaliName").text(iName);
   $("#ModaliId").val(iId);
   $("#mainimgedit").prop('checked', false);
   $("#subimgedit").prop('checked', false);
   $("#itemimguploadedItems").html("");
   $("#aabutton").html("");
   $('#myModal').modal({backdrop: 'static'});
})
   
////////////////////////////////////////////////////////   
$('input[type="checkbox"][name="selectupdate"]').click(function(){
    
     if($(this).prop('checked')){
    
        $('input[type="checkbox"][name="selectupdate"]').prop('checked',false);
    
        $(this).prop('checked',true);
    
       }
     
      });
   
$("#getmainimg").on("change","input[type='checkbox']",function(){
   
   $("#mainimgedit").is(":checked");
   if($("#mainimgedit").is(":checked")== false){
      $("#itemimguploadedItems").html("");
      $(".btn_itemainimg_update").remove();
   }else{
      $("#aabutton").html("");
      $("#aabutton").append('<button type="button" class="btn btn-secondary btn_itemainimg_update" data-dismiss="modal">이미지 수정</button>');
      $("#itemimguploadedItems").html("");
      let formData = new FormData();
      let iId = $("#ModaliId").val();
      formData.append("iId",iId);
      $.ajax({
         
         type : "post",
         url : "/item/getmainimgfilename",
         data : formData,
         processData : false,
         contentType : false,
         dataType : "JSON",
         success : function(result) {
            
            $("#itemimguploadedItems").css("display","flex");
            $("#itemimguploadedItems").css("text-align","center");
            getupdateitemimg(result,$("#itemimguploadedItems"));
             
         }
      
      })
   }
})

$("#getsubimg").on("change","input[type='checkbox']",function(){
   if($("#subimgedit").is(":checked")== false){
      $("#itemimguploadedItems").html("");
      $(".btn_itemsubimg_update").remove();
   }else{
      $("#aabutton").html("");
      $("#aabutton").append('<button type="button" class="btn btn-secondary btn_itemsubimg_update" data-dismiss="modal">이미지 수정</button>');
      $("#itemimguploadedItems").html("");
      let formData = new FormData();
      let iId = $("#ModaliId").val();
      formData.append("iId",iId);
       $.ajax({
         
         type : "post",
         url : "/item/getsubimgfilename",
         data : formData,
         processData : false,
         contentType : false,
         dataType : "JSON",
         success : function(result) {
            $("#itemimguploadedItems").css("display","block");
            $("#itemimguploadedItems").css("text-align","center");
            $("#itemimguploadedItems").append('<div id = "itemsubimguploadFile">서브 사진</div>');
            getupdateitemsubimg(result,$("#itemimguploadedItems"));
            
            
            
            
         }
   
      }) 
   }
})   
   //서브사진 드롭
$("#itemimguploadedItems").on("dragenter dragover","#itemsubimguploadFile", function(event) {
      event.preventDefault();
      
   })
   
   $("#itemimguploadedItems").on("drop","#itemsubimguploadFile", function(event) {
      event.preventDefault();
      let itemimgfiles = event.originalEvent.dataTransfer.files;
      let itemimgfile = itemimgfiles[0];
      
      
      formData.append("itemimgfile"+idx,itemimgfile);
      
      let reader = new FileReader();
      
      reader.readAsDataURL(itemimgfile);
      
      reader.onload = function(event) {
         
         let str = insertitemsubimgfile3(event.target.result,"itemimgfile"+idx++);
         
         $("#itemimguploadedItems").append(str);
         
         
      }
   })   
   
$("#itemimguploadedItems").on("click",".btn_del_subitem", function() {
   $("#card").remove();
   let subdeletefilename = $(this).attr("data-itemimgfilekey");
   let filename = $(this).attr("data-itemimgfilename");
   if(filename == "new"){
      let filekey = $(this).attr("data-itemimgfilekey");
      formData.delete(filekey);
   }else{
      deleteFilenameArr.push(subdeletefilename);
      }
   $(this).parent().parent().parent().remove();
   })
   
   


$("#aabutton").on("click",".btn_itemsubimg_update",function() {
   
   let iId = $("#ModaliId").val();
   
   formData.append("iId",iId);
   formData.append("deleteFilenameArr",deleteFilenameArr);
   formData.delete("itemimgfile");
   $.ajax({
      
      type : "post",
      url : "/item/updatesubitemimg",
      data : formData,
      processData : false,
      contentType : false,
      dataType : "text",
      success : function(result) {
         
         if(result == "SUCCESS"){
            
        	 location.assign("/item/adminlist?category=${category}&&curPage=${pt.curPage}");
         }      
      }
   
   })
   
}) 


//메인사진드롭
$("#itemimguploadedItems").on("dragenter dragover","#itemimguploadFile2", function(event) {
         event.preventDefault();
   })  

$("#itemimguploadedItems").on("drop","#itemimguploadFile2", function(event) {
   
      event.preventDefault();
      let itemimgfiles = event.originalEvent.dataTransfer.files;
      let itemimgfile = itemimgfiles[0];
      
      
      formData.set("itemimgfile",itemimgfile);
      
      let reader = new FileReader();
      
      reader.readAsDataURL(itemimgfile);
      
      reader.onload = function(event) {
         
         let str = insertitemimgfile3(event.target.result, itemimgfile["name"]);
         
         $("#itemimguploadedItems").append(str);
         $("#itemimguploadFile2").remove();
         
      }
   })
 
$("#itemimguploadedItems").on("click",".btn_del_item", function() {
   $("#card").remove();
   $("#itemimguploadedItems").html('<div id = "itemimguploadFile2" class ="form-control text-center">메인사진</div>');
   let maindeletefilename = $(this).attr("data-itemimgfilekey");
   let filename = $(this).attr("data-filename");
   if(filename != "new"){
      deletefilename = maindeletefilename;
   }             
   
   
   
   
})   
   
$("#aabutton").on("click",".btn_itemainimg_update",function() {
   
   let iId = $("#ModaliId").val();
   formData.append("iId",iId);
   formData.append("deletefilename",deletefilename);
   if(formData.get("itemimgfile") == null){
       alert("메인 사진을 넣어주세요");
       return
   }
   $.ajax({
      
      type : "post",
      url : "/item/updateitemimg",
      data : formData,
      processData : false,
      contentType : false,
      dataType : "text",
      success : function(result) {
         if(result == "SUCCESS"){
        	 location.assign("/item/adminlist?category=${category}&&curPage=${pt.curPage}");
         }      
      }
   
   })
   
}) 
$(".close").on("click", function() {
   
   for(let i = 0 ; i < idx+1 ; i++){
      if(formData.get("itemimgfile"+i) == null){
         continue;
      }else{
         formData.delete("itemimgfile"+i);
      }
   }
   deleteFilenameArr = [];
   formData.delete("itemimgfile")
   deletefilename = "";
})

})

let temp = document.getElementsByClassName("adminlistiPrice");

for(var i = 0 ; i <temp.length ; i++){
   console.log(parseInt((temp[i].innerText).substring(0,temp[i].innerText.length-1)).toLocaleString('ko-KR'));
   temp[i].innerText = parseInt((temp[i].innerText).substring(0,temp[i].innerText.length-1)).toLocaleString('ko-KR')+"원";
}



</script>
</body>
</html>