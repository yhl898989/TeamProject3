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

<style type="text/css">
.mainbanner img{
height : 300px;
width : 100%;
}
*{padding:0;margin:0}
li{list-style:none}
a{text-decoration:none;font-size:14px}
.menu {
  width: 100%;
  overflow: hidden;
  
}

.menu > li {
  width: 20%; /*20*5=100%*/
  float: left;
  text-align: center;
  line-height: 40px;
  background-color: #5778ff;
}

.menu a {
  color: #fff;
  width: 100%;
}

</style>



</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<center>
<h1>쇼핑몰</h1>
</center>
 
</div>

<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/resources/img/1.jpg" class="d-block w-100" alt="..." width=100% height = 300px>
    </div>
    <div class="carousel-item">
      <img src="/resources/img/2.jpg" class="d-block w-100" alt="..." width=100% height = 300px>
    </div>
    <div class="carousel-item">
      <img src="/resources/img/3.jpg" class="d-block w-100" alt="..." width=100% height = 300px>
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
<ul class="menu">
      <li>
        <a href="/item/list" id = "옷">옷</a>
       
      </li>
      <li>
        <a href="/item/list" id = "신발">신발</a>
       
      </li>
      <li>
        <a href="/item/list" id = "가방">가방</a>
        
      </li>
      <li>
        <a href="/item/list" id = "모자">모자</a>
       
      </li>
      <li>
        <a href="/item/list" id = "원피스">원피스</a>
       
      </li>
    </ul>

<c:forEach items="${list}" var = "list">
<div class="card " style="width: 18rem;">
 <a href = "/item/read/${list.iId}">
 <div>
  <img src="/displayfile?filename=${list.ifilename}"class="card-img-top" alt="..." width="100px" height="200px">
  </div>
  </a>
  <div class="card-body">
    <p class="card-text">상품이름:${list.iName} </p>
    <p class="card-price">상품가격:${list.iPrice} </p>
  </div>
</div>
</c:forEach>



<script type="text/javascript" src = "/resources/js/item.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$(".menu").on("click","a", function() {
		let category = $(this).attr("id");
		let showhowitemlist = "itemsequence";
		localStorage.setItem("category",category);
		localStorage.setItem("showhowitemlist",showhowitemlist);
		
	})
})


</script>
</body>
</html>