<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function detail(c_num) {
		location.href = "/store.do?category=" + c_num;
	}
	
	$(function() {
		$(".notice_searchForm form").submit(function(e) {
			e.preventDefault();
			self.location = "/store.do" + "${pageMaker.makeQuery(1)}"
							+ "&searchType=t"
						    + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
		});
	});
</script>
<!--content-->
<div id="wrap">
	<section id="store_quick">
	<div class="inner">
		<div class="s_item current">
			<a href="/store.do" data-tab="all"> <img
					src="img/all.png"> </a> <span>전체</span>
		</div>

		<c:forEach var="category" items="${storeCategoryList}">
			<div class="s_item current">
				<a href="javascript:detail('${category.c_num}')"> <img
					src="<c:out value="${category.c_img}"/>">
				</a> <span><c:out value="${category.c_category}" /></span>
			</div>
		</c:forEach>
	</div>
	</section>
	<section class="s_container">
			<h3 class="h_text"><c:out value="${category == '' ? '전체' : category}"/></h3>
			<div class="notice_searchForm">
				<form method="get">
					<input type="search" class="notice_search" id="keywordInput" value="${criteria.keyword}" placeholder="검색어를 입력하세요." autocomplete="off" required>
					<input type="submit" class="btn_search" value="">
				</form>
			</div>			
			<div id="all" class="s_inner">
				<c:forEach var="store" items="${storeList}" varStatus="status">
					<div class="s_img">
						<img src='/files/store/<c:out value="${store.si_rename}"/>'>
						<div class="s_detail">
							<h4><c:out value="${store.s_hashtag}"/></h4>
							<p><c:out value="${store.s_name}"/></p>
							<p><c:out value="${store.s_tel}"/></p>
							<a href="/storeDetail.do${pageMaker.makeSearch(param.page)}&num=<c:out value="${store.s_num}"/>">
								<button>상세보기</button>
							</a>
						</div>
					</div>
				</c:forEach> 
				<c:if test="${empty storeList}"> 
					데이터가 없습니다.
				</c:if>
			</div>
        	<nav class="pg_wrap">
				<c:if test="${pageMaker.prev}">
					<span class="pg_page">
						<a href="/store.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">&lt;</a>
					</span>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}" var="idx">
					<span class="pg_page <c:out value="${pageMaker.criteria.page == idx ? 'active' : ''}"/>">
						<a href="/store.do${pageMaker.makeSearch(idx)}">${idx}</a>
					</span>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<span class="pg_page">
						<a href="/store.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">&gt;</a>
					</span>
				</c:if>
			</nav>
	</section>
</div>
<!--wrap end-->