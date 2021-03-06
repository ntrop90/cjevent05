<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<c:url value="http://code.jquery.com/jquery-latest.min.js" />"></script>
<script src="<c:url value="/resources/js/event.js" />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
<title>Web Main</title>
</head>
<body>
	<div class="ss-dummy" id="ss-dummy"></div>
	<div class="ss-layer-popup">
		<!-- 레시피 예외 처리용 alert window -->
		<div id="ss-layer-popup-game-alert1" class="ss-layer-popup-common">
			<p><img src="<c:url value="/resources/images/web_game_alert1.png" />"></p>
		</div>
		<div id="ss-layer-popup-game-alert2" class="ss-layer-popup-common">
			<p><img src="<c:url value="/resources/images/web_game_alert2.png" />"></p>
		</div>
		<div id="ss-layer-popup-game-alert3" class="ss-layer-popup-common">
			<p><img src="<c:url value="/resources/images/web_game_alert3.png" />"></p>
		</div>
		<div id="ss-layer-popup-info-alert1" class="ss-layer-popup-common">
			<p><img src="<c:url value="/resources/images/web_event1_collect_alert.png" />"></p>
		</div>
		<div id="ss-layer-popup-info-alert2" class="ss-layer-popup-common">
			<p><img src="<c:url value="/resources/images/web_event1_bridge_alert.png" />"></p>
		</div>
		<div id="ss-layer-popup-info-alert3" class="ss-layer-popup-common">
			<p><img src="<c:url value="/resources/images/web_event1_phone_empty_alert.png" />"></p>
		</div>
		<div id="ss-layer-popup-info-alert4" class="ss-layer-popup-common">
			<p><img src="<c:url value="/resources/images/web_event1_phone_num_alert.png" />"></p>
		</div>
		<div id="ss-layer-popup-info-alert5" class="ss-layer-popup-common">
			<p><img src="<c:url value="/resources/images/web_event1_name_alert.png" />"></p>
		</div>
		
		<!-- 레시피 조합 중입니다 -->
		<div id="ss-layer-popup-process1" class="ss-layer-popup-common">
			<p><img src="<c:url value="/resources/images/web_process1.gif" />"></p>
		</div>
		<div id="ss-layer-popup-process2" class="ss-layer-popup-common">
			<p><img src="<c:url value="/resources/images/web_process2.gif" />"></p>
		</div>
		<div id="ss-layer-popup-process3" class="ss-layer-popup-common">
			<p><img src="<c:url value="/resources/images/web_process3.gif" />"></p>
		</div>
		<div id="ss-layer-popup-process4" class="ss-layer-popup-common">
			<p><img src="<c:url value="/resources/images/web_process4.gif" />"></p>
		</div>
		<!-- 레시피 확인하기 -->
		<div id="ss-layer-popup-recipe">
			<div class="ss-recipe-close"></div>
			<div class="ss-recipe-confirm"></div>
		</div>
		<div id="ss-layer-popup-info">
			<form id="smsform1">
			<div class="ss-info-close"></div>
			<input type="text" name="remote_name" id="remote_name" class="sunsoo-web-event-name" placeholder="이름을 입력해주세요" maxlength="4"><!-- 수신번호 다수일때는 이름을 쉼표','로 구분 -->
			<input type="text" maxlength="11" placeholder="'-'없이 숫자만 입력해주세요"  class="sunsoo-web-event-phone" id="remote_phone" name="remote_phone">
			<a class="collect-agree"><img class="collect-agree-img" src="<c:url value="/resources/images/btnWebEvent1Radio.png" />"></a>
			<a class="collect-disagree"><img class="collect-disagree-img" src="<c:url value="/resources/images/btnWebEvent1Radio.png" />"></a>
			<a class="bridge-agree"><img class="bridge-agree-img" src="<c:url value="/resources/images/btnWebEvent1Radio.png" />"></a>
			<a class="bridge-disagree"><img class="bridge-disagree-img" src="<c:url value="/resources/images/btnWebEvent1Radio.png" />"></a>
			<a class="ss-info-confirm"><img src="<c:url value="/resources/images/btnWebEvent1Confirm.png" />"></a>
			</form>
		</div>
		<div id="ss-layer-popup-info2">
			<div class="ss-info2-close"></div>
			<input type="text" name="remote_name" id="remote_name" class="sunsoo-web-event-name" placeholder="이름을 입력해주세요" maxlength="4"><!-- 수신번호 다수일때는 이름을 쉼표','로 구분 -->
			<input type="text" maxlength="11" placeholder="'-'없이 숫자만 입력해주세요"  class="sunsoo-web-event-phone" id="remote_phone" name="remote_phone">
			<a class="collect2-agree"><img class="collect2-agree-img" src="<c:url value="/resources/images/btnWebEvent1Radio.png" />"></a>
			<a class="collect2-disagree"><img class="collect2-disagree-img" src="<c:url value="/resources/images/btnWebEvent1Radio.png" />"></a>
			<a class="bridge2-agree"><img class="bridge2-agree-img" src="<c:url value="/resources/images/btnWebEvent1Radio.png" />"></a>
			<a class="bridge2-disagree"><img class="bridge2-disagree-img" src="<c:url value="/resources/images/btnWebEvent1Radio.png" />"></a>
			<a class="ss-info2-confirm"><img src="<c:url value="/resources/images/btnWebEvent1Confirm.png" />"></a>
		</div>
	</div>
	<form name="SMSFORM" method="post" action="http://www.okmunja.co.kr/Remote/RemoteMms.html">
	
	<div class="ss-layer-popup2">
		<div id="ss-layer-popup2-recipe">
			<div class="ss-layer-popup2-confirm">
				<input type="hidden" name="remote_id" value="bridgelab"><!-- OK 문자 아이디 -->
				<input type="hidden" name="remote_pass" value="bridgelab01"><!-- OK 문자 패스워드 -->
				<input type="hidden" name="remote_returnurl" value="localhost:8080/cjevent/resultcheck.jsp">
				<!-- <input type="hidden" name="remote_phone" value="010-5390-2409">--><!-- 수신번호 다수일때는 쉼표','로 구분 -->
				
				<input type="hidden" name="remote_callback" value="01071727257"><!-- 발신번호 숫자만 입력 -->
				<input type="hidden" name="remote_msg" value="성공했습니다.성공했습니다.성공했습니다.성공했습니다.성공했습니다.성공했습니다.성공했습니다.">
				<input type="hidden" name="remote_contents" value="/resources/.png"><!-- 미리 업로드 된 jpg 이미지 파일명 -->
				<input type="text" name="remote_name" id="remote_name" class="sunsoo-web-event-name" placeholder="이름을 입력해주세요"><!-- 수신번호 다수일때는 이름을 쉼표','로 구분 -->
				<input type="text" maxlength="11" placeholder="'-'없이 숫자만 입력해주세요"  class="sunsoo-web-event-phone" id="remote_phone" name="remote_phone">
				<p><img src="<c:url value="/resources/images/input_private.png" />"></p>
				<div class="ss-recipe-close2"></div>
				<div class="ss-recipe-confirm2">
				<button name="submit1" onclick="submitform()">
					<img src="<c:url value="/resources/images/receive_price.png" />">
				</button>
				</div>
				<div class="non-agree">
					<img id="img1" src="/cjevent/resources/images/btn_over.png" onclick="changeImg()" style="cursor:pointer"/>
				</div>
				<div class="agree">
					<img id="img2" src="/cjevent/resources/images/btn.png" onclick="changeImg()" style="cursor:pointer"/>
				</div>
				
				<script type="text/javascript">
					function submitform()
					{
						$.ajax({
							url: "http://www.okmunja.co.kr/Remote/RemoteMms.html",
							type: "POST",
							data: "remote_id=bridgelab&remote_pass=bridgelab01&remote_phone=01053902409&remote_msg=discountcoupon&remote_callback=01071727257",
							success:function(e) {
							}
						});
					}
					function changeImg() {
						var img1 = document.getElementById('img1');

						if(img1.src.indexOf('_over') == -1) {
						img1.src = img1.src.replace('.png', '_over.png');

						} else {
						img1.src = img1.src.replace('_over.png', '.png');

						}
						}
					</script>
				</div>
			</div>
		</div>
	</form>
	
	
	

		<div class="sunsoo-web-wrapper">
			<div class="sunsoo-web-contents">
				<div class="sunsoo-web-event-intro">
					<a class="sunsoo-web-event-btn1-scroll">
						<img src="<c:url value="/resources/images/btnGoWebEvent1.png" />">
					</a>
					<a class="sunsoo-web-event-btn2-scroll">
						<img src="<c:url value="/resources/images/btnGoWebEvent2.png" />">
					</a>
				</div>
				<div class="sunsoo-web-event1" id="event1">
 					<a class="sunsoo-web-event-btn1-check" >
						<img src="<c:url value="/resources/images/btnWebEvent1.png"/>">
					</a>
					<div id="sunsoo-step1-div" class="sunsoo-step">
						<ul id="sunsoo-step1-ul">
					    	<li id="sunsoo-step1-li-0" class="sunsoo-step1-li"><a><img src="<c:url value="/resources/images/step1_default.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step1-li-1" class="sunsoo-step1-li"><a><img src="<c:url value="/resources/images/step1_mom.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step1-li-2" class="sunsoo-step1-li"><a><img src="<c:url value="/resources/images/step1_dad.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step1-li-3" class="sunsoo-step1-li"><a><img src="<c:url value="/resources/images/step1_child.png"/>" alt=""></a></li>
						</ul>
						<div>
					    	<a id="btn-step1-left"><img src="<c:url value="/resources/images/event_arrow_left.png"/>" alt="이전보기"></a>
					     	<a id="btn-step1-right"><img src="<c:url value="/resources/images/event_arrow_right.png"/>" alt="다음보기"></a>
				    	</div>
					</div>
					<div id="sunsoo-step2-div" class="sunsoo-step">
						<ul id="sunsoo-step2-ul">
					    	<li id="sunsoo-step2-li-0" class="sunsoo-step2-li"><a><img src="<c:url value="/resources/images/step2_default.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step2-li-1" class="sunsoo-step2-li"><a><img src="<c:url value="/resources/images/step2_product.png"/>" alt=""></a></li>
						</ul>
						<div>
					    	<a id="btn-step2-left"><img src="<c:url value="/resources/images/event_arrow_left.png"/>" alt="이전보기"></a>
					     	<a id="btn-step2-right"><img src="<c:url value="/resources/images/event_arrow_right.png"/>" alt="다음보기"></a>
				    	</div>
					</div>
					<div id="sunsoo-step3-div" class="sunsoo-step">
						<ul id="sunsoo-step3-ul">
					    	<li id="sunsoo-step3-li-1-0" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_mom0.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-1-1" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_mom1.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-1-2" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_mom2.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-1-3" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_mom3.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-1-4" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_mom4.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-1-5" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_mom5.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-1-6" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_mom6.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-1-7" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_mom7.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-2-0" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_dad0.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-2-1" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_dad1.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-2-2" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_dad2.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-2-3" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_dad3.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-3-0" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_child0.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-3-1" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_child1.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-3-2" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_child2.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-3-3" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_child3.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-3-4" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_child4.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-3-5" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_child5.png"/>" alt=""></a></li>
					    	<li id="sunsoo-step3-li-3-6" class="sunsoo-step3-li"><a><img src="<c:url value="/resources/images/step3_child6.png"/>" alt=""></a></li>
						</ul>
						<div>
					    	<a id="btn-step3-left"><img src="<c:url value="/resources/images/event_arrow_left.png"/>" alt="이전보기"></a>
					     	<a id="btn-step3-right"><img src="<c:url value="/resources/images/event_arrow_right.png"/>" alt="다음보기"></a>
				    	</div>
					</div>
				</div>
				<div class="sunsoo-web-event2" id="event2">
					<input type="text" maxlength="10" placeholder="응모번호를 입력하세요"  class="sunsoo-web-event-code">
					<a id="ss-checkCode" class="sunsoo-web-event-btn2-check" >
						<img src="<c:url value="/resources/images/btnWebEvent2.png" />">
					</a>
				</div>
				<div class="sunsoo-web-event-share">
					<div class="ss-share-fb"></div>
					<div class="ss-share-tw"></div>
					<div class="ss-share-ks"></div>
				</div>
			</div>
		</div>
</body>
</html>
