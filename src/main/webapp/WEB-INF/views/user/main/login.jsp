<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {
		$('#loginForm').submit(function(e) {
			e.preventDefault();
			
			$.ajax({
				url  : '/login.do',
				type : 'post',
				data : $(this).serialize(),
				success : function(data) {
					
					if(data === 'true') {
						location.href='/admin/main.do';
					} else if(data === 'false') {
						alert('아이디와 비밀번호를 확인해주세요');
					}
				},
				error : function(xhr, stats, error) {
					alert('error');
				}
			});
		});
	});
</script>
<div id="wrap">
	<section id="login_inner">
		<h2 id="login_logo">CAMPUS TOWN</h2>
		<form method="post" id="loginForm">
			<div class="box_inner">
				<input type="text" id="loginId" name="u_id" class="login_box" required
					placeholder="아이디"><br /> <input type="password"
					id="loginPw" name="u_pw" class="login_box" placeholder="비밀번호" required>
			</div>
			<button class="login_box" id="login_btn">로그인</button>
		</form>
	</section>
</div>
