<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.divider-text {
	position: relative;
	text-align: center;
	margin-top: 15px;
	margin-bottom: 15px;
}

.divider-text span {
	padding: 7px;
	font-size: 12px;
	position: relative;
	z-index: 2;
}

.divider-text:after {
	content: "";
	position: absolute;
	width: 100%;
	border-bottom: 1px solid #ddd;
	top: 55%;
	left: 0;
	z-index: 1;
}

.btn-facebook {
	background-color: #405D9D;
	color: #fff;
}

.btn-twitter {
	background-color: #42AEEC;
	color: #fff;
}
</style>

<script>
	$(function() {
		$('#joinForm').submit(function(e) {
			e.preventDefault();

			if ($('#pw').val() !== $('#pwre').val()) {
				alert('비밀번호가 일치하지 않습니다.');
			} else {
				$.ajax({
					url : '/join.do',
					type : 'post',
					data : $(this).serialize(),
					success : function(data) {

						if (data === 'true') {
							alert('가입 성공');
							location.href = "/";
						} else if (data === 'false') {
							alert('가입 실패')
						}
					},
					error : function(xhr, stats, error) {
						alert('error');
					}
				});
			}
		});
	});
</script>

<section class="home-slider-loop-false  inner-page owl-carousel">
	<div class="slider-item"
		style="background-image: url('img/banner.png');">
		<div class="container">
			<div
				class="row slider-text align-items-center justify-content-center">
				<div class="col-md-8 text-center col-sm-12 element-animate">
					<h1>Join</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="section bg-light element-animate">
	<div class="container">
		<div class="row no-gutters text-center">
			<div class="col-md-12 mb-4">
				<div class="blog d-block d-lg-flex">
					<div class="card bg-light" style="width: 100%;">
						<article class="card-body mx-auto" style="width: 50%;">
							<h2 class="card-title mt-3 mb-4 text-center">Create Account</h2>
							<form id="joinForm">
								<div class="form-group input-group">
									<input name="u_id" class="form-control" placeholder="Id"
										type="text" required>
								</div>
								<div class="form-group input-group">
									<input name="u_pw" id="pw" class="form-control"
										placeholder="Create password" type="password" required>
								</div>
								<div class="form-group input-group">
									<input class="form-control" id="pwre"
										placeholder="Repeat password" type="password" required>
								</div>
								<div class="form-group input-group">
									<input name="u_name" class="form-control"
										placeholder="Full Name" type="text" required>
								</div>
								<div class="form-group input-group">
									<input name="u_email" class="form-control"
										placeholder="Email address" type="text" required>
								</div>
								<div class="form-group input-group">
									<input name="u_phone" class="form-control" placeholder="Phone"
										type="text" required>
								</div>

								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block">
										Create Account</button>
								</div>
							</form>
						</article>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>