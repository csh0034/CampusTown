<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function appDown() {
		if (confirm('앱을 다운받으시겠습니까?')) {
			location.href = '/files/CampusTown.apk';
		}
	}
</script>

<!--content-->
	<div id="wrap">
		<section id="slide">
			<ul id="mainImg" class="fade">
				<li>
					<img src="files/main1.jpg" alt="슬라이드1">
				</li>
				<li>
					<img src="files/main2.jpg" alt="슬라이드2">
				</li>
				<li>
					<img src="files/main3.jpg" alt="슬라이드3">
				</li>
			</ul>
		</section>
		<section id="notice">
			<dl>
				<c:forEach var="item" items="${noticeRecentInfo}">
					<c:if test="${item.n_type eq 0}">
						<dt>공지</dt>
					</c:if>
					<c:if test="${item.n_type eq 1}">
						<dt>사업단공지</dt>
					</c:if>
				<dd>
					<a href="/notice/detail.do?num=<c:out value='${item.n_num}'/>">
						<c:out value="${item.n_title}"/>
					</a>
				</dd>
				</c:forEach>
			</dl>           
		</section>
		<section id="intro">
			<div class="intro_box">
				<p>BUSINESS INTRODUCTION</p>
				<p>캠퍼스타운이란?</p>
				<p>서일대학교 상가들의 정보제공을 통하여<br/> 서일대학 학생들이 갖는 편리함과,<br/>더불어 대학상권의 동반성장을 기대하고자 합니다.</p>
				<button class="more_btn" onclick="location.href='/info.do'">MORE ▶</button>
			</div>
			<div class="app_box">
				<a href="javascript:appDown()"></a>
			</div>
		</section>
		<section id="quick">
			<h3 class="h_text">QUICK MENU</h3>
			<div class="inner">
				<c:forEach var="category" items="${storeCategoryList}">
						<div class="q_item">
						<a href="/store.do?category=${category.c_num}">
							<img src="<c:out value="${category.c_img}"/>">
						</a>
						<span><c:out value="${category.c_category}" /></span>
					</div>
				</c:forEach>
	
				<div class="q_item">
					<a href="/store.do">
						<img src="img/more.png">
					</a>
					<span>더보기</span>

				</div>
				<div class="q_item">
				</div>
			</div>
		</section>
		<section id="today">
			<h3 class="h_text">오늘의 식당</h3>
			<ul class="today today_str">
				<c:forEach var="store" items="${storeRecommendList}" varStatus="status">
					<li class="s_img" style="cursor:pointer;">
						<img src='/files/store/<c:out value="${store.si_rename}"/>'  alt="오늘의 식당 ${status.count}">
						<div class="today_s_detail s_detail ">
							<h4><c:out value="${store.s_hashtag}"/></h4>
							<p><c:out value="${store.s_name}"/></p>
							<p><c:out value="${store.s_tel}"/></p>
							<a href="/storeDetail.do?num=<c:out value="${store.s_num}"/>">
								<button>상세보기</button>
							</a>  
						</div>
					</li>
				</c:forEach> 
			</ul>
		</section>
		<section id="map">
			<h3 class="h_text">CAMPUSTOWN MAP</h3>
			<img src="files/map.png" alt="캠퍼스타운지도">
		</section>
	</div>
<!--wrap end-->