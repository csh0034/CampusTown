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
					url  : '/admin/userDelete.do',
					type : 'get',
					data : {
						'u_id' : $(this).children().eq(0).html()
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
										<th>ID</th>
										<th>이름</th>
										<th>핸드폰번호</th>
										<th>이메일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${userList}">
										<tr style="cursor: pointer;">
											<td><c:out value="${item.u_id}" /></td>
											<td><c:out value="${item.u_name}" /></td>
											<td><c:out value="${item.u_phone}" /></td>
											<td><c:out value="${item.u_email}" /></td>
										</tr>
									</c:forEach>
									<c:if test="${empty userList}">
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