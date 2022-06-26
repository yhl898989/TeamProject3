<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 자세히 보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<style type="text/css">
#formFileMultiple{
   padding-left: 0%;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="jumbotron">
   <h1 class="text-center">상품 상세 보기</h1>
</div>

  <div class="form-group row">
    <label for="bno" class="col-sm-2 col-form-label col-form-label-lg">상품아이디</label>
    <div class="col-sm-10">
      <input readonly class="form-control form-control-lg"  id="" value="${item.iId}">
    </div>
  </div>
  
  
  <div class="form-group row">
    <label for="title" class="col-sm-2 col-form-label col-form-label-lg">상품명</label>
    <div class="col-sm-10">
      <input readonly class="form-control form-control-lg"  id="" value="${item.iName}">
    </div>
  </div>

<div class="form-group row">
    <label for="title" class="col-sm-2 col-form-label col-form-label-lg">가격</label>
    <div class="col-sm-10">
      <input readonly class="form-control form-control-lg"  id="" value="${item.iPrice}">
    </div>
  </div>
<br>
<br>

<a class="btn btn-success reply">리뷰</a>

<div class="collapse">
  <div class="card card-body">
   
     
 <div class="form-group row">
  <label for="rtitle" class="form-label">제 목</label>
  <input type="text" class="form-control" id="rtitle" placeholder="제목을 입력해 주세요.">
</div>

<div class="form-group row">
  <label for="rcontent" class="form-label">상품평</label>
  <textarea class="form-control" id="rcontent" placeholder="내용을 입력해 주세요." rows="10"></textarea>
</div>

<form id="upload" action="/review2/uploadform" method="post" enctype="multipart/form-data" target="repacatFrame">
<div class="form-group row">
   <label for="formFileMultiple" class="form-label">사진첨부</label>
  <input class="form-control" type="file" name="file" id="formFileMultiple" multiple>
  <input type = "hidden" name = "iId" value = "${item.iId}">
</div>
</form>
    
     <div class="form-group row">
       <input id="reply_btn_submit" class="form-control btn btn-primary col-sm-2 offset-sm-5" type="submit" value="리뷰 작성 완료">   
    </div>    
  </div>
</div>


<div id="review">
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">rno: <span id="modal_rno">5</span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <div class="form-group">
           <input id="item_input_update_rtitle" class="form-control" placeholder="제목을 입력해 주세요." value = "">
        </div>
        <div class="form-group">
           <input id="item_input_update_rcontent" class="form-control" placeholder="내용을 입력해 주세요." value = "">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button id="item_btn_update_submit" type="button" data-dismiss="modal" class="btn btn-primary">리뷰 수정 완료</button>
      </div>
    </div>
  </div>
</div>


<input id = "mid" type = "hidden" value = "${login.mid}">

<script type="text/javascript" src="/resources/js/tl.js"></script>

<script type="text/javascript">
$(function() {
   
let mid = $("#mid").val();   
   
let iId = ${item.iId};



$("#item_btn_update_submit").on("click",function() {
	
    let replyer = $("#item_input_update_rtitle").val();
    
    let replyText = $("#item_input_update_rcontent").val();
    
    let rno = $("#modal_rno").text();
    
    $.ajax({
   	 type : "put", 
   	 url : "/review",
   	 headers : {
   		 "Content-Type" : "application/json; charset=UTF-8",
   		 "X-HTTP-Method-Override" : "PUT"
   	 },
   	 data : JSON.stringify({
   		 replyer : replyer,
   		 replyText : replyText,
   		 rno : rno
   	 }),
   	 dataType: "text",
   	 success : function(result) {
   		
   		 if(result=="SUCCESS"){
   			 
   		 	getAllReply3(iId, $("#review"));
   		 	
   		 }
		}
    });
    
 });


$("#review").on("click", ".item_btn_update", function() {
    $("#myModal").modal("show");
    
    let rtitle = $(this).prev().prev().prev().prev().text();
   
    
    let rcontent = $(this).prev().prev().prev().text();
    
    let rno = $(this).attr("data-rno");
    

    
    
    $("#modal_rno").text(rno);
    $("#item_input_update_rtitle").val(rtitle);
    $("#item_input_update_rcontent").val(rcontent);
    
    
    
    
    
    
 });
 
 
 $("#review").on("click", ".item_btn_delete", function() {
    let rno = $(this).attr("data-rno");
    
    $.ajax({
       type : 'delete',
       url : '/review',
       headers : {
          "Content-Type" : "application/json",
          "X-HTTP-Method-Override" : "DELETE"
       },
       data : JSON.stringify({
          rno : rno
       }),
       dataType : 'text',
       success : function(result) {
    	   
          
          location.assign("/item/read/"+iId);
       }
       
    });
 });


$("#reply_btn_submit").on("click", function() {
	
	let file = $("#formFileMultiple")[0];
	
	let rfile = file.files;
	
	
    let rtitle = $("#rtitle").val();
    let rcontent = $("#rcontent").val();
  
    $.ajax({
       type : 'post',
       url : '/review',
       headers : {
  		 "Content-Type" : "application/json; charset=UTF-8",
  		 "X-HTTP-Method-Override" : "POST"
  	 },
       data : JSON.stringify({
    	   mid : mid,
    	   iId : iId,
    	   rtitle : rtitle,
    	   rcontent : rcontent,
    	  
       }),
       dataType : 'text',
       success : function(result) {
          if(result =='SUCCESS') {

        	  $("#rtitle").val("");
        	  $("#rcontent").val("");
            
          }else {
             alert("입력 실패했습니다.");
          }
         
       }
      
    });
    		 
    if(rfile.length != 0){
    	  $("#upload").submit();
    }
  
  			
    getAllReply3(iId, $("#review"));
  
    
  
    
 });
 


 
$(".reply").on("click", function() {
         $(".collapse").collapse("toggle");
      });
      


$(".item_btn_delete").on("click", function() {
   $("form")
   .attr("action", "/item/read/${item.iId}")
   .attr("method", "post")
   .submit();
});     



getAllReply3(iId, $("#review"));

   });
   
   
   


</script>
</body>
</html>