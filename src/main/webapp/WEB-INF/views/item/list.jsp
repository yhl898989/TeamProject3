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
  width: 1920px;
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

#itemlist{

	margin : 10px 150px 150px 270px;
	width : 1500px;
	
	
}

#showhowitemlist > a {
	color : black;
}

.box{
	
	display: inline-block;
	
} 
.card{
	display:inline-block;
	margin : 20px;
}
.flexitem{
	display: flex;
	width:1250px;
	justify-content: space-between;
	margin-left: 300px;
}
.red{
	color: red;
}
</style>



</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<center>
<h1>쇼핑몰</h1>
</center>


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
        <a href="/item/list?Category=옷" id = "옷">옷</a>
       
      </li>
      <li>
        <a href="/item/list?Category=신발" id = "신발">신발</a>
       
      </li>
      <li>
        <a href="/item/list?Category=가방" id = "가방">가방</a>
        
      </li>
      <li>
        <a href="/item/list?Category=모자" id = "모자">모자</a>
       
      </li>
      <li>
        <a href="/item/list?Category=원피스" id = "원피스">원피스</a>
       
      </li>
    </ul>
    <div id = "category"></div>
    <div class = "flexitem">
   
    
    <form action="/item/search" method="post">
	<select name = "criteria">
		<option value = "iName">상품이름</option>
	</select>
	<input name = "keyword">
	<input type = "submit" value = "검색">
	</form>
	 <div id = "showhowitemlist">
    <a href = "/item/list?Category=${pt.list[0].i_CATEGORY}&&showhowitemlist=itemsequence&&curPage=${pt.curPage}" id = "itemsequence">최신순</a>
    <a href = "/item/list?Category=${pt.list[0].i_CATEGORY}&&showhowitemlist=iPricedesc&&curPage=${pt.curPage}" id = "iPricedesc">높은가격순</a>
    <a href = "/item/list?Category=${pt.list[0].i_CATEGORY}&&showhowitemlist=iPriceasc&&curPage=${pt.curPage}" id = "iPriceasc">낮은가격순</a>
    </div>
	</div>
	
<div id = "itemlist" class = "box-wrapper">
	
	<c:forEach items = "${pt.list}" var = "iteminfo">
	<div class = "box">
	<div class="card " style="width: 18rem;">
 <a href = "/item/read/${iteminfo.iId}">
 <div>
  <img src="/displayfile?filename=${iteminfo.ifilename}"class="card-img-top" alt="..." width="100px" height="200px">
  </div>
  </a>
  <div class="card-body">
    <p class="card-text">상품이름:${iteminfo.iName}</p>
    <p class="card-price">상품가격:${iteminfo.iPrice}</p>
    <div>${pt.list[0].i_CATEGORY}</div>
  </div>
</div>
	</div>
	</c:forEach>
</div>



	<center>
<a href = "/item/list?curPage=${pt.curPage > 1? pt.curPage -1:1}&&Category=${pt.list[0].i_CATEGORY}">&laquo;</a>
	
	<c:forEach var = "i" begin="${pt.beginPageNum}" end = "${pt.finishPageNum}">
	<a href = "/item/list?curPage=${i}&&Category=${pt.list[0].i_CATEGORY}" class = "${i == pt.curPage?'red':""}">
	
	${i}
	
	
	
	</a> &nbsp;&nbsp;
	
	</c:forEach>
	<a href = "/item/list?curPage=${pt.curPage < pt.totalPage? pt.curPage + 1 : pt.totalPage}&&Category=${pt.list[0].i_CATEGORY}">&raquo;</a>
</center>	
	<br>

<script type="text/javascript" src = "/resources/js/item.js"></script>
<script type="text/javascript">
$(document).ready(function() {
		
	$("#showhowitemlist").on("click","a",function() {
			$(this).attr("class","aaa");
	})
	

</script>
</body>
</html>