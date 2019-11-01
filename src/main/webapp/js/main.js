$(document).ready(function() {
	// 메인 네비
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


	// 통합 검색
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


	// 메인 슬라이드
	$('.fade').slick({
		autoplay: true,
		dots: true,
		infinite: true,
		speed: 500,
		fade: true,
		cssEase: 'linear',
		arrows: false
	});


	// 오늘의 식당
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
	

	// 검색 탭
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

	   $('.s_img').hover(function(){
	      $(this).find('.s_detail').show();
	     }, function(){
	      $(this).find('.s_detail').hide();
	  });
		// 캠퍼스 타운 소개
		$('.i_goal img').css({opacity:'0.1',transition:'3s all ease'});


		$(window).scroll(function () {
			var scrollT = $(document).scrollTop();
			log(scrollT);
		});


		// intro animation
		function log(str){
			$('#log').text(str);

			if(str>=800){

				// PC
				if($(window).width() >767) {
					$('.ex_circle:eq(0)').css({opacity:'1',transform:'translateX(-15.5rem)',transition:'2s all ease'});// 13
					$('.ex_circle:eq(1)').css({opacity:'1',transform:'',transition:'2s all ease'});
					$('.ex_circle:eq(2)').css({opacity:'1',transform:'translateX(7rem)',transition:'2s all ease'});
				}
				// mobile
				else{
					$('.ex_circle:eq(0)').css({opacity:'1',transform:'',transition:'2s all ease'});
					$('.ex_circle:eq(1)').css({opacity:'1',transform:'translateY(-1rem)',transition:'2s all ease'});
					$('.ex_circle:eq(2)').css({opacity:'1',transform:'translateY(-2rem)',transition:'2s all ease'});
				}
			}

			if(str >= 950) { // 스크롤바가 아래 쪽에 위치할 때
				$('.p_square:eq(0)').stop().animate({opacity:'1'}, 500);
				$('.p_square:eq(1)').stop().animate({opacity:'1'}, 800);
				$('.plan_img').stop().animate({top:'50%', opacity:'1'}, 1100);
				$('.p_square:eq(2)').stop().animate({opacity:'1'}, 1400);
				$('.p_square:eq(3)').stop().animate({opacity:'1'}, 1700);
			} else {
				$('.p_square').stop().animate({top:'30%', opacity:'0'});
				$('.plan_img').stop().animate({top:'80%', opacity:'0'});
			};
		}
		
		// 현재 url 복사
	      $('#share,.share').click(function(){
	         CopyUrlToClipboard();
	         toast();
	      });
	      
	      function CopyUrlToClipboard() {
	         var obShareUrl = document.getElementById("ShareUrl");
	         var num = getParameterByName('num');
	         
	         obShareUrl.value = $(location).attr('protocol') + "//" + $(location).attr('host') +  $(location).attr('pathname') + "?num=" + num;
	         	// window.document.location.href; <-- 모든 파라미터 다 가지고 옴

	         obShareUrl.select();
	         obShareUrl.setSelectionRange(0, 9999);
	         document.execCommand("copy");
	         
	         obShareUrl.blur();
	      }

	      // 파라미터 이름으로 값 구하기
	      function getParameterByName(name) {
	          name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	          var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	              results = regex.exec(location.search);
	          return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	      }

	      // 토스트 띄우기
	      let removeToast;

	      function toast(string) {
	          const toast = document.getElementById("toast");

	          toast.classList.contains("reveal") ?
	              (clearTimeout(removeToast), removeToast = setTimeout(function () {
	                  document.getElementById("toast").classList.remove("reveal")
	              }, 1000)) :
	              removeToast = setTimeout(function () {
	                  document.getElementById("toast").classList.remove("reveal")
	              }, 1000)
	          toast.classList.add("reveal"),
	              toast.innerText = "클립보드에 복사 되었습니다.";
	      }


	      // 상점소개 call
	      var filter = "win16|win32|win64|mac";

	      $('#phone').click(function(e){
	         if(navigator.platform){
	            if(0 > filter.indexOf(navigator.platform.toLowerCase())){ // 모바일
	               toast();
	            } else { // pc
	                   event.preventDefault();

	               $('#clip_target').select();

	               try {
	                  var successful = document.execCommand('copy');
	                  toast();
	               } catch (err) {
	                  alert('이 브라우저는 지원하지 않습니다.')
	               }
	            }
	         }
	      });
	      
	      
	      // 상점리스트 페이지 이동시 스크롤 고정
	      var url = $(location).attr('href')
	      var pathName = $(location).attr('pathname')
	      var hash = $(location).attr('hash')
	      var search = $(location).attr('search')
	      var header_height = $('header').height(); // 헤더 높이
	      var offset='';

	      if (pathName =="/store.do" && search!=''){
	    	  offset = $(".s_container").offset().top - header_height; // 헤더값에 가려짐 -> 헤더 밑으로  위치하게
	          $('html, body').scrollTop(offset);
	       }
	      
});