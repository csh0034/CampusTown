<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="menu-nav">
	<ul id="menu">
		<li class="main"><a href="#">사업소개</a>
			<ul class="sub">
				<li><a href="#">인사말</a></li>
				<li><a href="#">캠퍼스타운이란</a></li>
				<li><a href="#">오시는길</a></li>
			</ul></li>
		<li class="main"><a href="#">상점소개</a>
			<ul class="sub">
				<li><a href="/store.do">상점목록</a></li>
			</ul></li>
		<li class="main"><a href="#">커뮤니티</a>
			<ul class="sub">
				<li><a href="/notice/list.do">공지사항</a></li>
				<li><a href="/notice/list.do?type=1">사업단 공지사항</a></li>
				<li><a href="/notice/list.do?type=2">자유게시판</a></li>
			</ul></li>
		<li class="main"><a href="#">대학협력사업</a>
			<ul class="sub">
				<li><a href="#">협력사업소개</a></li>
			</ul></li>
		<li class="main"><a href="#">관리</a>
			<ul class="sub">
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<li><a href="/login.do">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/admin/main.do">관리페이지</a></li>
						<li><a href="/logout.do">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul></li>
	</ul>
</nav>
