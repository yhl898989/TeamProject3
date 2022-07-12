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
<div class = "iteminsertform">
<div class = "aaaaa">
<form action="" method="post">
상품 이름 : <input id ="iName" name = "iName" required="required"><br>
상품 가격 : <input id = "iPrice" name = "iPrice" type="number" ><br>
상품 할인율 : <input id = "iDc" name = "iDc" type="number" ><span id = "iDccheck"></span><br>
상품 수량 : <input id = "iCount" name = "iCount" type="number"><br>
카테고리 : 
<select id = "category" onchange = "changecategory()">
<option value = "옷">옷</option>
<option value = "신발">신발</option>
<option value = "가방">가방</option>
<option value = "모자">모자</option>
<option value = "악세사리">악세사리</option>
</select>
</form>
<input id = "cateogoryname" type = "hidden" value = "옷">
</div>

<div id = "itemimguploadFileform" class ="form-group">
<div id = "itemimguploadFile" class ="form-control text-center">메인사진</div>
   </div>
</div>   
<center>
<input id = "item_btn_submit" type="submit" value = "상품 등록">
</center>
<div id = "itemimg">
<div id = "itemimguploadedItems"></div>   
<div id = "itemsubimguploadedItems"></div>
</div>
<script type="text/javascript" src ="/resources/js/item.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   let formData = new FormData();
   let idx = 0;
   
   if($("#iDc").val() > 100){
	   $("#iDccheck").html("할인율은 100을 넘을 수 없습니다");
   }
   
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
         $("#itemimguploadFileform").append('<div id = "itemsubimguploadFile" class ="form-control text-center">서브 사진</div>')
         
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
         $("#itemimguploadFileform").append('<div id = "itemsubimguploadFile" class ="form-control text-center">서브 사진</div>')
      }
   })
      
   
   $("#itemimguploadedItems").on("click",".btn_del_item", function() {
      let itemimgfilekey = $(this).attr("data-itemimgfilekey");
      formData.delete(itemimgfilekey);
      $(this).parent().parent().parent().remove();
      $("#itemimguploadFileform").html('<div id = "itemimguploadFile2" class ="form-control text-center">메인사진</div>');
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
      let iDc = $("#iDc").val();
      let iCount = $("#iCount").val();
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
    	  $("#iDccheck").html("할인율은 100을 넘을 수 없습니다.");
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