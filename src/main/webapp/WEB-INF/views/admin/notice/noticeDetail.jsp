<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<h3 class="page-title">Notice Add</h3>
			<div class="row">
				<form action="/admin/noticeAdd.do" method="post"
					enctype="multipart/form-data">
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title"></h3>
							</div>
							<div class="panel-body">
								<input type="text" name="n_title" class="form-control" required
									placeholder="제목"> <br>
								<textarea name="n_content" class="form-control"
									style="resize: none" placeholder="공지내용" rows="20"></textarea>
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
									<option value='0'>공지사항</option>
									<option value='1'>사업단 공지사항</option>
									<option value='2'>자유게시판</option>
								</select> <br> 
								<input type="text"
									name="n_url" class="form-control"
									placeholder="url" required> <br>
								<div class="form-group">
									<input id="fileInput1" class="fileInput" name="uploadfile"
										type="file" data-class-button="btn btn-default"
										data-class-input="form-control" data-button-text=""
										data-icon-name="fa fa-upload" class="form-control"
										tabindex="1"
										style="position: absolute; clip: rect(0px, 0px, 0px, 0px);" required>
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
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="panel">
							<div class="panel-body">
								<div class="form-group text-center" style="margin-bottom: 0">
									<button class="btn btn-primary">공지추가</button>
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