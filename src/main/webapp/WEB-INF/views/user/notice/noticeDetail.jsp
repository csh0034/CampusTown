<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.noticeDetail {
	width: 100%;
	font-size: 17px;
	border: 1px solid #d2d2d2;
}

.noticeDetail tr {
	border: 1px solid #e9ecef;
}

.noticeDetail td, .noticeDetail th {
	padding: 10px 20px;
}

.noticeDetail th {
	border-right: 1px solid #e9ecef;
}

.noticeDetail .content {
	text-align: left;
	height: 500px;
	vertical-align: baseline;
}

.noticeDetail textarea {
	width: 100%;
	resize: none;
	border: none;
}
</style>

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

<section class="section bg-light element-animate">

	<div class="clearfix mb-5 pb-5">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 text-center heading-wrap">
					<h2>공지상세</h2>
					<span class="back-text-dark"></span>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row no-gutters justify-content-center">
			<div class="col-md-12 mb-4">
				<table class="noticeDetail text-center" style="background: white;">
					<tr>
						<th>제목</th>
						<td colspan="3"><c:out value="${noticeInfo.n_num}" /></td>
					</tr>
					<tr>
						<th>등록일</th>
						<td style="border-right: 1px solid #e9ecef;"><fmt:formatDate
								pattern="yyyy-MM-dd" value="${noticeInfo.n_regdate}" /></td>
						<th>조회수</th>
						<td><c:out value="${noticeInfo.n_hit}" /></td>
					</tr>
					<tr>
						<td colspan="4" class="content"><textarea readonly><c:out
								value="${noticeInfo.n_content}"/></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="3"><a
							href="/admin/noticeDownload.do?file=${noticeInfo.n_attach}"><c:out
									value="${noticeInfo.n_attach}" /></a> <c:if
								test="${empty noticeInfo.n_attach}">
										첨부파일이 없습니다.
									</c:if></td>
					</tr>
				</table>
			</div>
			<div class="col-md-12 mb-4 text-center">
				<div class="form-group">
					<button type="button" class="btn btn-primary btn-flat"
						style="cursor: pointer;" onclick="location.href='/notice.do'">목록보기</button>
				</div>
			</div>
		</div>
	</div>
</section>