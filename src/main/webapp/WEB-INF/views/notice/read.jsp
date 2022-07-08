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
<jsp:include page="../common/header.jsp"/>
<div class="jumbotron">
   <h1 class="text-center">공지사항</h1>
</div>

  <div class="form-group row">
    <label for="nno" class="col-sm-2 col-form-label col-form-label-lg">보드번호</label>
    <div class="col-sm-10">
      <input readonly class="form-control form-control-lg"  id="nno" value="${ndto.nno}">
    </div>
  </div>

  
  <div class="form-group row">
    <label for="ndate" class="col-sm-2 col-form-label col-form-label-lg">작성 날짜 </label>
    <div class="col-sm-10">
      <input readonly class="form-control form-control-lg"  id="ndate" value="${ndto.ndate}">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="nupdateday" class="col-sm-2 col-form-label col-form-label-lg">수정 날짜</label>
    <div class="col-sm-10">
      <input readonly class="form-control form-control-lg"  id="nupdateday" value="${ndto.nupdateday}">
    </div>
  </div>
  <div class="form-group row">
    <label for="ntitle" class="col-sm-2 col-form-label col-form-label-lg">제목</label>
     <div class="col-sm-10">
       <textarea readonly class="form-control" id="ntitle" >${ndto.ntitle}</textarea>
     </div>   
  </div>

  
   <div class="form-group row">
    <label for="content" class="col-sm-2 col-form-label col-form-label-lg">내용</label>
     <div class="col-sm-10">
       <textarea readonly class="form-control" id="ncontent" rows="5">${ndto.ncontent}</textarea>
     </div>   
  </div>



<c:if test="${(not empty alogin)}">
<a class="btn btn-warning" href="/notice/update/${ndto.nno}">수정</a> 

<a class="btn btn-danger delete" href="/notice/delete/${ndto.nno}">삭제</a> 
</c:if>
<a class="btn btn-info" href="/notice/list">목록</a> 





</body>
</html>