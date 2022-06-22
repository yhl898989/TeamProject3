<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div
	class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
	<h5 class="my-0 mr-md-auto font-weight-normal">Company name</h5>
	<nav class="my-2 my-md-0 mr-md-3">

		<a class="p-2 text-dark" href="/item/main">메인페이지</a> <a
			class="p-2 text-dark" href="#">고객센터</a> <a class="p-2 text-dark"
			href="#">회사정보</a> <a class="p-2 text-dark" href="/item/insert">상품등록</a>

		<c:choose>
			<c:when test="${not empty login}">
				${login.mid}님, 환영합니다.
    		<a href="/member/mypage/${login.mid}">마이페이지</a>
				<a class="p-2 text-dark a" href="/member/logout">로그아웃</a>
			</c:when>
			
			<c:when test="${(not empty alogin)}">
			<a class="p-2 text-dark a" href="/admin/main">관리자 페이지</a>
			${alogin.aid}님, 환영합니다.
			
				<a class="p-2 text-dark a" href="/admin/logout">로그아웃</a>
			</c:when>
			
			<c:otherwise>
				<a class="p-2 text-dark a" href="/member/insert">회원가입</a>
				<a class="btn btn-outline-primary" href="/member/login2">로그인</a>

			</c:otherwise>
		</c:choose>






	</nav>
</div>
