<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--content-->
<div id="wrap">
	<div class="home_nav">
		<img src="img/home.svg" alt="홈 아이콘" class="home_icon"> HOME >
		통합검색
	</div>

	<div class="notice_header">
		<h3>검색결과</h3>
	</div>

	<div class="search_result">
		<h4>""로 검색한 결과입니다.</h4>
	</div>
	<div class="notice_searchForm">
		<form action="" name="" method="post">
			<input type="search" class="notice_search" placeholder="검색어를 입력하세요.">
			<input type="submit" class="btn_search" value="">
		</form>
	</div>

	<div class="search_tabs">
		<ul class="tabs">
			<li class="tab-link current" data-tab="search_store">상점목록</li>
			<li class="tab-link" data-tab="search_notice">공지사항</li>
		</ul>
	</div>

	<section id="search_store" class="tab-content current">
		<div class="search_list">
			<div class="table_wrap">
				<div class="table_row">
					<div class="search_imgOutline">
						<img src="img/store1.jpg" alt="상점 이미지" class="search_img">
					</div>
					<div class="search_info">
						<div class="store_name">THE 담다</div>
						<div class="store_hashtag">
							<img src="img/hashtag.png" alt="해시태그 이미지"> 한식, 돈까스
						</div>
						<div class="store_open">
							<img src="img/clock.png" alt="시간 이미지"> 10:00 - 8:00
						</div>
						<div class="store_phone">
							<img src="img/phone.png" alt="전화번호 이미지"> 010-0000-0000
						</div>
					</div>
				</div>

				<div class="table_row">
					<div class="search_imgOutline">
						<img src="img/store2.jpg" alt="상점 이미지" class="search_img">
					</div>
					<div class="search_info">
						<div class="store_name">소소식당</div>
						<div class="store_hashtag">
							<img src="img/hashtag.png" alt="해시태그 이미지"> 일식, 에비카츠
						</div>
						<div class="store_open">
							<img src="img/clock.png" alt="시간 이미지"> 10:00 - 8:00
						</div>
						<div class="store_phone">
							<img src="img/phone.png" alt="전화번호 이미지"> 010-0000-0000
						</div>
					</div>
				</div>
				<div class="table_row">
					<div class="search_imgOutline">
						<img src="img/store3.jpg" alt="상점 이미지" class="search_img">
					</div>
					<div class="search_info">
						<div class="store_name">우마이 식당</div>
						<div class="store_hashtag">
							<img src="img/hashtag.png" alt="해시태그 이미지"> 일식, 소유라멘
						</div>
						<div class="store_open">
							<img src="img/clock.png" alt="시간 이미지"> 10:00 - 8:00
						</div>
						<div class="store_phone">
							<img src="img/phone.png" alt="전화번호 이미지"> 010-0000-0000
						</div>
					</div>
				</div>
			</div>
			<div class="more_link">
				<a href="#">전체 상점목록 ▶</a>
			</div>
		</div>
	</section>

	<section id="search_notice" class="tab-content">
		<div class="search_list">
			<div class="table_wrap">
				<div class="table_row">
					<div class="notice_imgOutline">
						<img src="img/notice_img2.jpg" alt="공지사항 이미지" class="notice_img">
					</div>
					<div class="notice_info">
						<div class="notice_title">서일대 캠퍼스타운</div>
						<div class="notice_writer">
							<img src="img/writer.png" alt="조회수 이미지"> 서일대 캠퍼스타운 관리자
						</div>
						<div class="notice_date">
							<img src="img/clock.png" alt="조회수 이미지"> 2019-05-31
						</div>
						<div class="notice_count">
							<img src="img/count.png" alt="조회수 이미지"> 조회:1
						</div>
					</div>
				</div>

				<div class="table_row">
					<div class="notice_imgOutline">
						<img src="img/notice_img3.jpg" alt="공지사항 이미지" class="notice_img">
					</div>
					<div class="notice_info">
						<div class="notice_title">서일대 캠퍼스타운</div>
						<div class="notice_writer">
							<img src="img/writer.png" alt="조회수 이미지"> 서일대 캠퍼스타운 관리자
						</div>
						<div class="notice_date">
							<img src="img/clock.png" alt="조회수 이미지"> 2019-05-31
						</div>
						<div class="notice_count">
							<img src="img/count.png" alt="조회수 이미지"> 조회:1
						</div>
					</div>
				</div>

				<div class="table_row">
					<div class="notice_imgOutline">
						<img src="img/notice_img.jpg" alt="공지사항 이미지" class="notice_img">
					</div>
					<div class="notice_info">
						<div class="notice_title">서일대 캠퍼스타운</div>
						<div class="notice_writer">
							<img src="img/writer.png" alt="조회수 이미지"> 서일대 캠퍼스타운 관리자
						</div>
						<div class="notice_date">
							<img src="img/clock.png" alt="조회수 이미지"> 2019-05-31
						</div>
						<div class="notice_count">
							<img src="img/count.png" alt="조회수 이미지"> 조회:1
						</div>
					</div>
				</div>
			</div>
			<div class="more_link">
				<a href="#">전체 공지사항 ▶</a>
			</div>
		</div>
	</section>
</div>