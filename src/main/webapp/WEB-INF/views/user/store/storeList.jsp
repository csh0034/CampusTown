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
	<section id="store_quick">
		<div class="inner">
			<div class="s_item current">
				<a href="/store.do" data-tab="all"> ALL </a> <span>전체</span>
			</div>
			
			<c:forEach var="category" items="${storeCategoryList}">
				<div class="s_item current">
					<a href="javascript:detail('${category.c_num}')"> 
						<img src="<c:out value="${category.c_img}"/>">
					</a> <span><c:out value="${category.c_category}" /></span>
				</div>
			</c:forEach>
		</div>
	</section>
	<div id="slist_content">
		<section id="all" class="item_content">
			<div>
				<!-- 테스트중 -->
				 <c:forEach var="store" items="${storeList}" varStatus="status">
					<li>
						<a href='/storeDetail.do?num=<c:out value="${store.s_num}"/>'>
							<c:out value="${store.s_name}"/>
						</a>
					</li>
				</c:forEach> 
			</div>
			<h3 class="h_text"><c:out value="${category == '' ? '전체' : category}"/></h3>
			<ul class="store_tab today_str">
				<li><img src="files/store1.jpg" alt="오늘의 식당1"></li>
				<li><img src="files/store2.jpg" alt="오늘의 식당2"></li>
				<li><img src="files/store3.jpg" alt="오늘의 식당3"></li>
				<li><img src="files/store4.jpg" alt="오늘의 식당4"></li>
			</ul>
		</section>
	</div>
</div>
<!--wrap end-->