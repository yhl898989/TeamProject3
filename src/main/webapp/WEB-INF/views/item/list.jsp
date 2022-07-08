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
<link href = "/resources/css/itemlist.css" rel="stylesheet">

</head>
<body>
<div id = "include">
<jsp:include page="../common/header.jsp"></jsp:include>
</div>
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
<br><br>
    <div id = "category"></div>
    <div class = "flexitem">
   
    
    <form action="/item/search" method="get">
	<select name = "criteria">
		<option value = "iName">상품이름</option>
	</select>
	<input name = "keyword">
	<input type = "submit" value = "검색">
	</form>
	 <div id = "showhowitemlist">
    <a href = "/item/list?Category=${category}&&showhowitemlist=itemsequence&&curPage=${pt.curPage}" id = "itemsequence" class = "${showhowitemlist == 'itemsequence'?'itemcss':""}">최신순</a>
    <a href = "/item/list?Category=${category}&&showhowitemlist=iPricedesc&&curPage=${pt.curPage}" id = "iPricedesc" class = "${showhowitemlist == 'iPricedesc'?'itemcss':""}">높은가격순</a>
    <a href = "/item/list?Category=${category}&&showhowitemlist=iPriceasc&&curPage=${pt.curPage}" id = "iPriceasc" class = "${showhowitemlist == 'iPriceasc'?'itemcss':""}">낮은가격순</a>
    </div>
	</div>

	<div id="itemlist" class="box-wrapper">

		<c:forEach items="${pt.list}" var="iteminfo">
			<div class="box">
				<div class="card " style="width: 18rem;">
					<a href="/item/read/${iteminfo.iId}">
						<div>
							<img src="/displayfile?filename=${iteminfo.ifilename}"
								class="card-img-top" alt="..." width="100px" height="200px">
						</div>
					</a>
					<div class="card-body">
						<p class="card-text">${iteminfo.iName}<span class = "${iteminfo.iDc > 0?'iDc':'iDchidden'}">${iteminfo.iDc}%</span></p>
						<p class="card-price"><span class = "iPrice">${iteminfo.iPrice}원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    					  					  <span><fmt:parseNumber var = "iPrice" value = "${iteminfo.iPrice < 1000?Math.floor(iteminfo.iPrice - iteminfo.iPrice*(iteminfo.iDc/100)):Math.ceil((iteminfo.iPrice - iteminfo.iPrice*(iteminfo.iDc/100))/10)*10}" integerOnly="true"/>${iPrice}원</span>
    					</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>



	<center>
	<div id = "paging">
<a href = "/item/list?curPage=${pt.curPage > 1? pt.curPage -1:1}&&showhowitemlist=${showhowitemlist}&&Category=${pt.list[0].i_CATEGORY}">&laquo;</a>
	
	<c:forEach var = "i" begin="${pt.beginPageNum}" end = "${pt.finishPageNum}">
	<a href = "/item/list?curPage=${i}&&showhowitemlist=${showhowitemlist}&&Category=${pt.list[0].i_CATEGORY}" class = "${i == pt.curPage?'red':""}">
	
	${i}
	
	
	
	</a> &nbsp;&nbsp;
	
	</c:forEach>
	<a href = "/item/list?curPage=${pt.curPage < pt.totalPage? pt.curPage + 1 : pt.totalPage}&&showhowitemlist=${showhowitemlist}&&Category=${pt.list[0].i_CATEGORY}">&raquo;</a>
</center>
	</div>	
	<br>
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src = "/resources/js/item.js"></script>
<script type="text/javascript"></script>
</body>
</html>