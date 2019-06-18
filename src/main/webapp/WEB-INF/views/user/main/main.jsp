<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	var detail = function(c_num) {
		location.href = "/store.do?category=" + c_num;
	}
</script>

<section class="home-slider-loop-false  inner-page owl-carousel">
	<div class="slider-item"
		style="background-image: url('img/banner.png');">

		<div class="container">
			<div
				class="row slider-text align-items-center justify-content-center">
				<div class="col-md-8 text-center col-sm-12 element-animate">
					<h1>Campus Town</h1>
				</div>
			</div>
		</div>

	</div>
</section>


<section class="section element-animate">

	<div class="clearfix mb-5 pb-5">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 text-center heading-wrap">
					<h2>카테고리</h2>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="width: 100%;">
		<div class="row">

			<div class='col-md-6 mb-4 mb-lg-0 col-lg-3 text-center'>
				<div class="text" style="cursor: pointer;" onclick="detail('0')">
					<h4 class="mb-5 text-primary">전체보기</h4>
				</div>
			</div>

			<c:forEach var="category" items="${storeCategoryList}">
				<div class='col-md-6 mb-4 mb-lg-0 col-lg-3 text-center'>
					<div class="text" style="cursor: pointer;"
						onclick="detail('${category.c_num}')">
						<h4 class="mb-5 text-primary">
							<c:out value="${category.c_category}" />
						</h4>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>


<section class="section bg-light element-animate">

	<div class="clearfix mb-5 pb-5">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 text-center heading-wrap">
					<h2>별점순</h2>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row no-gutters text-center">
			<c:forEach var="store" items="${storeBestList}" end="7" varStatus="status">
				<div class="col-md-6 mb-4">
					<div class="blog d-block d-lg-flex">
						<div class="bg-image"
							style="background-image: url('/img/dishes_1.jpg');"></div>
						<div class="text">
							<h3>
								<c:out value="${store.s_name}" />
								<br>
								<c:out value="${store.c_category}" />
							</h3>
							<p class="sched-time">
								<span><span class="fa fa-clock-o"></span> <c:out
										value="${store.s_hours}" /><br> <span
									class="fa fa-phone"></span> <c:out value="${store.s_tel}" /></span> <br>
							</p>
							<p>
								<c:out value="${store.s_content}" />
							</p>
							<p>
								<a href="/storeDetail.do?num=${store.s_num }"
									class="btn btn-primary btn-sm">상세 보기</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>