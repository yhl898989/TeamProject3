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
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link href = "/resources/css/itemread.css" rel="stylesheet">
<style type="text/css">
#formFileMultiple{
   padding-left: 0%;
}
.red{
	color: red;
}  
.hidden{
	display : none;
}
</style>


</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="jumbotron">
   <h1 class="text-center">상품 상세 보기</h1>
</div>

<div class = "itemread">
<div class = "itemreadphoto">

<img id = "mainphoto" alt="" src="/displayfile?filename=${item.ifilename}" width = "50%" height = "400px">

<div class = "slick_sd" id = "subphoto">
<span>
  <img id = "aaaaa" src="/displayfile?filename=${item.ifilename}" alt="..." width="100px" height="100px">
  </span>
</div>
</div>
<div class = "itemreadinfo">
 <div class="form-group row">
    <label for="iId" class="col-sm-2 col-form-label col-form-label-lg">상품아이디</label>
    <div class="col-sm-10">
      <input readonly class="form-control form-control-lg"  id="itemiId" value="${item.iId}">
    </div>
  </div>
  
  
  <div class="form-group row">
    <label for="iName" class="col-sm-2 col-form-label col-form-label-lg">상품명</label>
    <div class="col-sm-10">
      <input readonly class="form-control form-control-lg"  id="itemiName" value="${item.iName}">
    </div>
  </div>

<div class="form-group row">
    <label for="iPrice" class="col-sm-2 col-form-label col-form-label-lg">소비자가</label>
    <div class="col-sm-10">
      <input readonly class="form-control form-control-lg"  id="itemiPrice" value="${item.iPrice}원">
    </div>
  </div>
  
<div class="form-group row">
    <label for="saleiPrice" class="col-sm-2 col-form-label col-form-label-lg">판매가</label>
    <div class="col-sm-10">
      <input readonly class="form-control form-control-lg"  id="saleiPrice" value="">
    </div>  
  </div>
  
 <div class="form-group row">
    <label for="iDc" class="col-sm-2 col-form-label col-form-label-lg">할인율</label>
    <div class="col-sm-10">
      <input readonly class="form-control form-control-lg"  id="itemiDc" value="${item.iDc}%">
    </div>
  </div>
  
   <div class="form-group row">
    <label for="iDc" class="col-sm-2 col-form-label col-form-label-lg">수량</label>
    <div class="col-sm-10">
      <input readonly class="form-control form-control-lg"  id="itemiCount" value="${item.iCount}개">
    </div>
  </div>
  
     <select name="oqty" id="oqty" >

         <c:forEach begin="1" end="${item.iCount >50 ? 50: item.iCount }" var="iCount">
            <option value="${iCount}">${iCount}</option>
          </c:forEach>

   </select>
  
  </div>
  </div>
<br>
<br>

<a class="btn btn-success reply">리뷰</a>
<a class="btn btn-success btn_buy">${item.iCount == 0?"솔드아웃":"바로구매"}</a>
<form action="/order/${login.mid}" method="get" class="order_form">
   <input type="hidden" name="orders[0].iId" value="${item.iId}">
   <input type="hidden" name="orders[0].iCount" value="">
</form>
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

<form id="upload" action="/review/uploadform" method="post" enctype="multipart/form-data">
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
<center>
<div id="pageing">
</div>
</center>
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
      <form id="upload2" action="/review/uploadform2" method="post" enctype="multipart/form-data">
      <div class="form-group row">
   <label for="formFileMultiple" class="form-label">사진첨부</label>
  <input class="form-control" type="file" name="file" id="formFileMultiple1" multiple>
  <input type = "hidden" name = "iId" value = "${item.iId}">
  <input id = "rnorno" type = "hidden" name = "rno" value ="">
</div>
</form>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button id="item_btn_update_submit" type="button" data-dismiss="modal" class="btn btn-primary">리뷰 수정 완료</button>
      </div>
    </div>
  </div>
</div>


<input id = "mid" type = "hidden" value = "${login.mid}">
<input id = "aid" type = "hidden" value = "${alogin.aid}">
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/item.js"></script>
<script type="text/javascript" src="/resources/js/tl.js"></script>

<script type="text/javascript">
$(function() {
   
let mid = $("#mid").val();   
   
let aid = $("#aid").val();

let iId = ${item.iId};

let iPrice = ${item.iPrice};

let curpage = 1;

$("#pageing").on("click","a",function() {
	
	let nowpagenum = $(this).attr("id");
	getAllReply3(iId, $("#review"),nowpagenum, $("#pageing"), mid, aid);
})	

if(iPrice < 1000){
    let iPrice = ${item.iPrice};
    let iDc = ${item.iDc};
    let savePrice = iPrice*(iDc/100);
    let saleiPrice = Math.floor(iPrice - savePrice);  
    $("#saleiPrice").val(saleiPrice+"원");
 }else{
	 let iPrice = ${item.iPrice};
	    let iDc = ${item.iDc};
	    let savePrice = iPrice*(iDc/100);
	    let saleiPrice = Math.ceil((iPrice - savePrice)/10)*10;  
	    $("#saleiPrice").val(saleiPrice+"원");
 }

$("#subphoto").on("mouseenter","#aaaaa", function() {
	let htmlimgsrc = $(this).attr("src");
	$("#mainphoto").attr("src",htmlimgsrc);
})




getitemfilelist(iId,$("#subphoto"));
	
$(".slick_sd").slick({
	slidesToShow : 4,		
	slidesToScroll : 1,
	arrows : true, 
	vertical : false,
	prevArrow : "<button type='button' class='slick-prev'><</button>",
	nextArrow : "<button type='button' class='slick-next'>></button>",
})

	
$(".btn_buy").on("click" , function () {
		   let itemCount =$("#oqty").val();
		   
		   $(".order_form").find("input[name='orders[0].iCount']").val(itemCount);
		   $(".order_form").submit();
		});

$("#item_btn_update_submit").on("click",function() {
	
    let rtitle = $("#item_input_update_rtitle").val();
    
    let rcontent = $("#item_input_update_rcontent").val();
    
	let file = $("#formFileMultiple1")[0];
	console.log(file);
	let rfile = file.files;
	console.log(rfile);
    
    let rno = $("#modal_rno").text();
    $("#rnorno").val(rno);
    $.ajax({
   	 type : "put", 
   	 url : "/review",
   	 headers : {
   		 "Content-Type" : "application/json; charset=UTF-8",
   		 "X-HTTP-Method-Override" : "PUT"
   	 },
   	 data : JSON.stringify({
   		rtitle : rtitle,
   		rcontent : rcontent,
   		 rno : rno,
   	 }),
   	 dataType: "text",
   	 success : function(result) {
   		
   		 if(result=="SUCCESS"){
   			 
   			 $(".modalimg").remove();
   		 	
   		 	
   		 }
		}
    });
    if(rfile.length != 0){
    	
    	$("#upload2").submit();
    	
    }
  	  
 
    
    getAllReply3(iId, $("#review"),curpage, $("#pageing"), mid, aid);
    
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
    		 
    if(rfile.length != 0){ //
    	  $("#upload").submit();
    }
  
    $(".collapse").collapse("hide");	
    getAllReply3(iId, $("#review"),curpage, $("#pageing"), mid, aid);
  
    
  
    
 });
 


 
$(".reply").on("click", function() {
	if($("#mid").val() == ""){
		location.assign("/member/loginui"); //비로그인 리뷰작성 막는코드
	}
	
	$.ajax({
	       type : 'post',
	       url : '/review/reviewcheck',
	       headers : {
	  		 "Content-Type" : "application/json; charset=UTF-8",
	  		 "X-HTTP-Method-Override" : "POST"
	  	 },
	       data : JSON.stringify({
	    	   mid : mid,
	    	   iId : iId,
	    	   	    	  
	       }),
	       dataType : 'text',
	       success : function(result) {
	          if(result =='SUCCESS') {
	        	  $(".collapse").collapse("toggle");
	        	 
	          }else if (result == 'fail') {
				  alert('상품을 구매 후 작성해주세요.');
			}
	         
	       }
	      
	    });
		
	
         
      });
      


$(".item_btn_delete").on("click", function() {
   $("form")
   .attr("action", "/item/read/${item.iId}")
   .attr("method", "post")
   .submit();
});     



getAllReply3(iId, $("#review"),curpage, $("#pageing"), mid, aid); //페이징처리

});
   
   
   


</script>
</body>
</html>