<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function goDetail(num) {
		location.href = "/notice/detail.do?num=" + num;
	}
	
	$(function() {
		$(".notice_searchForm .btn_search").click(function(e) {
			e.preventDefault();
			self.location = "/notice/list.do" + "${pageMaker.makeQuery(1)}"
							+ "&searchType=t"
						    + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
		});
	});
</script>
<!--content-->
<div id="wrap">
	<div class="home_nav">
		<img src="/img/home.svg" alt="홈 아이콘" class="home_icon"> HOME >
		커뮤니티 > 공지사항
	</div>

	<div class="notice_header">
		<h3>공지사항</h3>
	</div>

	<div class="notice_searchForm">
		<form method="get">
			<input type="search" class="notice_search" id="keywordInput" value="${criteria.keyword}" placeholder="검색어를 입력하세요.">
			<input type="submit" class="btn_search" value="">
		</form>
	</div>

	<section id="notice_list">
		<div class="notice_list">
			<div class="table_wrap">

				<c:forEach var="notice" items="${noticeList}" varStatus="status">
					<div class="table_row" style="cursor: pointer;" onclick="goDetail('<c:out value="${notice.n_num}" />')">
						<div class="notice_imgOutline">
							<img src="/files/notice/<c:out value="${notice.n_attach}" />" alt="공지사항 이미지" class="notice_img">
						</div>
						<div class="notice_info">
							<div class="notice_title"><c:out value="${notice.n_title}" /></div>
							<div class="notice_writer">
								<img src="/img/writer.png" alt="작성자 이미지">캠퍼스타운 관리자
							</div>
							<div class="notice_date">
								<img src="/img/clock.png" alt="작성일 이미지">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.n_regdate}" />
							</div>
							<div class="notice_count">
								<img src="/img/count.png" alt="조회수 이미지">조회:<c:out value="${notice.n_hit}" />
							</div>
						</div>
					</div>
				</c:forEach>
				<c:if test="${empty noticeList}"> 
					<div class="table_row">
						데이터가 없습니다.
					</div>
				</c:if>

<!-- 				<div class="table_row">
					<div class="notice_imgOutline">
						<img src="/files/notice_img2.jpg" alt="공지사항 이미지" class="notice_img">
					</div>
					<div class="notice_info">
						<div class="notice_title">서일대 캠퍼스타운</div>
						<div class="notice_writer">
							<img src="/img/writer.png" alt="작성자 이미지">서일대 캠퍼스타운 관리자
						</div>
						<div class="notice_date">
							<img src="/img/clock.png" alt="작성일 이미지">2019-05-31
						</div>
						<div class="notice_count">
							<img src="/img/count.png" alt="조회수 이미지">조회:1
						</div>
					</div>
				</div>

				<div class="table_row">
					<div class="notice_imgOutline">
						<img src="/files/notice_img3.jpg" alt="공지사항 이미지" class="notice_img">
					</div>
					<div class="notice_info">
						<div class="notice_title">서일대 캠퍼스타운</div>
						<div class="notice_writer">
							<img src="/img/writer.png" alt="작성자 이미지">서일대 캠퍼스타운 관리자
						</div>
						<div class="notice_date">
							<img src="/img/clock.png" alt="작성일 이미지">2019-05-31
						</div>
						<div class="notice_count">
							<img src="/img/count.png" alt="조회수 이미지">조회:1
						</div>
					</div>
				</div>

				<div class="table_row">
					<div class="notice_imgOutline">
						<img src="/files/notice_img.jpg" alt="공지사항 이미지" class="notice_img">
					</div>
					<div class="notice_info">
						<div class="notice_title">서일대 캠퍼스타운</div>
						<div class="notice_writer">
							<img src="/img/writer.png" alt="작성자 이미지">서일대 캠퍼스타운 관리자
						</div>
						<div class="notice_date">
							<img src="/img/clock.png" alt="작성일 이미지">2019-05-31
						</div>
						<div class="notice_count">
							<img src="/img/count.png" alt="조회수 이미지">조회:1
						</div>
					</div>
				</div>

				<div class="table_row">
					<div class="notice_imgOutline">
						<img src="/files/notice_img2.jpg" alt="공지사항 이미지" class="notice_img">
					</div>
					<div class="notice_info">
						<div class="notice_title">서일대 캠퍼스타운</div>
						<div class="notice_writer">
							<img src="/img/writer.png" alt="작성자 이미지">서일대 캠퍼스타운 관리자
						</div>
						<div class="notice_date">
							<img src="/img/clock.png" alt="작성일 이미지">2019-05-31
						</div>
						<div class="notice_count">
							<img src="/img/count.png" alt="조회수 이미지">조회:1
						</div>
					</div>
				</div> -->
			</div>
			
			<nav class="pg_wrap">
				<c:if test="${pageMaker.prev}">
					<span class="pg_page" onclick="location.href='/notice/list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}'">
						&lt;
					</span>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}" var="idx">
					<span class="pg_page <c:out value="${pageMaker.criteria.page == idx ? 'active' : ''}"/>">
						<a href="/notice/list.do${pageMaker.makeSearch(idx)}">${idx}</a>
					</span>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<span class="pg_page" onclick="location.href='/notice/list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}'">
						&gt;
					</span>
				</c:if>
			</nav>
		</div>
	</section>
</div>