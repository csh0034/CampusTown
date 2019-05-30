<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$('.btn-danger').click(function() {
			if (confirm('삭제하시겠습니까?')) {
				location.href = '/admin/storeDelete.do?num=' + '${param.num}';
			}
		});

		$('.del').click(function() {

			if (confirm('삭제하시겠습니까?')) {
				$.ajax({
					url : '/admin/storeFileDelete.do',
					type : 'get',
					data : {
						'si_num' : $(this).data('num'),
						'si_rename' : $(this).data('rename')
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
			<h3 class="page-title">Store Modify</h3>
			<div class="row">
				<form action="/admin/storeModify.do" method="post"
					enctype="multipart/form-data">
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title"></h3>
							</div>
							<div class="panel-body">
								<input type="hidden"
									value="<c:out value='${storeInfo.s_num}' />" name="s_num">
								<select class="form-control" name="c_num">
									<c:forEach var="storeCategory" items="${storeCategoryList}">
										<c:choose>
											<c:when test="${storeCategory.c_num eq storeInfo.c_num}">
												<option value='<c:out value="${storeCategory.c_num}"/>'
													selected="selected"><c:out
														value="${storeCategory.c_category}" /></option>
											</c:when>
											<c:otherwise>
												<option value='<c:out value="${storeCategory.c_num}"/>'><c:out
														value="${storeCategory.c_category}" /></option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select> <br> <input type="text" name="s_name" class="form-control"
									placeholder="점포명" value="<c:out value='${storeInfo.s_name}'/>">
								<br> <input type="text" name="s_tel" class="form-control"
									placeholder="전화번호 ex) 02-2233-4455"
									value="<c:out value='${storeInfo.s_tel}'/>"> <br>
								<input type="text" name="s_address" class="form-control"
									placeholder="주소"
									value="<c:out value='${storeInfo.s_address}'/>"> <br>
								<input type="text" name="s_hours" class="form-control"
									placeholder="영업시간 ex) 09:00 ~ 17:00"
									value="<c:out value='${storeInfo.s_hours}'/>"> <br>
								<input type="text" name="s_snsurl" class="form-control"
									placeholder="SNS Url"
									value="<c:out value='${storeInfo.s_snsurl}'/>"> <br>
								<input type="text" name="s_hashtag" class="form-control"
									placeholder="해시태그  ex) #맛집,#떡볶이"
									value="<c:out value='${storeInfo.s_hashtag}'/>"> <br>
								<textarea name="s_content" class="form-control"
									placeholder="상점소개" rows="4"><c:out
										value='${storeInfo.s_content}' /></textarea>
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
								<c:forEach var="storeFile" items="${storeFileList}"
									varStatus="status">
									<div class="form-group">
										<div class="bootstrap-filestyle input-group">
											<input type="text" readonly name="si_rename"
												style="background-color: #fcfcfc;" class="form-control"
												value='<c:out value="${storeFile.si_name}"/>'> <span
												class="group-span-filestyle input-group-btn" tabindex="0">
												<button data-num="<c:out value="${storeFile.si_num}"/>"
													data-rename="<c:out value="${storeFile.si_rename}"/>"
													type="button" class="btn btn-default del">
													<span class="glyphicon fa fa-trash"></span>
												</button>
											</span>
										</div>
									</div>
								</c:forEach>
								<c:forEach begin="${storeFileList.size() + 1}" end="10"
									varStatus="status">
									<div class="form-group">
										<input id="fileInput${status.current}" class="fileInput"
											name="uploadfile" type="file"
											data-class-button="btn btn-default"
											data-class-input="form-control" data-button-text=""
											data-icon-name="fa fa-upload" class="form-control"
											tabindex="${status.current}"
											style="position: absolute; clip: rect(0px, 0px, 0px, 0px);">
										<div class="bootstrap-filestyle input-group">
											<input type="text" id="userfile${status.current}"
												class="form-control" name="userfile" readonly
												style="background-color: #fcfcfc;"> <span
												class="group-span-filestyle input-group-btn" tabindex="0">
												<label for="fileInput${status.current}"
												class="btn btn-default "> <span
													class="glyphicon fa fa-upload"></span>
											</label>
											</span>
										</div>
									</div>
								</c:forEach>
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