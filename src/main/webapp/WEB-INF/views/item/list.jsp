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
<link href = "/resources/css/header.css" rel="stylesheet">
<link href = "/resources/css/itemlist.css" rel="stylesheet">

</head>
<body>
<header style="position: fixed; z-index: 10;">
<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div style="height: 54.5px;">
</div>
 <img src="${category == '가방'?'/resources/img/bag.jpg': category == '옷'?'/resources/img/clothes.jpg':category == '모자'?'/resources/img/hat.jpg':category == '신발'?'/resources/img/shoes.png':category == '악세사리'?'/resources/img/accessory.png':''}" class="d-block w-100" alt="..." width=100% height = 380px>
 
<br><br>
    <div id = "category"></div>
    <div class = "flexitem">
   
    
    
	
	 <div id = "showhowitemlist">
    <a href = "/item/list?Category=${category}&&showhowitemlist=itemsequence&&curPage=${pt.curPage}" id = "itemsequence" class = "${showhowitemlist == 'itemsequence'?'itemcss':""}">최신순</a>
    <a href = "/item/list?Category=${category}&&showhowitemlist=iPricedesc&&curPage=${pt.curPage}" id = "iPricedesc" class = "${showhowitemlist == 'iPricedesc'?'itemcss':""}">높은가격순</a>
    <a href = "/item/list?Category=${category}&&showhowitemlist=iPriceasc&&curPage=${pt.curPage}" id = "iPriceasc" class = "${showhowitemlist == 'iPriceasc'?'itemcss':""}">낮은가격순</a>
    </div>
	</div>

	<div id="itemlist" class="box-wrapper">

		<c:forEach items="${pt.list}" var="iteminfo">
			<div class="box">
				<div class="card ">
					<a href="/item/read/${iteminfo.iId}">
						<div>
							<img src="/displayfile?filename=${iteminfo.ifilename}"
								class="card-img-top" alt="..." width="100px" height="200px">
						</div>
					</a>
					<div class="card-body">
						<p class="card-text">${iteminfo.iName}</p>
						<p class="card-price"><div class = "iPrice">${iteminfo.iPrice}원<span class = "${iteminfo.iDc > 0?'iDc':'iDchidden'}">sale&nbsp;${iteminfo.iDc}%</span></div>
    					  					  <div>${iteminfo.getIsaleiPrice()}원</div>
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