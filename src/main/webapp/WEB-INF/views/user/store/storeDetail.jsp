<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	var rw_score = 0;

	$(function() {
		$('.fa-star-wrap-in > i').click(function() {
			rw_score = $(this).index() + 1;

			$('.fa-star-wrap-in > i').removeClass('on');

			for (var i = 0; i < rw_score; i++) {
				$('.fa-star-wrap-in > i').eq(i).addClass('on');
			}
		});

		$('#rwForm').submit(function(e) {
			e.preventDefault();

			var reviewData = {
				's_num' : '${param.num}',
				'rw_content' : $('#rw_content').val(),
				'rw_score' : rw_score
			}

			if (rw_score == 0) {
				alert('별점을 선택해주세요');
				return;
			}

			$.ajax({
				url : '/reviewAdd.do',
				type : 'post',
				data : JSON.stringify(reviewData),
				contentType : 'application/json',
				success : function(data) {
					
					if(data.length === 1) {
						location.reload();
					} else {
						alert(data);
					}
				},
				error : function(xhr, stats, error) {
					alert('error');
				}
			});

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
					<h1>Store</h1>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="section bg-light element-animate">

	<div class="clearfix mb-5 pb-5">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 text-center heading-wrap">
					<h2>점포상세</h2>
					<span class="back-text-dark"></span>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row no-gutters justify-content-center">
			<c:forEach begin="1" end="8">
			</c:forEach>

			<div class="col-md-12">
				<div class="sched d-block d-lg-flex">
					<div class="text">
						<section class="home-slider slider-custom owl-carousel">
							<div class="slider-item custom-min-max"
								style="background-image: url('img/hero_1.jpg');"></div>

							<div class="slider-item custom-min-max"
								style="background-image: url('img/hero_2.jpg');"></div>
						</section>
					</div>
					<div class="text">
						<h3 class="mt-0 text-black">점포명</h3>
						<p class="lead">
							<c:out value="${storeInfo.s_name}" />
						</p>
						<h3 class="mt-0 text-black">카테고리</h3>
						<p class="lead">
							<c:out value="${storeInfo.c_category}" />
						</p>
						<h3 class="mt-0 text-black">전화번호</h3>
						<p class="lead">
							<c:out value="${storeInfo.s_tel}" />
						</p>
						<h3 class="mt-0 text-black">운영시간</h3>
						<p class="lead">
							<c:out value="${storeInfo.s_hours}" />
						</p>
						<h3 class="mt-0 text-black">주소</h3>
						<p class="lead">
							<c:out value="${storeInfo.s_address}" />
						</p>
						<h3 class="mt-0 text-black">상점소개</h3>
						<p class="lead">
							<c:out value="${storeInfo.s_content}" />
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="sched" style="padding: 30px;">
					<form id="rwForm">
						<h3 style="display: inline-block;">
							총
							<c:out value="${reviewList.size()}" />
							개 리뷰
						</h3>
						<div class="fa-star-wrap fa-star-wrap-in" style="float: right">
							<i class="fas fa-star on"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i>
						</div>
						<input type="text" class="form-control mb-4" name="rw_content"
							id="rw_content" placeholder="리뷰입력" required="required">
						<div class="text-center">
							<button class="btn btn-primary btn-flat text-center"
								style="width: 100%; cursor:pointer" id="reviewAddBtn">리뷰등록</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-12">
				<div class="sched fa-star-wrap" style="padding: 30px;">
					<h3 style="display: inline-block;">리뷰테이블</h3>
					<br>
					<c:forEach var="review" items="${reviewList}">
						<c:out value="${review.u_id}" /> //
						<fmt:formatDate value="${review.rw_regdate}"
							pattern="yyyy-MM-dd HH:mm" /> //
						<c:out value="${review.rw_content}" /> //
						
						<c:forEach begin="1" end="${review.rw_score}">
							<i class="fas fa-star on"></i>
						</c:forEach>
						<c:forEach begin="1" end="${5 - review.rw_score}">
							<i class="fas fa-star"></i>
						</c:forEach>
						<br>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>