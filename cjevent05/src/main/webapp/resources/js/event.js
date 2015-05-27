/**
 * created by Sun-Soo Jeon
 */
$(function () {
	$('#phone').keypress(function (event) {
		var p = $('#phone').val();
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
	$('#phone').keyup(function (event) {
		var p = $('#phone').val();
		if(p.length == 1) {
			$('#phone').val("0");
		}
		else if(p.length == 2) {
			$('#phone').val("01");
		}
		else if(p.length == 3) {
			if(!(event.keyCode == 48 || event.keyCode == 96 || event.keyCode == 49
					|| event.keyCode == 97 || (event.keyCode >= 54 && event.keyCode <= 57)
					|| event.keyCode == 8 || (event.keyCode >= 102 && event.keyCode <= 105))) {
				$('#phone').val("01");
			}
		}
		else {
			 var regExpCheck = /^[0-9]*$/;
			 if(!regExpCheck.test(p)) {
				 $('#phone').val(p.replace(/[^0-9]/g,''));
			 }
		}
	});
});
$(function () {
	$('#checkRecipe').click(function (event) {
		var p = $('#phone').val();
		var regExpCheck = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
		if(!regExpCheck.test(p)) {
			alert("올바른 휴대폰 번호를 입력하세요!");
		}		
	});
});