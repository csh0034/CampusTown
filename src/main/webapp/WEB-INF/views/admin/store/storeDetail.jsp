<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<h3 class="page-title">Store Add</h3>
			<div class="row">
				<form action="/admin/storeAdd.do" method="post"
					enctype="multipart/form-data">
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title"></h3>
							</div>
							<div class="panel-body">
								<select class="form-control" name="c_num">
									<c:forEach var="storeCategory" items="${storeCategoryList}">
										<option value='<c:out value="${storeCategory.c_num}"/>'><c:out
												value="${storeCategory.c_category}" /></option>
									</c:forEach>
								</select> <br> <input type="text" name="s_name" class="form-control"
									placeholder="점포명"> <br> <input type="text"
									name="s_tel" class="form-control"
									placeholder="전화번호 ex) 02-2233-4455"> <br> <input
									type="text" name="s_address" class="form-control"
									placeholder="주소"> <br> <input type="text"
									name="s_hours" class="form-control"
									placeholder="영업시간 ex) 09:00 ~ 17:00"> <br> <input
									type="text" name="s_snsurl" class="form-control"
									placeholder="SNS Url"> <br> <input type="text"
									name="s_hashtag" class="form-control"
									placeholder="해시태그  ex) #맛집,#떡볶이"> <br>
								<textarea name="s_content" class="form-control"
									placeholder="상점소개" rows="4"></textarea>
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
								<c:forEach begin="1" end="10" varStatus="status">
									<div class="form-group">
										<input id="fileInput${status.count}" class="fileInput"
											name="uploadfile" type="file"
											data-class-button="btn btn-default"
											data-class-input="form-control" data-button-text=""
											data-icon-name="fa fa-upload" class="form-control"
											tabindex="${status.count}"
											style="position: absolute; clip: rect(0px, 0px, 0px, 0px);">
										<div class="bootstrap-filestyle input-group">
											<input type="text" id="userfile${status.count}"
												class="form-control" name="userfile"> <span
												class="group-span-filestyle input-group-btn" tabindex="0">
												<label for="fileInput${status.count}"
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
									<button class="btn btn-primary">점포추가</button>
									<button type="reset" class="btn btn-danger">다시작성</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>