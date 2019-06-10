<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header role="banner">
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="/main.do">CampusTown</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarsExample05" aria-controls="navbarsExample05"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarsExample05">
				<ul class="navbar-nav ml-auto pl-lg-5 pl-0">
					<li class="nav-item"><a class="nav-link active"
						href="/admin/main.do">Admin</a></li>
					<li class="nav-item"><a class="nav-link" href="/store.do">Store</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/notice.do">Notice</a>
					</li>
					<c:if test="${!empty sessionScope.user}">
						<li class="nav-item"><a class="nav-link" href="/mypage.do">MyPage</a>
						</li>
					</c:if>
				</ul>

				<ul class="navbar-nav ml-auto">
					<c:choose>
						<c:when test="${empty sessionScope.user}">
							<li class="nav-item cta-btn"><a class="nav-link trigger-btn"
								data-toggle="modal" href="#myModal">Login</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item cta-btn"><a class="nav-link"
								href="/logout.do"><c:out value="${sessionScope.user.u_id}" />
									Logout</a>
						</c:otherwise>
					</c:choose>

				</ul>

			</div>
		</div>
	</nav>
</header>
<!-- END header -->