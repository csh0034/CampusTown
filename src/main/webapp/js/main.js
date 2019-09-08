$(document).ready(function() {
	//메인 네비
	$('.total').click(function(e) {
		e.preventDefault();
		$(this).toggleClass('on');
		if($(this).hasClass('on')) {
            $('.menu-nav').show();
            $('.bg_black').show();
        } else {
            $('.menu-nav').hide();
            $('.bg_black').hide();
        }
	});


	$('.bg_black').click(function() {
		$('.total').toggleClass('on');
		$('.menu-nav').hide();
        $('.bg_black').hide();
	});


	$(".main>a").click(function(e){
		e.preventDefault();
		var sub = $(this).next(".sub");

		if(sub.is(":visible")) {
			sub.slideUp();
			$(".main>a").removeClass("on");
		} else {
			sub.slideDown();
			$(this).addClass("on");
		}
	});


	//통합 검색
	$('.search_btn').click(function(e) {
		e.preventDefault();
        $('#search_box').show();
        $('.bg_black2').show();
	});


	$('.bg_black2').click(function(e) {
		e.preventDefault();
		$('#search_box').hide();
        $('.bg_black2').hide();
	});


	//메인 슬라이드
	$('.fade').slick({
		autoplay: true,
		dots: true,
		infinite: true,
		speed: 500,
		fade: true,
		cssEase: 'linear',
		arrows: false
	});


	//오늘의 식당
	$('.today').slick({
		infinite: true,
  		slidesToShow: 2,
  		slidesToScroll: 2,
  		dots: false,
  		centerMode: true,
  		focusOnSelect: true,
		arrows:true,
	});

	$('.img_inner').slick({
		dots: true,
		infinite: true,
		cssEase: 'linear',
		arrows: false,
	});
	

	//검색 탭
	$('ul.tabs li').click(function(e){
		e.preventDefault();
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	});

	$('').click(function() {
		if($("").css("display") == "none"){
			('').show();
		}else{
			('').hide();
		}
	});

	 $('#all').css({'left':'0px'});

	   $('.s_item a').click(function(){
	      var tab_id = $(this).attr('data-tab');

	      $('.item_content').css({'left':'-9999px'});
	      $("#"+tab_id).css({'left':'0px'});
	   });

	   $('.s_img').hover(function(){
	      $(this).find('.s_detail').show();
	     }, function(){
	      $(this).find('.s_detail').hide();
	  });

});