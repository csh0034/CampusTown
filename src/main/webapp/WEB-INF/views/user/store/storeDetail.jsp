<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--content-->
<div id="wrap">
	<section id="store_img_wrap">
		<div class="img_inner">
			<ul id="store_img" class="fade">
				<li><img src="files/store1.jpg" alt="상점 이미지"></li>
				<li><img src="files/store2.jpg" alt="상점 이미지"></li>
			</ul>
		</div>
		<div class="store_inner">
			<div class="store_menu">
				<img id="share" src="img/share.png" alt="공유아이콘"> <img
					id="phone" src="img/phone_white.png" alt="전화아이콘"> <span>
					음식점 </span>
			</div>
			<p>
				<strong>THE 담다</strong> <span> #한식</span> <span> #돈까스</span>
			</p>
			<ul class="store_info">
				<li id="open"><img src="img/open.png" alt="오픈 아이콘"> 10:00
				</li>
				<li id="close"><img src="img/close.png" alt="마감 아이콘">
					20:00</li>
				<li id="phone"><img src="img/phone_white.png" alt="공유 아이콘">
					CALL</li>
				<li id="share"><img src="img/share.png" alt="전화 아이콘">
					SHARE</li>
			</ul>
		</div>
	</section>
	<section id="store_desc">
		<div class="store_desc">

			<!-- 상점소개 -->
			<ul>
				<li class="store_desc_title">
					<h3>상점 소개</h3>
				</li>
				<li class="store_intro">HACCP 인증받은 재료로 정성을 다해 조리합니다.</li>
			</ul>
			<!-- 영업정보 -->
			<ul>
				<li class="store_desc_title">
					<h3>영업 정보</h3>
				</li>
				<li class="store_hashtag store_desc_hashtag"><img
					src="img/hashtag.png" alt="해시태그 아이콘"> #한식 #돈까스</li>
				<li class="store_open store_desc_open"><img src="img/clock.png"
					alt="영업시간 아이콘"> 10:00 ~ 20:00</li>
				<li class="store_phone store_desc_phone"><img
					src="img/phone.png" alt="전화번호 아이콘"> 02-1234-1234</li>
				<li class="store_location store_desc_location"><img
					src="img/location.png" alt="주소 아이콘"> 서울시 용마산로 333</li>
			</ul>
		</div>
	</section>

		<section id="today">
			<h3 class="h_text">오늘의 식당</h3>
			<ul class="today today_str">
				<li>
					<img src="files/store1.jpg" alt="오늘의 식당1">
				</li>
				<li>
					<img src="files/store2.jpg" alt="오늘의 식당2">
				</li>
				<li>
					<img src="files/store3.jpg" alt="오늘의 식당3">
				</li>
				<li>
					<img src="files/store4.jpg" alt="오늘의 식당4">
				</li>
			</ul>
		</section>

	<div class="store_share">
		<button class="share">
			<span><img src="img/share.svg" alt="공유 아이콘"> </span> 공유하기
		</button>
	</div>

	<div class="store_list">
		<ul class="back_list">
			<li><a href="#" class="bnt_list"><img src="img/list.png"
					alt="목록 이미지"> 상점 목록</a></li>
		</ul>
	</div>
</div>