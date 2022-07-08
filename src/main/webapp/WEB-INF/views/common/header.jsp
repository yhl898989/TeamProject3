<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 bg-white border-bottom shadow-sm aaaaa" style="width: 100%;">

   <h5 class="my-0 mr-md-auto font-weight-normal">
      <a class="p-2 text-dark" href="/item/main" style="font-size: 19px">WonMaket</a>
   </h5>
   
		
<nav class="navbar is-transparent">
  

  <div id="navbarExampleTransparentExample" class="navbar-menu">
    <div class="navbar-start">
       <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link" href="https://bulma.io/documentation/overview/start/">
          품목
        </a>
        <div class="navbar-dropdown is-boxed">
          <a class="navbar-item" href="/item/list?Category=옷">
            옷
          </a>
          <a class="navbar-item" href="/item/list?Category=신발">
            신발
          </a>
          <a class="navbar-item" href="/item/list?Category=가방">
            가방
          </a>
          <a class="navbar-item" href="/item/list?Category=모자">
            모자
          </a>
          <a class="navbar-item" href="/item/list?Category=원피스">
            원피스
          </a>
          
        </div>
      </div>
    </div>
   </div>
</nav>
  
      
      <a class="p-2 text-dark" href="/notice/list">고객센터</a> 


      <c:choose>
         <c:when test="${not empty login}">
            ${login.mid}님, 환영합니다.
            <c:if test="${login.msocial == 0}">
               <a href="/member/mypage/${login.mid}">마이페이지</a>
               <a class="p-2 text-dark a" href="/member/logout">로그아웃</a>
            </c:if>
            <c:if test="${login.msocial == 1}">
               <a href="/member/s_mypage/${login.mid}">마이페이지</a>
               <a class="p-2 text-dark a" href="/member/logout">로그아웃</a>
            </c:if>
         </c:when>

         <c:when test="${(not empty alogin)}">
            <a class="p-2 text-dark" href="/item/insert">상품등록</a>
            <a class="p-2 text-dark a" href="/admin/main">관리자 페이지</a>
         ${alogin.aid}님, 환영합니다.
         
            <a class="p-2 text-dark a" href="/admin/logout">로그아웃</a>
         </c:when>

         <c:otherwise>
            <a class="p-2 text-dark a" href="/member/insert">회원가입</a>
            <a class="btn btn-outline-primary" href="/member/login2">로그인</a>

         </c:otherwise>
      </c:choose>





</div>