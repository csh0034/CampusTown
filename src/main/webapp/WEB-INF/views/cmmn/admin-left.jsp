<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script>
	$(function() {
		var $subPages = $('#subPages');
		var $subPages2 = $('#subPages2');

		switch (location.pathname) {
		case '/admin/main.do':
		case '/admin/storeList.do':
		case '/admin/storeModify.do':
			$subPages.prev().addClass('active');
			$subPages.addClass('in');
			$('#subPages li a').eq(0).addClass('active');
			break;
		case '/admin/storeAdd.do':
			$subPages.prev().addClass('active');
			$subPages.addClass('in');
			$('#subPages li a').eq(1).addClass('active');
			break;
		
		case '/admin/noticeList.do':
		case '/admin/noticeModify.do':
			$subPages2.prev().addClass('active');
			$subPages2.addClass('in');
			$('#subPages2 li a').eq(0).addClass('active');
			break;
		case '/admin/noticeAdd.do':
			$subPages2.prev().addClass('active');
			$subPages2.addClass('in');
			$('#subPages2 li a').eq(1).addClass('active');
			break;
		case '/admin/userList.do':
			$('.user').addClass('active');
			break;
		default:
		}
	});
</script>

<div id="sidebar-nav" class="sidebar">
	<div class="sidebar-scroll">
		<nav>
			<ul class="nav">
				<li><a href="/main.do" class=""><i class="lnr lnr-home"></i>
						<span>Home</span></a></li>
				<li><a href="#subPages" data-toggle="collapse"
					class="collapsed"><i class="lnr lnr-cart"></i> <span>Store</span>
						<i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages" class="collapse">
						<ul class="nav">
							<li><a href="/admin/storeList.do" class="">List</a></li>
							<li><a href="/admin/storeAdd.do" class="">Add</a></li>
						</ul>
					</div></li>
				<li><a href="#subPages2" data-toggle="collapse"
					class="collapsed"><i class="lnr lnr-alarm"></i> <span>Notice</span>
						<i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages2" class="collapse">
						<ul class="nav">
							<li><a href="/admin/noticeList.do" class="">List</a></li>
							<li><a href="/admin/noticeAdd.do" class="">Add</a></li>
						</ul>
					</div></li>
				<li><a href="/admin/userList.do" class="user"><i
						class="lnr lnr-user"></i> <span>User</span></a></li>
			</ul>
		</nav>
	</div>
</div>