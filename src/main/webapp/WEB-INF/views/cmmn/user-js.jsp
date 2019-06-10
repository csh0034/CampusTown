<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<div class="script">
	<script>
		$(function() {
			$('#loginForm').submit(function(e) {
				e.preventDefault();
				
				$.ajax({
					url  : '/login.do',
					type : 'post',
					data : $(this).serialize(),
					success : function(data) {
						
						if(data === 'true') {
							location.reload();
						} else if(data === 'false') {
							alert('아이디와 비밀번호를 확인해주세요')
						}
					},
					error : function(xhr, stats, error) {
						alert('error');
					}
				});
			});
		});
	</script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/jquery.waypoints.min.js"></script>
	<script src="/js/jquery.magnific-popup.min.js"></script>
	<script src="/js/magnific-popup-options.js"></script>

	<script src="/js/main.js"></script>
</div>