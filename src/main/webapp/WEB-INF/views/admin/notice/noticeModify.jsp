<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$('.btn-danger').click(function() {
			if (confirm('삭제하시겠습니까?')) {
				location.href = '/admin/noticeDelete.do?num=' + '${param.num}';
			}
		});

		$('.del').click(function() {

			if (confirm('삭제하시겠습니까?')) {
				$.ajax({
					url : '/admin/noticeFileDelete.do',
					type : 'get',
					data : {
						'n_num' : $(this).data('num'),
						'n_attach' : $(this).data('rename')
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
			<h3 class="page-title">Notice Modify</h3>
			<div class="row">
				<form action="/admin/noticeModify.do" method="post"
					enctype="multipart/form-data">
					<input type="hidden" value="<c:out value='${noticeInfo.n_num}' />"
						name="n_num">
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title"></h3>
							</div>
							<div class="panel-body">
								<input type="text" name="n_title" class="form-control" required
									placeholder="제목" value='<c:out value="${noticeInfo.n_title}" />'>
								<br>
								<textarea name="n_content" class="form-control" required
									style="resize: none" placeholder="공지내용" rows="20"><c:out
								value="${noticeInfo.n_content}"/></textarea>
								<br>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title"></h3>
							</div>
							<div class="panel-body fileWrap">
								<select class="form-control" name="n_type">
									<c:choose>
										<c:when test="${noticeInfo.n_type eq 0}">
											<option value='0' selected>공지사항</option>
											<option value='1'>사업단 공지사항</option>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${noticeInfo.n_type eq 1}">
											<option value='0'>공지사항</option>
											<option value='1' selected>사업단 공지사항</option>
										</c:when>
									</c:choose>
								</select> <br> 
								<input type="text"
									name="n_url" class="form-control"
									placeholder="url" required value="<c:out value="${noticeInfo.n_url}" />"> <br>
								<div class="form-group">
									<c:choose>
										<c:when test="${empty noticeInfo.n_attach}">
											<input id="fileInput1" class="fileInput" name="uploadfile"
												type="file" data-class-button="btn btn-default"
												data-class-input="form-control" data-button-text=""
												data-icon-name="fa fa-upload" class="form-control"
												tabindex="1"
												style="position: absolute; clip: rect(0px, 0px, 0px, 0px);">
											<div class="bootstrap-filestyle input-group">
												<input type="text" id="userfile1" class="form-control"
													name="userfile" readonly style="background-color: #fcfcfc;">
												<span class="group-span-filestyle input-group-btn"
													tabindex="0"> <label for="fileInput1"
													class="btn btn-default "> <span
														class="glyphicon fa fa-upload"></span>
												</label>
												</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="bootstrap-filestyle input-group">
												<input type="text" readonly name="si_rename"
													style="background-color: #fcfcfc;" class="form-control"
													value='<c:out value="${noticeInfo.n_attach}"/>'> <span
													class="group-span-filestyle input-group-btn" tabindex="0">
													<button data-num="<c:out value="${noticeInfo.n_num}"/>"
														data-rename="<c:out value="${noticeInfo.n_attach}"/>"
														type="button" class="btn btn-default del">
														<span class="glyphicon fa fa-trash"></span>
													</button>
												</span>
											</div>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="panel">
							<div class="panel-body">
								<div class="form-group text-center" style="margin-bottom: 0">
									<button class="btn btn-primary">정보수정</button>
									<button type="button" class="btn btn-danger">삭제하기</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>