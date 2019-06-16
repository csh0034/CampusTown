<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<tiles:insertAttribute name="header" />
</head>
<body>
	<tiles:insertAttribute name="nav" />
	<tiles:insertAttribute name="content" />
	<tiles:insertAttribute name="footer" />
	<tiles:insertAttribute name="js" />

	<c:if test="${empty sessionScope.user}">

		<div id="myModal" class="modal fade">
			<div class="modal-dialog modal-login">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Login</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<form id="loginForm" method="post">
							<div class="form-group">
								<i class="fa fa-user"></i> <input autocomplete="off" type="text"
									name="u_id" class="form-control" placeholder="Id"
									required="required">
							</div>
							<div class="form-group">
								<i class="fa fa-lock"></i> <input type="password" name="u_pw"
									class="form-control" placeholder="Password" required="required">
							</div>
							<div class="form-group">
								<input type="submit" class="btn btn-primary btn-block btn-lg"
									value="Login">
							</div>
						</form>

					</div>
					<div class="modal-footer">
						<a href="/join.do">Sign up now</a>
					</div>
				</div>
			</div>
		</div>

	</c:if>
	
	<div id="reservationModal" class="modal fade" style="top: 100px;">
			<div class="modal-dialog modal-login" style="width:500px;">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">예약하기</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<form id="rnForm" method="post">
							<div class="form-group">
								<div style="width:20%; display:inline-block; margin:none;">
									인원수
								</div>
								<div style="width:49%; display:inline-block; margin:none;">
									예약날짜
								</div>
								<div style="width:28%; display:inline-block; margin:none;">
									예약시간
								</div>
								<input autocomplete="off" type="text"
									name="rn_count" id="rn_count" class="form-control" placeholder="3"
									required="required" style="width:20%; display:inline; margin:none;">
									
								<input type="text" name="rn_date" id="rn_date"
									class="form-control" placeholder="2019-08-15" 
									required="required" style="width:49%; display:inline; margin:none;">
								<input type="text" name="rn_hour" id="rn_hour" 
									class="form-control" placeholder="15:30"
									required="required" style="width:28%; display:inline; margin:none;">
							</div>
							<div class="form-group">
								<div style="display:inline-block; margin:none;">
									예약자명
								</div>
								<input type="text"
									name="rn_name" id="rn_name" class="form-control" placeholder="김캠타"
									required="required" style="display:inline; margin:none;">
							</div>
							<div class="form-group">
								<textarea name="rn_content" id="rn_content"
									class="form-control" placeholder="요구사항" style="height:150px;"></textarea>						
							</div>
							<div class="form-group" style="display:inline; margin:none;">
								<input type="submit" class="btn btn-primary btn-block btn-lg"
									value="예약">
							</div>
						</form>

					</div>
					<div class="modal-footer">
						<a onclick="alert('')"><span class="fa fa-phone detail-icon"></span>상점으로 전화 연결</a>
					</div>
				</div>
			</div>
		</div>

</body>
</html>