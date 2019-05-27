<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	
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
					<h2>점포리스트</h2>
					<span class="back-text-dark"></span>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row no-gutters">
			<c:forEach var="store" items="${storeList}" varStatus="status">
				<div class="col-md-6 mb-4">
					<div class="blog d-block d-lg-flex">
						<div class="bg-image"
							style="background-image: url('img/dishes_1.jpg');"></div>
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
			<div class="col-md-12 mb-4 text-center">
				<nav>
					<ul class="pagination pagination-lg">
						<li><a href="#" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</section>