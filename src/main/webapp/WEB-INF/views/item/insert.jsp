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
<link href = "/resources/css/iteminsert.css" rel="stylesheet">
<link href = "/resources/css/header.css" rel="stylesheet">
</head>



<body>
<header style="position: fixed; z-index: 10;">
<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div style="height: 54.5px;">
</div>
<center>
<h1>상품등록</h1>
</center>


<center>
<div class="wrap">
<div class="user-info">
<form action="" method="post">
 <div class="input-group" style="width: 700px;">
                <div class="input-group-prepend">
                    <div class="input-group-text" id="btnGroupAddon2">상품이름:</div>
                  </div>  
						<input id ="iName" name = "iName" class="form-control" placeholder="" aria-label="Input group example"
                       aria-describedby="btnGroupAddon2"><br>
				
</div>
 <div class="input-group" style="width: 700px;">
                <div class="input-group-prepend">
                    <div class="input-group-text" id="btnGroupAddon2">상품가격:</div>
                </div>
                 <input id = "iPrice" name = "iPrice" type="number" class="form-control" placeholder="" aria-label="Input group example"
                       aria-describedby="btnGroupAddon2">
 </div>
<div class="input-group" style="width: 700px;">
                <div class="input-group-prepend">
                    <div class="input-group-text" id="btnGroupAddon2">상품할인:</div>
                </div>
                 <input id = "iDc" name = "iDc" type="number" class="form-control" placeholder="" aria-label="Input group example"
                       aria-describedby="btnGroupAddon2" >
 </div>
 <div class="input-group" style="width: 700px;">
                <div class="input-group-prepend">
                    <div class="input-group-text" id="btnGroupAddon2">상품수량:</div>
                </div>
                 <input id = "iCount" name = "iCount" type="number" class="form-control" placeholder="" aria-label="Input group example"
                       aria-describedby="btnGroupAddon2">
 </div>
  <div class="input-group" style="width: 700px;">
                <div class="input-group-prepend">
                    <div class="input-group-text" id="btnGroupAddon2">카테고리:</div>
                </div>
                <select class="form-control" id = "category" onchange = "changecategory()">
                    <option value = "옷">옷</option>
                    <option value = "신발">신발</option>
                    <option value = "가방">가방</option>
                    <option value = "모자">모자</option>
                    <option value = "악세사리">악세사리</option>
                </select>
            </div>

</form>
<input id = "cateogoryname" type="hidden" value = "옷">
</div>
</div>
</center>
<center>
<div class = "iteminsertform">


<div id = "itemimguploadFileform" class ="form-group">
<div id = "itemimguploadFile" class ="form-control text-center" style="display: flex; align-items: center; justify-content: center;">메인사진</div>
   </div>
</center>  
</div>   
 <div id = "itemimg">
<span id = "itemimguploadedItems"></span>   
<div id = "itemsubimguploadedItems"></div>
</div>



<center>
<input class = "btn btn-success" id = "item_btn_submit" type="submit" value = "상품 등록">
</center>
<script type="text/javascript" src ="/resources/js/item.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   let formData = new FormData();
   let idx = 0;
   
   
   $("#itemimguploadFile").on("dragenter dragover", function(event) {
      event.preventDefault();
   });
   
   $("#itemimguploadFile").on("drop", function(event) {
      event.preventDefault();
      let itemimgfiles = event.originalEvent.dataTransfer.files;
      let itemimgfile = itemimgfiles[0];
      
      
      formData.append("itemimgfile",itemimgfile);
      
      let reader = new FileReader();
      
      reader.readAsDataURL(itemimgfile);
      
      reader.onload = function(event) {
         
         let str = insertitemimgfile(event.target.result, itemimgfile["name"],"itemimgfile");
         
         $("#itemimguploadedItems").append(str);
         $("#itemimguploadFile").remove();
         $("#itemimguploadFileform").append('<div id = "itemsubimguploadFile" class ="form-control text-center" style="display: flex; align-items: center; justify-content: center;">서브 사진</div>')
         
      }
   });   
   $("#itemimguploadFileform").on("dragenter dragover","#itemimguploadFile2", function(event) {
         event.preventDefault();
   })   
      
   $("#itemimguploadFileform").on("drop","#itemimguploadFile2", function(event) {
      event.preventDefault();
      let itemimgfiles = event.originalEvent.dataTransfer.files;
      let itemimgfile = itemimgfiles[0];
      
      
      formData.append("itemimgfile",itemimgfile);
      
      let reader = new FileReader();
      
      reader.readAsDataURL(itemimgfile);
      
      reader.onload = function(event) {
         
         let str = insertitemimgfile(event.target.result, itemimgfile["name"],"itemimgfile");
         
         $("#itemimguploadedItems").append(str);
         $("#itemimguploadFile2").remove();
         $("#itemimguploadFileform").append('<div id = "itemsubimguploadFile" class ="form-control text-center" style="display: flex; align-items: center; justify-content: center;">서브 사진</div>')
      }
   })
      
   
   $("#itemimguploadedItems").on("click",".btn_del_item", function() {
      let itemimgfilekey = $(this).attr("data-itemimgfilekey");
      formData.delete(itemimgfilekey);
      $(this).parent().parent().parent().remove();
      $("#itemimguploadFileform").html('<div id = "itemimguploadFile2" class ="form-control text-center" style="display: flex; align-items: center; justify-content: center;">메인사진</div>');
   })   
   
   $("#itemsubimguploadedItems").on("click",".btn_del_subitem", function() {
      let itemimgfilekey = $(this).attr("data-itemimgfilekey");
      formData.delete(itemimgfilekey);
      $(this).parent().parent().parent().remove();
   })   
   
   $("#itemimguploadFileform").on("dragenter dragover","#itemsubimguploadFile", function(event) {
      event.preventDefault();
      
   })
   
   $("#itemimguploadFileform").on("drop","#itemsubimguploadFile", function(event) {
      event.preventDefault();
      let itemimgfiles = event.originalEvent.dataTransfer.files;
      let itemimgfile = itemimgfiles[0];
      
      
      formData.append("itemimgfile"+idx,itemimgfile);
      
      let reader = new FileReader();
      
      reader.readAsDataURL(itemimgfile);
      
      reader.onload = function(event) {
         
         let str = insertitemsubimgfile(event.target.result, itemimgfile["name"],"itemimgfile"+idx++);
         
         $("#itemsubimguploadedItems").append(str);
         
         
      }
   })
   
   $("#item_btn_submit").click(function() {
	   
      let iName = $("#iName").val();
      let iPrice = $("#iPrice").val();
      iPrice = Number(iPrice);
      console.log(typeof iPrice);
      let iDc = $("#iDc").val();
      let iCount = $("#iCount").val();
      iCount = Number(iCount);
      let icategory = $("#cateogoryname").val();
      if(iName == ""){
         alert("상품이름을 등록해주세요");
         return
      }else if(iPrice == ""){
         alert("가격을 입력해주세요");
         return
      }else if(iDc == ""){
         alert("할인을을 입력해주세요");
         return
      }else if(iCount == ""){
         alert("수량을 입력해주세요");
         return
      }else if(icategory == ""){
         alert("카레고리를 골라주세요");
         return
      }else if(formData.get("itemimgfile") == null){
    	 alert("메인 사진을 넣어주세요");
    	 return
      }else if($("#iDc").val() > 100){
    	  alert("할인율은 100을 넘을 수 없습니다.");
    	  return
      }else if(iPrice > 2100000000){
    	  alert("상품 가격은 21억을 넘을 수 없습니다.");
    	  return
      }else if(iCount > 2100000000){
    	  alert("수량은 21억을 넘을 수 없습니다.");
    	  return
      }
      
      formData.append("iName", iName);
      formData.append("iPrice", iPrice);
      formData.append("iDc", iDc);
      formData.append("iCount", iCount);
      formData.append("icategory",icategory);
      
      $.ajax({
         
         type : "post",
         url : "/item/insert",
         data : formData,
         processData : false,
         contentType : false,
         dataType : "text",
         success : function(result) {
        	
            if(result == "SUCCESS"){
            	
               location.assign("/item/main");
            }
         
         }
         
      })
   })

})
</script>
</body>
</html>