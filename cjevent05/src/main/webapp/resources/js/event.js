/**
 * created by Sun-Soo Jeon
 */
$(function () {
	$('#sunsoo-web-scroll1').click(function (event) {
		$(document).scrollTop(734);
	});
});

$(function () {
	$('#sunsoo-web-scroll2').click(function (event) {
		$(document).scrollTop(2010);
	});
});

$(function () {
	$('#remote_phone').keypress(function (event) {
		var p = $('#remote_phone').val();
		if(p.length == 0) {
			if(event.keyCode == 48 || event.keyCode == 96)
				return true;
			else return false;
		}
		else if(p.length == 1) {
			if(event.keyCode == 49 || event.keyCode == 97)
				return true;
			else return false;			
		}
		else if(p.length == 2) {
			if(event.keyCode == 48 || event.keyCode == 96 || event.keyCode == 49
				|| event.keyCode == 97 || (event.keyCode >= 54 && event.keyCode <= 57)
				|| (event.keyCode >= 102 && event.keyCode <= 105)) {
				return true;
			}
			else return false;
		}
		else {
			if((event.keyCode >= 48 && event.keyCode <= 57) 
				|| (event.keyCode >= 96 && event.keyCode <= 105)) {
				return true;
			}
			else return false;
		}
	});
});
$(function () {
	$('#remote_phone').keyup(function (event) {
		var p = $('#remote_phone').val();
		if(p.length == 1) {
			$('#remote_phone').val("0");
		}
		else if(p.length == 2) {
			$('#remote_phone').val("01");
		}
		else if(p.length == 3) {
			if(!(event.keyCode == 48 || event.keyCode == 96 || event.keyCode == 49
					|| event.keyCode == 97 || (event.keyCode >= 54 && event.keyCode <= 57)
					|| event.keyCode == 8 || (event.keyCode >= 102 && event.keyCode <= 105)
					|| event.keyCode == 109 || event.keyCode == 189 )) {
				$('#remote_phone').val("01");
			}
		}
		else {
			 var regExpCheck = /^[0-9]*$/;
			 if(!regExpCheck.test(p)) {
				 $('#remote_phone').val(p.replace(/[^0-9]/g,''));
			 }
		}
	});
});
$(function () {
	$('#checkRecipe').click(function (event) {
		var p = $('#remote_phone').val();
		var regExpCheck =/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})|(010-?[1-9]-?[0-9]{7})$/;
		if(!regExpCheck.test(p)) {
			alert("올바른 휴대폰 번호를 입력하세요!");
		}		
	});
});

