$(document).ready(function() {
	$(".fileInput").on('change', function() {
		var targetIndex = $(this).attr("tabindex");
		if (window.FileReader) {
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$("#userfile"+targetIndex).val(filename);
	});

});