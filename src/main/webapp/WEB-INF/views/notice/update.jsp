<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>공지사항 수정 화면</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<link href = "/resources/css/header.css" rel="stylesheet">
<link href="/resources/css/noticeqa.css" rel="stylesheet">

</head>


<style>
  #ncontent {
     height: 300px; width: 1580px;
  }
</style>
<body>

<jsp:include page="../common/header.jsp"/>
<div class="jumbotron">
   <h1 class="text-center">공지사항 수정화면</h1>
</div>

<form action="/notice/update" method="post">
     <div class="form-group row">
       <label for="nno" class="col-sm-2 col-form-label col-form-label-lg">보드번호</label>
       <div class="col-sm-10">
         <input readonly class="form-control form-control-lg"  id="nno" value="${ndto.nno}">
       </div>
     </div>

   <div class="form-group row">
      <label for="title" class="col-sm-2 col-form-label col-form-label-lg">글제목</label>
      <div class="col-sm-10">
      <input name="ntitle" class="form-control form-control-lg" id="ntitle" placeholder="제목 입력" value="${ndto.ntitle}">
      </div>
   </div>
   
   <div class="form-group row">
      <label for="title" class="col-sm-2 col-form-label col-form-label-lg">작성자</label>
      <div class="col-sm-10">
      <input name="aid" class="form-control form-control-lg" id="aid" value="${ndto.aid}" readonly="readonly">
      </div>
   </div>
   
    <div class="form-group row" >
    <label for="content" class="col-sm-2 col-form-label col-form-label-lg">내용</label>
    <div class="col-sm-10">
      <textarea name="ncontent" class="form-control" id="ncontent" value="${ndto.ncontent}" rows="3" style="width:1000px; resize: none;"></textarea>
    </div>
  </div>



 </form>
 <div class="form-group row">
      <input class="form-control btn btn-primary col-sm-2 offset-sm-5"
         type="submit" value="수정 완료" id="update_btn_submit">
</div>
<script type="text/javascript" src="/resources/js/tl.js"></script>
<script type="text/javascript">
   
   $(document).ready(function() {
   $("#update_btn_submit").on("click",function(){
      let formData = new FormData();
      
      let nno = ${ndto.nno}
      
         formData.append("nno", nno);
         
         
         let ntitle = $("#ntitle").val();
         
         let ncontent = $("#ncontent").val();
         let aid = $("#aid").val();
         formData.append("ntitle", ntitle);
         formData.append("ncontent", ncontent);
         
         formData.append("aid",aid);
         
        
         $.ajax({
              type : 'post',
              url : "/notice/update",
              processData : false,
              contentType : false,
              data : formData,
              dataType : "text",
              success : function(result){
                 if(result=="SUCCESS"){
                    location.assign("/notice/read/"+nno);
                 } else {
                    alert("수정 실패");
                 }
              }
           });
   });
   });
</script>
</body>
</html>