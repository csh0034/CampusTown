<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<div id="sidebar-nav" class="sidebar">
	<div class="sidebar-scroll">
		<nav>
			<ul class="nav">
				<li><a href="#subPages" data-toggle="collapse" class="active"><i
						class="lnr lnr-cart"></i> <span>Store</span> <i
						class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages" class="collapse in">
						<ul class="nav">
							<li><a href="/admin/storeAdd.do" class="">Add</a></li>
							<li><a href="/admin/store.do" class="">List</a></li>
						</ul>
					</div></li>
				<li><a href="#subPages2" data-toggle="collapse" class="collapsed"><i
						class="lnr lnr-alarm"></i> <span>Notice</span> <i
						class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages2" class="collapse">
						<ul class="nav">
							<li><a href="/admin/noticeAdd.do" class="">Add</a></li>
							<li><a href="/admin/notice.do" class="">List</a></li>
						</ul>
					</div></li>
				<li><a href="/admin/reservation.do" class=""><i
						class="lnr lnr-inbox"></i> <span>Reservation</span></a></li>
				<li><a href="/admin/review.do" class=""><i
						class="lnr lnr-pencil"></i> <span>Review</span></a></li>
				<li><a href="/admin/user.do" class=""><i
						class="lnr lnr-user"></i> <span>User</span></a></li>
			</ul>
		</nav>
	</div>
</div>