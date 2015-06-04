/**
 * created by Sun-Soo Jeon
 */
$(function () {
	var step1Idx = 0; var step2Idx = 0; var step3Idx = 0;
	var collectAgreeFlag = 0; var bridgeAgreeFlag = 0;
 	$('#btn-step1-left').click(function (event) {
		if(step1Idx == 0) return false;
		else {
			/* step3 는 무조건 닫아야 함 */
			step3Idx = 0; step2Idx = 0;
			$('#sunsoo-step3-div').css('display', 'none');
			$('.sunsoo-step3-li').css('display', 'none');
			/* step1 처리하기 */
			$("#sunsoo-step1-li-" + step1Idx).css('display', 'none'); step1Idx--;
			$("#sunsoo-step1-li-" + step1Idx).css('display', 'block');
			/* step2 는 맨 처음 재료 고르는 창만 열어둔다 */
			if(step1Idx == 0) {
				$('#sunsoo-step2-div').css('display', 'none');
				$('.sunsoo-step2-li').css('display', 'none');			
			}
			else {
				$('.sunsoo-step2-li').css('display', 'none');
				$('#sunsoo-step2-li-0').css('display', 'block');			
			}
			return true;
		}
	});
	$('#btn-step1-right').click(function (event) {
		if(step1Idx == 3) return false;
		else {
			/* step2는 step3와 관계 없이 맨 처음으로 활성화. step3는 무조건 닫아버린다 */
			step2Idx = 0; step3Idx = 0;
			$('#sunsoo-step3-div').css('display', 'none');
			$('.sunsoo-step3-li').css('display', 'none');
			/* step2의 맨 처음만 활성화한다 */
			$('.sunsoo-step2-li').css('display', 'none');
			$('#sunsoo-step2-li-0').css('display', 'block');	
			$('#sunsoo-step2-div').css('display', 'block');
			$("#sunsoo-step1-li-" + step1Idx).css('display', 'none'); step1Idx++;
			$("#sunsoo-step1-li-" + step1Idx).css('display', 'block');
			return true;
		}
	});
	$('#btn-step2-left').click(function (event) {
		if(step2Idx == 0) return false;
		else {
			step3Idx = 0;
			$('#sunsoo-step3-div').css('display', 'none');
			$('.sunsoo-step3-li').css('display', 'none');
			$("#sunsoo-step2-li-" + step2Idx).css('display', 'none'); step2Idx--;
			$("#sunsoo-step2-li-" + step2Idx).css('display', 'block');
			return true;
		}
	});
	$('#btn-step2-right').click(function (event) {
		if(step2Idx == 1) return false;
		else {
			$("#sunsoo-step2-li-" + step2Idx).css('display', 'none'); step2Idx++;
			$("#sunsoo-step2-li-" + step2Idx).css('display', 'block');
			$('.sunsoo-step3-li').css('display', 'none');
			$("#sunsoo-step3-li-" + step1Idx + "-0").css('display', 'block');
			$('#sunsoo-step3-div').css('display', 'block');
			return true;
		}
	});	
	$('#btn-step3-left').click(function (event) {
		if(step3Idx <= 0) {
			step3Idx = 0;
			return false;
		}
		else {
			$("#sunsoo-step3-li-" + step1Idx + "-" + step3Idx).css('display', 'none'); step3Idx--;
			$("#sunsoo-step3-li-" + step1Idx + "-" + step3Idx).css('display', 'block');
			return true;
		}
	});
	$('#btn-step3-right').click(function (event) {
		if(step3Idx >= 7 && step1Idx == 1) {
			step3Idx = 7;
			return false;
		}
		else if(step3Idx >= 3 && step1Idx == 2) {
			step3Idx = 3;
			return false;
		}
		else if(step3Idx >= 6 && step1Idx == 3) {
			step3Idx = 6;
			return false;
		}
		else {
			if(step1Idx == 0) {
				$('#sunsoo-step2-div').css('display', 'block');
			}
			$("#sunsoo-step3-li-" + step1Idx + "-" + step3Idx).css('display', 'none'); step3Idx++;
			$("#sunsoo-step3-li-" + step1Idx + "-" + step3Idx).css('display', 'block');
			return true;
		}
	});
	$('.sunsoo-mobile-event-btn1-scroll').click(function (event) {
		$(document).scrollTop(740);
	});
	$('.sunsoo-mobile-event-btn2-scroll').click(function (event) {
		$(document).scrollTop(2101);
	});
	$('.sunsoo-web-event-btn1-check').click(function (event) {
		$('.ss-layer-popup').css('display', 'block');
		if(step1Idx == 0) {
			$("#ss-layer-popup-game-alert1").css('display', 'block');
			return false;
		}
		if(step2Idx == 0) {
			$("#ss-layer-popup-game-alert2").css('display', 'block');
			return false;
		}
		if(step3Idx == 0) {
			$("#ss-layer-popup-game-alert3").css('display', 'block');
			return false;
		}
		else {
			/* 재료 조합하는 중 */
			var randNum = Math.floor(Math.random() * 4) + 1;
			$("#ss-layer-popup-process" + randNum).css('display', 'block');
			setTimeout(function() {
				$("#ss-layer-popup-process" + randNum).css('display', 'none');
				/* 레시피가 뜨는 팝업 */
				$("#ss-layer-popup-recipe").removeClass().addClass("recipe" + step1Idx + step3Idx);
				$("#ss-layer-popup-recipe").css('display', 'block');
			}, 2000);
		}
		return true;
	});
	
	$('.ss-recipe-confirm').click(function (event) {
		/*
		$('.ss-layer-popup2').css('display', 'block');
		$("#ss-layer-popup2-recipe").css('display', 'block');
		*/
		$('#ss-layer-popup-info').css('display', 'block');
		$('#ss-layer-popup-recipe').css('display', 'none');
		return true;
	});
	$('#ss-layer-popup-game-alert1').click(function (event) {
		$('#ss-layer-popup-game-alert1').css('display', 'none');
		$('.ss-layer-popup').css('display', 'none');
	});
	$('#ss-layer-popup-game-alert2').click(function (event) {
		$('#ss-layer-popup-game-alert2').css('display', 'none');
		$('.ss-layer-popup').css('display', 'none');
	});
	$('#ss-layer-popup-game-alert3').click(function (event) {
		$('#ss-layer-popup-game-alert3').css('display', 'none');
		$('.ss-layer-popup').css('display', 'none');
	});	
	$('#ss-layer-popup-info-alert1').click(function (event) {
		$('#ss-layer-popup-info-alert1').css('display', 'none');
	});
	$('#ss-layer-popup-info-alert2').click(function (event) {
		$('#ss-layer-popup-info-alert2').css('display', 'none');
	});
	$('#ss-layer-popup-info-alert3').click(function (event) {
		$('#ss-layer-popup-info-alert3').css('display', 'none');
	});	
	$('#ss-layer-popup-info-alert4').click(function (event) {
		$('#ss-layer-popup-info-alert4').css('display', 'none');
	});	
	$('.ss-recipe-close').click(function (event) {
		$('#ss-layer-popup-recipe').css('display', 'none');
		$('.ss-layer-popup').css('display', 'none');
	});
	$('.ss-recipe-close2').click(function (event) {
		$('#ss-layer-popup-recipe').css('display', 'none');
		$('.ss-layer-popup').css('display', 'none');
	});
	$('.collect-agree').click(function (event) {
		collectAgreeFlag = 1;
		$('.collect-disagree-img').css('display', 'none');
		$('.collect-agree-img').css('display', 'block');
	});
	$('.collect-disagree').click(function (event) {
		collectAgreeFlag = 0;
		$('.collect-agree-img').css('display', 'none');
		$('.collect-disagree-img').css('display', 'block');
	});
	$('.bridge-agree').click(function (event) {
		bridgeAgreeFlag = 1;
		$('.bridge-disagree-img').css('display', 'none');
		$('.bridge-agree-img').css('display', 'block');
	});
	$('.bridge-disagree').click(function (event) {
		bridgeAgreeFlag = 0;
		$('.bridge-agree-img').css('display', 'none');
		$('.bridge-disagree-img').css('display', 'block');
	});
	$('.ss-info-confirm').click(function (event) {
		if(collectAgreeFlag == 0) {
			$("#ss-layer-popup-info-alert1").css('display', 'block');
			return false;
		}
		if(bridgeAgreeFlag == 0) {
			$("#ss-layer-popup-info-alert2").css('display', 'block');
			return false;
		}
		if($("#remote_phone").val() == "") {
			$("#ss-layer-popup-info-alert3").css('display', 'block');
			return false;
		}
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

