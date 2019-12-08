<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--content-->
<div id="wrap">
	<div class="home_nav">
		<img src="/img/home.svg" alt="홈 아이콘" class="home_icon"> HOME >
		커뮤니티 > 공지사항
	</div>

	<div class="notice_header">
		<h3>공지사항</h3>
	</div>

	<section id="notice_detail">
		<div class="notice_detail">
			<div class="notice_detail_title">
				<h3><c:out value="${noticeInfo.n_title}" /></h3>
			</div>
			<div class="notice_date notice_detail_date">
				<img src="/img/clock.png" alt="작성일 이미지"> <fmt:formatDate pattern="yyyy-MM-dd" value="${noticeInfo.n_regdate}" />
			</div>
			<div class="notice_count notice_detail_count">
				<img src="/img/count.png" alt="조회수 이미지"> 조회수 : <c:out value="${noticeInfo.n_hit}" />
			</div>
			<div class="notice_writer notice_detail_writer">
				<img src="/img/writer.png" alt="작성자 이미지"> 캠퍼스타운 관리자
			</div>
			<div class="notice_content">
				<a target="_blank" href='<c:out value="${noticeInfo.n_url}" />'>
					<img src="/files/notice/<c:out value="${noticeInfo.n_attach}"/>" alt="공지이미지">
				</a>
				<pre><c:out value="${noticeInfo.n_content}"/></pre>
			</div>

			<ul class="back_list">
				<li><a href="javascript: history.go(-1)" class="bnt_list"><img src="/img/list.png"
						alt="목록 이미지"> 목록</a></li>
			</ul>
		</div>
	</section>
</div>