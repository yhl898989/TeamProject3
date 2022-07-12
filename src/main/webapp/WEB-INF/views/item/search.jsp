<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<link href = "/resources/css/itemsearch.css" rel="stylesheet">
<link href = "/resources/css/header.css" rel="stylesheet">

</head>

<body>

<header style="position: fixed; z-index: 10;">
<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div style="height: 54.5px;">
</div>

<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img style="z-index: -10;" src="/resources/img/sale.png" class="d-block w-100" alt="..." width=100% height = 100%>
    </div>
    <div class="carousel-item">
      <img src="/resources/img/event.jpg" class="d-block w-100" alt="..." width=100% height = 100%>
    </div>
 
  </div>
 <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button>
</div>
<br>
    <center>
<h1>검색 결과</h1>
</center>
<div class = "flexitem">
   
    
   
	 <div id = "showhowitemlist">
    <a href = "/item/search?showhowitemlist=itemsequence&&curPage=${pt.curPage}&&criteria=${criteria}&&keyword=${keyword}" id = "itemsequence" class = "${showhowitemlist == 'itemsequence'?'itemcss':''}">최신순</a>
    <a href = "/item/search?showhowitemlist=iPricedesc&&curPage=${pt.curPage}&&criteria=${criteria}&&keyword=${keyword}" id = "iPricedesc" class = "${showhowitemlist == 'iPricedesc'?'itemcss':''}">높은가격순</a>
    <a href = "/item/search?showhowitemlist=iPriceasc&&curPage=${pt.curPage}&&criteria=${criteria}&&keyword=${keyword}" id = "iPriceasc" class = "${showhowitemlist == 'iPriceasc'?'itemcss':''}">낮은가격순</a>
    </div>
	</div>
<div id = "itemlist" class="box-wrapper">
<c:forEach items = "${pt.list}" var = "list">
<div class="box">
<div class="card ">
 <a href = "/item/read/${list.iId}">
 <div>
  <img src="/displayfile?filename=${list.ifilename}"class="card-img-top" alt="..." width="100px" height="200px">
  </div>
  </a>
  <div class="card-body">
    <p class="card-text">${list.iName}</p>
    <p class="card-price"><div class = "iPrice">${list.iPrice}원<span class = "${list.iDc > 0?'iDc':'iDchidden'}">sale&nbsp;${list.iDc}%</span></div>
    	<div>${list.getIsaleiPrice()}원</div>
    </p>
  </div>
</div>
</div>
</c:forEach>
</div>
<br>

<center>
<a href = "/item/search?curPage=${pt.curPage > 1? pt.curPage -1:1}&&showhowitemlist=${showhowitemlist}&&criteria=${criteria}&&keyword=${keyword}">&laquo;</a>
	
	<c:forEach var = "i" begin="${pt.beginPageNum}" end = "${pt.finishPageNum}">
	<a href = "/item/search?curPage=${i}&&showhowitemlist=${showhowitemlist}&&criteria=${criteria}&&keyword=${keyword}" class = "${i == pt.curPage?'red':""}">
	
	${i}
	
	
	
	</a> &nbsp;&nbsp;
	
	</c:forEach>
	<a href = "/item/search?curPage=${pt.curPage < pt.totalPage? pt.curPage + 1 : pt.totalPage}&&showhowitemlist=${showhowitemlist}&&criteria=${criteria}&&keyword=${keyword}">&raquo;</a>
</center>	
<jsp:include page="../common/footer.jsp"></jsp:include>

<script type="text/javascript"></script>
</body>
</html>