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
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link href = "/resources/css/itemmain.css" rel="stylesheet">
<style type="text/css">
div#carouselExampleControls div.carousel-inner div.carousel-item{
   margin-top: 5% !important;
}
</style>
</head>
<body>
<header style="position: fixed; z-index: 10;">
<jsp:include page="../common/header.jsp"></jsp:include>
</header>


<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/resources/img/sale.png" class="d-block w-100" alt="..." width=100% height = 100%>
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
<br> <br>
     <div class = "flexitem">
   
    
    <form action="/item/search" method="get">
   <select name = "criteria">
      <option value = "iName">상품이름</option>
   </select>
   <input name = "keyword">
   <input type = "submit" value = "검색">
   </form>
    
   </div>
   
<center>
<h2>new product</h2>
   </center>

<div id = "itemlist" class = "box-wrapper slick_sd">
<c:forEach items="${list}" var = "list">
<div class = "box">
<div class="card ">
 <a href = "/item/read/${list.iId}">
    <div>
  <img src="/displayfile?filename=${list.ifilename}"alt="..." width="100%" height="100px">
     </div>
  </a>
  <div class="card-body">
    <p class="card-text"><span class = "iName">${list.iName}</span><span class = "${list.iDc > 0?'iDc':'iDchidden'}">${list.iDc}%</span></p>
    <p class="card-price"><span class = "${list.iDc > 0?'iPrice':'iPricehidden'}">${list.iPrice}원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <span><fmt:parseNumber var = "iPrice" value = "${list.iPrice < 1000?Math.floor(list.iPrice - list.iPrice*(list.iDc/100)):Math.ceil((list.iPrice - list.iPrice*(list.iDc/100))/10)*10}" integerOnly="true"/>${iPrice}원</span>
    </p>
  </div>
</div>
</div>
</c:forEach>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function() {
    $(".slick_sd").slick({
      slidesToShow : 6,      
      slidesToScroll : 1,
      arrows : true, 
      vertical : false,
      prevArrow : "<button type='button' class='slick-prev'><</button>",
      nextArrow : "<button type='button' class='slick-next'>></button>",
   }) 
})
   
   
   


</script>
</body>
</html>