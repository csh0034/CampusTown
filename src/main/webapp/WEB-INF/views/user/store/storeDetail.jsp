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
		
		
		$('#rnForm').submit(function(e) {
			e.preventDefault();

			var reservationData = {
				's_num' : '${param.num}',
				'rn_count' : $('#rn_count').val(),
				'rn_date' : $('#rn_date').val() + " " + $('#rn_hour').val(),
				'rn_name' : $('#rn_name').val(),
				'rn_content' : $('#rn_content').val()
			}

			$.ajax({
				url : '/reservationAdd.do',
				type : 'post',
				data : JSON.stringify(reservationData),
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
					<div class="text" style="margin:auto;">
						<div style="margin-top:15px; display:flex;">  
							<h2><c:out value="${storeInfo.s_name}"/></h2>
							<a style="margin-left:12px; margin-top:12px;"><c:out value="${storeInfo.c_category}" /></a> 
						</div>
						<div style="text-align:center; margin-top:0.4rem;">
							<p style="color:black;"> 
								<c:out value="${storeInfo.s_content}" />
							</p>
						</div>

						
						<hr style="border: 1px, solid;"/>
						
						<div style="margin-left:5%;">
						<div class="inform-wrap">
							<span class="fa fa-phone detail-icon"></span>
							<c:out value="${storeInfo.s_tel}" />
						</div>
						<div class="inform-wrap">
							<span class="fa fa-clock-o detail-icon"></span>
							<c:out value="${storeInfo.s_hours}" />
						</div>
						<div class="inform-wrap">
							<span class="fa fa-map-marker detail-icon"></span>
							<c:out value="${storeInfo.s_address}" />
						</div>
						<div class="inform-wrap">
							<span class="fa fa-globe detail-icon"></span>
							<c:out value="${storeInfo.s_snsurl}" />
						</div>
						<div class="inform-wrap">
							<span class="fa fa-tag detail-icon"></span>
							<c:out value="${storeInfo.s_hashtag}" />
						</div>
						</div>
						
						<hr style="border: 1px, solid;"/>
						
						<a class="btn btn-primary btn-flat text-center" data-toggle="modal" href="#reservationModal"
							style="width: 100%" id="reservationAddBtn">예약하기</a>


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
								style="width: 100%" id="reviewAddBtn">리뷰등록</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-12">
				<div class="sched fa-star-wrap" style="padding: 30px;">
					<h3 style="display: inline-block;">리뷰테이블</h3>
					<br> 
					<c:forEach var="review" items="${reviewList}">
						<div style="display: inline; padding-right:30px;">
							<div style="display: inline; width:20%; margin-right:30px;">
								<c:out value="${review.u_id}" />
							</div>
							<div style="display: inline;">
								<fmt:formatDate value="${review.rw_regdate}"
									pattern="yyyy-MM-dd HH:mm" />
							</div>
						</div>
						
						<div style="display: inline-block; width:40%;">
							<c:out value="${review.rw_content}" />
						</div>
						<div style="display: inline-block; width:20%; text-align:right;">
							<c:forEach begin="1" end="${review.rw_score}">
								<i class="fas fa-star on"></i>
							</c:forEach>
							<c:forEach begin="1" end="${5 - review.rw_score}">
								<i class="fas fa-star"></i>
							</c:forEach>
						</div>
						<br>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>