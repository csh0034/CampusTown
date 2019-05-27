<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$('.table tbody tr').click(function() {
			location.href = '/admin/storeModify.do?num=' +
							 $(this).children().eq(0).html();
		});
	});
</script>
<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<h3 class="page-title">Store List</h3>
			<div class="row">
				<div class="col-md-12">
					<!-- TABLE HOVER -->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title"></h3>
						</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>num</th>
										<th>점포명</th>
										<th>카테고리</th>
										<th>전화번호</th>
										<th>주소</th>
										<th>영업시간</th>
										<th>SnsURL</th>
										<th>해시태그</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="store" items="${storeList}">
										<tr style="cursor: pointer;">
											<td><c:out value="${store.s_num}" /></td>
											<td><c:out value="${store.s_name}" /></td>
											<td><c:out value="${store.c_category}" /></td>
											<td><c:out value="${store.s_tel}" /></td>
											<td><c:out value="${store.s_address}" /></td>
											<td><c:out value="${store.s_hours}" /></td>
											<td><c:out value="${store.s_snsurl}" /></td>
											<td><c:out value="${store.s_hashtag}" /></td>
										</tr>
									</c:forEach>
									<c:if test="${empty storeList}">
										<tr class="text-center">
											<td colspan="8">
												No Data
											</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END TABLE HOVER -->
				</div>
			</div>
		</div>
	</div>
</div>