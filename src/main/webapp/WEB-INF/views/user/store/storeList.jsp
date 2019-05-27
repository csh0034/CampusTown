<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	var detail = function(s_num) {
		location.href = "/storeDetail.do?num="+ s_num;
	}
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
			<c:forEach begin="1" end="8">
			</c:forEach>

			<div class="col-md-12">
				<div class="sched d-block d-lg-flex">
					<c:forEach var="store" items="${storeList}" varStatus="status">
						<c:if test="${status.count eq 5}">
							${"</div></div>"}
							${"<div class='col-md-12'>"}
							${"<div class='sched d-block d-lg-flex'>"}
						</c:if>
						<div class="text" style="cursor:pointer;"
						onclick="detail('${store.s_num}')">
							<h3>
								<c:out value="${store.s_name}" />
								<br>
								<c:out value="${store.c_category}" />
							</h3>
							<p>
								<c:out value="${store.s_content}" />
							</p>
							<p>
								<c:out value="${store.s_hours}" />
								<br>
								<c:out value="${store.s_tel}" />
							</p>
						</div>
						<c:if test="${status.last}">
							${"</div></div>"}
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>