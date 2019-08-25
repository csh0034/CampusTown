<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--content-->
<div id="wrap">
	<div id="search_box">
		<form action="" name="" method="post">
			<input type="search" class="notice_search" placeholder="검색어를 입력하세요.">
			<input type="submit" class="btn_search" value="">
		</form>
	</div>
	<section id="login_inner">
		<h2 id="login_logo">CAMPUS TOWN</h2>
		<form method="post" id="loginForm" action="">
			<div class="box_inner">
				<input type="email" id="loginId" name="loginId" class="login_box"
					placeholder="아이디"><br /> <input type="password"
					id="loginPw" name="password" class="login_box" placeholder="비밀번호">
			</div>
			<button type="submit" disabled="disabled" class="login_box"
				id="login_btn">로그인</button>
		</form>
	</section>
</div>
<!--wrap end-->