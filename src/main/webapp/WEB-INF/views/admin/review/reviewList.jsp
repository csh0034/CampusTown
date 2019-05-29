<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(function() {
		$('#example1').DataTable({
			"order" : [ [ 0, "desc" ] ]
		});

		$('.table tbody tr').click(function() {
			if (confirm('삭제하시겠습니까?')) {
				$.ajax({
					url  : '/admin/reviewDelete.do',
					type : 'get',
					data : {
						'num' : $(this).children().eq(0).html()
					},
					success : function(data) {
						location.reload();
					},
					error : function(xhr, stats, error) {
						alert('error');
					}
				});
			}
		});
	});
</script>
<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<h3 class="page-title">Review List</h3>
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
										<th>rw_num</th>
										<th>작성자ID</th>
										<th>점포번호</th>
										<th>점포명</th>
										<th>점포소개</th>
										<th>별점</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="review" items="${reviewList}">
										<tr style="cursor: pointer;">
											<td><c:out value="${review.rw_num}" /></td>
											<td><c:out value="${review.u_id}" /></td>
											<td><c:out value="${review.s_num}" /></td>
											<td><c:out value="${review.s_name}" /></td>
											<td><c:out value="${review.rw_content}" /></td>
											<td><c:out value="${review.rw_score}" /></td>
											<td><fmt:formatDate value="${review.rw_regdate}"
													pattern="yyyy-MM-dd HH:mm" /></td>
										</tr>
									</c:forEach>
									<c:if test="${empty reviewList}">
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