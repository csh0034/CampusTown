<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(function() {
		var result = "${msg}";

		if (result == "INSERT") {
			alert("게시글이 등록되었습니다.");
		} else if (result == "DELETED") {
			alert("게시글이 삭제되었습니다.");
		}

		$("#searchBtn").click(
				function(event) {
					self.location = "notice.do" + "${pageMaker.makeQuery(1)}"
							+ "&searchType="
							+ $('select option:selected').val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());

				});

		$('tbody > tr').click(function() {
			var num = $(this).children().eq(0).html();

			location.href = "/noticeDetail.do?num=" + num;
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
					<h1>Notice</h1>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="section element-animate">
	<div class="clearfix">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 text-center heading-wrap">
					<h2>공지리스트</h2>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="section bg-light element-animate">
	<div class="container">
		<div class="row no-gutters text-center">
			<div class="col-md-12 mb-4">
				<table class="table table-striped table-bordered table-hover"
					style="background: white;">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="notice" items="${noticeList}" varStatus="status">
							<tr style="cursor: pointer;">
								<td><c:out value="${notice.n_num}" /></td>
								<td><c:out value="${notice.n_title}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${notice.n_regdate}" /></td>
								<td><c:out value="${notice.n_hit}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<c:choose>
				<c:when test="${empty noticeList}">
					<div class="col-md-12 mb-5 text-center">
						<h2>검색된 공지사항이 없습니다</h2>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-md-12">
						<ul class="pagination pagination-lg">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="/notice.do${pageMaker.makeSearch(pageMaker.startPage - 1)}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
									<a href="/notice.do${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="/notice.do${pageMaker.makeSearch(pageMaker.endPage + 1)}"
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