<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(document).ready(
			function() {
				var result = "${msg}";

				if (result == "INSERT") {
					alert("게시글이 등록되었습니다.");
				} else if (result == "DELETED") {
					alert("게시글이 삭제되었습니다.");
				}

				$("#searchBtn").on(
						"click",
						function(event) {
							self.location = "store.do"
									+ "${pageMaker.makeQuery(1)}"
									+ "&searchType="
									+ $('select option:selected').val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());

						});

			});

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
					<h1>Store</h1>
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
					<h2>상점리스트</h2>
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
	<div class="container">
		<div class="row no-gutters text-center">
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
			<c:choose>
				<c:when test="${empty storeList}">
					<div class="col-md-12 mb-5 text-center">
						<h2>검색된 상점이 없습니다</h2>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-md-12 mb-4">
						<ul class="pagination pagination-lg">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="/store.do${pageMaker.makeSearch(pageMaker.startPage - 1)}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
									<a href="/store.do${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="/store.do${pageMaker.makeSearch(pageMaker.endPage + 1)}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="col-md-6 mb-4"></div>
			<div class="col-md-2 mb-4">
				<div class="form-group text-right">
					<select class="form-control" name="searchType" id="searchType"
						style="height: auto;">
						<option value="n"
							<c:out value="${criteria.searchType == null ? 'selected' : ''}"/>>::::::
							선택 ::::::</option>
						<option value="t"
							<c:out value="${criteria.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						<option value="c"
							<c:out value="${criteria.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						<option value="tc"
							<c:out value="${criteria.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					</select>
				</div>
			</div>
			<div class="col-md-4 mb-4">
				<div class="form-group">
					<div class="input-group">
						<input type="text" class="form-control" name="keyword"
							id="keywordInput" value="${criteria.keyword}" placeholder="검색어">
						<span class="input-group-btn">
							<button type="button" class="btn btn-primary btn-flat"
								id="searchBtn">
								<i class="fa fa-search"></i> 검색
							</button>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>