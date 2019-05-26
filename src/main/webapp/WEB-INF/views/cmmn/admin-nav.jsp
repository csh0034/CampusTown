<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="brand">
		<a href="index.html"><img src="/assets/img/logo-dark.png"
			alt="Klorofil Logo" class="img-responsive logo"></a>
	</div>
	<div class="container-fluid">
		<div class="navbar-btn">
			<button type="button" class="btn-toggle-fullwidth">
				<i class="lnr lnr-arrow-left-circle"></i>
			</button>
		</div>
		<form class="navbar-form navbar-left">
			<div class="input-group">
				<input type="text" value="" class="form-control"
					placeholder="Search"> <span class="input-group-btn"><button
						type="button" class="btn btn-primary">Go</button></span>
			</div>
		</form>
		<div class="navbar-btn navbar-btn-right">
			<a class="btn btn-success update-pro" href="#" title="Upgrade to Pro"
				target="_blank"><i class="fa fa-rocket"></i> <span>Logout</span></a>
		</div>
		<div id="navbar-menu">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="lnr lnr-question-circle"></i>
						<span>Help</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
					<ul class="dropdown-menu">
						<li><a href="#">Basic Use</a></li>
						<li><a href="#">Working With Data</a></li>
						<li><a href="#">Security</a></li>
						<li><a href="#">Troubleshooting</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>
