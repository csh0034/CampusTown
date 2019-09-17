<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="bg_black"></div>
<div class="bg_black2"></div>
<header>
	<a href="#" class="total"> <span></span>
	</a> <a href="/" class="logo"> CAMPUS TOWN </a> <a href="#"
		class="search_btn"> <img src="/img/search.png" alt="통합검색">
	</a>
</header>
<div id="search_box">
	<form action="/search.do" method="get" >
		<input type="search" id="searchInput" class="notice_search" placeholder="검색어를 입력하세요." required>
		<input type="submit" class="btn_search" value="">
	</form>
</div>

<script>
$(function() {
	$("#search_box form").submit(function(e) {
		e.preventDefault();
		
		var tmp = '${searchPageMaker.makeQuery(1)}';
		
		if (tmp !== '') {
			self.location = "/search.do" + tmp
			+ "&searchType=t"
		    + "&keyword="
			+ encodeURIComponent($('#searchInput').val());
		} else {
			self.location = "/search.do?searchType=t&keyword=" + encodeURIComponent($('#searchInput').val());
		}
	});
});
</script>