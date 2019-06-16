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
					url : '/admin/reservationDelete.do',
					type : 'get',
					data : {
						'rn_num' : $(this).children().eq(0).html()
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
			<h3 class="page-title">Reservation List</h3>
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
										<th>rn_num</th>
										<th>ID</th>
										<th>상점명</th>
										<th>예약자명</th>
										<th>예약수</th>
										<th>예약일</th>
										<th>예약등록일</th>
										<th>추가사항</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${reservationList}">
										<tr style="cursor: pointer;">
											<td><c:out value="${item.rn_num}" /></td>
											<td><c:out value="${item.u_id}" /></td>
											<td><c:out value="${item.s_name}" /></td>
											<td><c:out value="${item.rn_name}" /></td>
											<td><c:out value="${item.rn_count}" /></td>
											<td><fmt:formatDate value="${item.rn_date}"
													pattern="yyyy-MM-dd HH:mm" /></td>
											<td><fmt:formatDate value="${item.rn_regdate}"
													pattern="yyyy-MM-dd HH:mm" /></td>
											<td><c:out value="${item.rn_content}" /></td>
										</tr>
									</c:forEach>
									<c:if test="${empty reservationList}">
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