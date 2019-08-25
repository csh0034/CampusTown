<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(function() {
		$('#example1').DataTable({
			"order" : [ [ 0, "desc" ] ]
		});

		$('.table tbody tr').click(
				function() {
					location.href = '/admin/noticeModify.do?num='
							+ $(this).children().eq(0).html();
				});
	});
</script>
<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<h3 class="page-title">Notice List</h3>
			<div class="row">
				<div class="col-md-12">
					<!-- TABLE HOVER -->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title"></h3>
						</div>
						<div class="panel-body">
							<table id="example1" class="table table-striped table-bordered"
								style="width: 100%">
								<thead>
									<tr>
										<th>n_num</th>
										<th>type</th>
										<th>url</th>
										<th>제목</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${noticeList}">
										<tr style="cursor: pointer;">
											<td><c:out value="${item.n_num}" /></td>
											<td>
												<c:choose>
													<c:when test="${item.n_type eq 0}">
														공지사항
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${item.n_type eq 1}">
														사업단 공지사항
													</c:when>
												</c:choose>
											</td>
											<td><c:out value="${item.n_url}" /></td>
											<td><c:out value="${item.n_title}" /></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${item.n_regdate}" /></td>
											<td><c:out value="${item.n_hit}" /></td>
										</tr>
									</c:forEach>
									<c:if test="${empty noticeList}">
										<tr class="text-center">
											<td colspan="8">No Data</td>
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