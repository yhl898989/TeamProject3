<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="header">

   <h5 class="">
      <a class="p-2 text-dark aaaaaaa" href="/item/main"
         style="font-size: 19px">WonMaket</a>
   </h5>

   <div class="header2">

      <nav class="navbar navbar-expand-lg navbar-light bg-light nav_back">

         <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">

               <a class="nav-link" href="/item/list?Category=옷"> 옷 </a> 
               <a class="nav-link" href="/item/list?Category=신발"> 신발 </a>
                <a class="nav-link" href="/item/list?Category=가방"> 가방 </a> 
                <a class="nav-link" href="/item/list?Category=모자"> 모자 </a> 
                <a class="nav-link" href="/item/list?Category=악세사리"> 악세사리 </a>




               <c:choose>
                  <c:when test="${not empty login}">
           
            <form action="/item/search" method="get">
                  <div class="searchcss">
                     <div class="input-group mr-sm-2">
                        <select name="criteria" id="select">
                           <option value="iName">상품이름</option>
                        </select> <input style="width: 150px;" class="form-control mr-sm-2"
                           type="search" placeholder="Search" aria-label="Search"
                           name="keyword">
                        <button class="button7" type="submit">
                           <img alt="" src="../../../resources/img/search.png"
                              style="height: 25px; width: 25px;">
                        </button>
                        </div>
                  </div>
            
            </form> &nbsp;
            <c:if test="${login.msocial == 0}">
                        <li class="nav-item dropdown"><a
                           class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                           role="button" data-toggle="dropdown" aria-expanded="false">
                              <img alt="" src="../../../resources/img/log_m.png"
                              style="height: 20px; width: 20px;">
                        </a>
                           <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="text-align: center;">
                           <p style="color: red;">${login.mid}님</p> 
                              <a class="dropdown-item" href="/member/mypage/${login.mid}">마이페이지</a>
                              <a class="dropdown-item"  href="/myorderList/${login.mid}">주문 내역</a>
                              <a class="dropdown-item" href="/notice/list">고객센터</a> <a
                                 class="dropdown-item" href="/member/logout">로그아웃</a>
                              <div class="dropdown-divider"></div>
                           </div></li>
                     </c:if>
                     <c:if test="${login.msocial == 1}">
                        <li class="nav-item dropdown"><a
                           class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                           role="button" data-toggle="dropdown" aria-expanded="false">
                              <img alt="" src="../../../resources/img/log_m.png"
                              style="height: 20px; width: 20px;">
                        </a>
                           <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="text-align: center;">
                            <p style="color: red;">${login.mid}님</p> 
                              <a class="dropdown-item" href="/member/s_mypage/${login.mid}">마이페이지</a>
                              <a class="dropdown-item"  href="/myorderList/${login.mid}">주문 내역</a>
                              <a class="dropdown-item" href="/notice/list">고객센터</a> <a
                                 class="dropdown-item" href="/member/logout">로그아웃</a>
                              <div class="dropdown-divider"></div>
                           </div></li>
                     </c:if>
                  </c:when>





                  <c:when test="${(not empty alogin)}">
           
        
         <form action="/item/search" method="get">
                  <div class="searchcss">
                     <div class="input-group mr-sm-2">
                        <select name="criteria" id="select">
                           <option value="iName">상품이름</option>
                        </select> <input style="width: 150px;" class="form-control mr-sm-2"
                           type="search" placeholder="Search" aria-label="Search"
                           name="keyword">
                        <button class="button7" type="submit">
                           <img alt="" src="../../../resources/img/search.png"
                              style="height: 25px; width: 25px;">
                        </button>
                        </div>
                  </div>
            
            </form> &nbsp;
         <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                        role="button" data-toggle="dropdown" aria-expanded="false">
                           <img alt="" src="../../../resources/img/log_a.png"
                           style="height: 20px; width: 20px;">
                     </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="text-align: center;">
                         <p style="color: red;">${alogin.aid}님</p> 
                           <a class="nav-link" href="/item/insert">상품등록</a> <a
                              class="nav-link" href="/admin/main">관리자 페이지</a> <a
                              class="nav-link" href="/admin/logout">로그아웃</a>
                           <div class="dropdown-divider"></div>
                        </div></li>

                  </c:when>

                  <c:otherwise>
                  <form action="/item/search" method="get">
                  <div class="searchcss">
                     <div class="input-group mr-sm-2">
                        <select name="criteria" id="select">
                           <option value="iName">상품이름</option>
                        </select> <input style="width: 150px;" class="form-control mr-sm-2"
                           type="search" placeholder="Search" aria-label="Search"
                           name="keyword">
                        <button class="button7" type="submit">
                           <img alt="" src="../../../resources/img/search.png"
                              style="height: 25px; width: 25px;">
                        </button>
                        </div>
                  </div>
            
            </form> &nbsp;
                     <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                        role="button" data-toggle="dropdown" aria-expanded="false">
                           <img alt="" src="../../../resources/img/log.png"
                           style="height: 20px; width: 20px;">
                     </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="text-align: center;">
                           <a class="nav-link" href="/member/insert">회원가입</a> <a
                              class="nav-link" href="/member/login2">로그인</a>
                           <div class="dropdown-divider"></div>
                        </div></li>

                  </c:otherwise>
               </c:choose>



               

                     


         </div>
   </div>
</div>


</nav>







</div>
</div>