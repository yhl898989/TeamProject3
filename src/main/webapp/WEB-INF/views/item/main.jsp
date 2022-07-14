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
<link href = "/resources/css/header.css" rel="stylesheet">
<style type="text/css">





</style>
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
<h2>NEW ARRIVALS</h2>
   </center>
<br>
<div id = "itemlist" class = "box-wrapper slick_sd">
<c:forEach items="${list}" var = "list">
<div class = "box">
<div class="card">
 <a href = "/item/read/${list.iId}">
   
  <c:if test="${list.iCount==0 }">
       <img src="/resources/img/soldout.png" width="100%"  height="200px">
    </c:if>
    
    <c:if test="${list.iCount!=0 }">
  <img src="/displayfile?filename=${list.ifilename}"alt="..." width="100%" height="200px">
  </c:if>
     
  </a>
  <div class="card-body">
    <div class="card-text">${list.iName}</div>
    <div class="card-price"><div class = "iPrice"><span class = "${list.iDc > 0?'iDc':'iDchidden'}">sale&nbsp;${list.iDc}%</span></div>
                     <div><span class ="${list.iDc > 0?'':'iPricehidden'}" style="text-decoration: line-through; color: gray; font-size: 12px;"><fmt:formatNumber value = "${list.iPrice}" var = "realiPrice" pattern="#,###"/>${realiPrice}원</span> <span style="font-size: 12px;"> <fmt:formatNumber value = "${list.getIsaleiPrice()}" var = "saleprice" pattern="#,###"/>${saleprice}원</span></div>
    </div>
  </div>
</div>
</div>
</c:forEach>
</div>
<br> <br>
<div class = "event1">
   <a  href="https://www.guesskorea.com/front/promotion_detail.php?pidx=291&event_type=1" target="_blank">
  <img src="/resources/img/event1.png"class="event1" alt="..." width="100%" height="5%">
  </a>
     </div>
   <br>
   <center>
<h2>Sweet Summer Days</h2>
   </center>
    <br>
 <div class="jb-box">
      <video muted autoplay loop style="width: 1190px;">
        <source src="../../../resources/video/summer_main.mp4" type="video/mp4">
        <strong>Your browser does not support the video tag.</strong>
      </video>
      <div class="jb-text">
        
      </div>
    </div>
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function() {
    $(".slick_sd").slick({
      slidesToShow : 4,      
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