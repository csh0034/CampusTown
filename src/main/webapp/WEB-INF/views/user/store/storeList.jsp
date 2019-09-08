<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function detail(c_num) {
		location.href = "/store.do?category=" + c_num;
	}
</script>
<!--content-->
<div id="wrap">
		<div id="search_box">
			<form action="" name="" method="" >
				<input type="search" class="notice_search" placeholder="검색어를 입력하세요.">
				<input type="submit" class="btn_search" value="">
			</form>
		</div>
		
		<section id="store_quick">
		<div class="inner">
			<div class="s_item current">
				<a href="/store.do" data-tab="all"> ALL </a> <span>전체</span>
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
			<div id="all" class="item_content">
				<h3 class="h_text"><c:out value="${category == '' ? '전체' : category}"/></h3>
				<div id="all" class="s_inner">
					<c:forEach var="store" items="${storeList}" varStatus="status">
						<div class="s_img">
						<a href="/storeDetail.do?num=<c:out value="${store.s_num}"/>">
							<img src='/files/store/<c:out value="${store.si_rename}"/>'>
							<div class="s_detail">
								<h4><c:out value="${store.s_hashtag}"/></h4>
								<p><c:out value="${store.s_name}"/></p>
								<p><c:out value="${store.s_tel}"/></p>
								<button>상세보기</button>
							</div>
						</a>
					</div>
					</c:forEach> 
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
			</div>
		</section>
	</div>
<!--wrap end-->