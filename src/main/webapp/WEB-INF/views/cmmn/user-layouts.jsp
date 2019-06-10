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

</body>
</html>