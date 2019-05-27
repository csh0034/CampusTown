<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	
<script>
	var detail = function(c_num) {
		location.href = "/categoryDetail.do?num="+ c_num;
	}
</script>

<%-- <c:forEach var="item" items="${mainUserList}">
	<c:out value="${item.USERNAME}"/> / 
	<c:out value="${item.USER_ID}"/> / 
	<c:out value="${item.CREATED}"/><br>
</c:forEach> --%>

<div id="sujung" class="modal">
	<p>Modal popup Testing!!</p>
	<a href="#" rel="modal:close">Close</a>
</div>
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


<section class="section bg-light element-animate">

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
				<div class="text" style="cursor:pointer;" onclick="detail('##')">
					<h4 class="mb-5 text-primary">
						전체보기
					</h4>
				</div>
			</div>
						
			<c:forEach var="category" items="${storeCategoryList}">
			<div class='col-md-6 mb-4 mb-lg-0 col-lg-3 text-center'>
				<div class="text" style="cursor:pointer;" onclick="detail('${category.c_num}')">
					<h4 class="mb-5 text-primary">
						<c:out value="${category.c_category}"/>
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
		<div class="row no-gutters">
			<div class="col-md-6">
				<div class="sched d-block d-lg-flex">
					<div class="bg-image order-2"
						style="background-image: url('img/dishes_4.jpg');"></div>
					<div class="text order-1">
						<h3>Grilled Caesar salad, shaved reggiano</h3>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Architecto illo delectus...</p>
						<p class="text-primary h3">$12.00</p>
					</div>

				</div>

				<div class="sched d-block d-lg-flex">
					<div class="bg-image"
						style="background-image: url('img/dishes_1.jpg');"></div>
					<div class="text">
						<h3>Spicy Calamari and beans</h3>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Architecto illo delectus...</p>
						<p class="text-primary h3">$12.00</p>

					</div>

				</div>

			</div>

			<div class="col-md-6">
				<div class="sched d-block d-lg-flex">
					<div class="bg-image order-2"
						style="background-image: url('img/dishes_2.jpg');"></div>
					<div class="text order-1">
						<h3>Bacon wrapped wild gulf prawns</h3>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Architecto illo delectus...</p>
						<p class="text-primary h3">$18.00</p>

					</div>

				</div>

				<div class="sched d-block d-lg-flex">
					<div class="bg-image"
						style="background-image: url('img/dishes_3.jpg');"></div>
					<div class="text">
						<h3>Seared ahi tuna fillet*, honey-ginger sauce</h3>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Architecto illo delectus...</p>
						<p class="text-primary h3">$16.00</p>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>