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
</head>
<body>
   <jsp:include page="../common/header.jsp" />
   <div class="jumbotron">
      <h1 class="text-center">공지사항 작성 </h1>
   </div>
   
   <form action="/notice/insert" method="post">
      <div class="form-group row">
         <label for="title" class="col-sm-2 col-form-label col-form-label-lg">제목</label>
         <div class="col-sm-10">
            <input name="ntitle" class="form-control form-control-lg" id="ntitle"
               placeholder="제목 입력">
         </div>
      </div>

      <div class="form-group row">
         <label for="writer" class="col-sm-2 col-form-label col-form-label-lg">작성자</label>
         <div class="col-sm-10">
            <input name="nwriter" class="form-control form-control-lg"
               id="aid" placeholder="작성자 입력" value="${alogin.aid}" readonly="readonly">
         </div>
      </div>

      <div class="form-group row">
         <label for="content"
            class="col-sm-2 col-form-label col-form-label-lg">내용</label>
         <div class="col-sm-10">
            <textarea name="ncontent" class="form-control" id="ncontent" rows="5"></textarea>
         </div>
      </div>
      
   </form>
   
   <div class="form-group row">
      <input class="form-control btn btn-primary col-sm-2 offset-sm-5"
         type="submit" value="공지사항 작성 완료" id="btn_submit">
   </div>
   ${login}
  
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
      
      formData.append("aid",aid);
      $.ajax({

         type : "post",

         url : "/notice/insert",

         processData : false,

         contentType : false,

         data : formData,

         dataType : "text",

         success : function(nno) {

            location.assign("/notice/read/"+nno);

         }

      });
   })
   
      



   });




</script>
   
</body>
</html>