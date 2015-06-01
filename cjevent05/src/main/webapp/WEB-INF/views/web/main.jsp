<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<c:url value="http://code.jquery.com/jquery-latest.min.js" />"></script>
<script type='text/javascript' src='http://demos.flesler.com/jquery/scrollTo/js/jquery.scrollTo-min.js'></script>
<script src="<c:url value="/resources/js/event.js" />"></script>
	<script type="text/javascript" src="/cjevent/resources/images/jquery.alsEN-1.0.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() 
			{
				$("#lista1").als({
					visible_items: 1,
					scrolling_items: 1,
					orientation: "horizontal",
					circular: "yes",
					autoscroll: "no",
					interval: 5000,
					direction: "right"
				});
				
				$("#lista2").als({
					visible_items: 2,
					scrolling_items: 1,
					orientation: "vertical",
					circular: "no",
					autoscroll: "no"
				});
				
				//logo hover
				$("#logo_img").hover(function()
				{
					$(this).attr("src","resources/als_logo_hover212x110.png");
				},function()
				{
					$(this).attr("src","resources/als_logo212x110.png");
				});
				
				//logo click
				$("#logo_img").click(function()
				{
					location.href = "http://als.musings.it/index.php";
				});
				
				$("a[href^='http://']").attr("target","_blank");
				$("a[href^='http://als']").attr("target","_self");
			});
		</script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
<title>Web Main</title>
</head>
<body>

	<form name="SMSFORM" method="post" action="http://www.okmunja.co.kr/Remote/RemoteMms.html">
	
		<input type="hidden" name="remote_id" value="bridgelab"><!-- OK 문자 아이디 -->
		<input type="hidden" name="remote_pass" value="bridgelab01"><!-- OK 문자 패스워드 -->
		<input type="hidden" name="remote_returnurl" value="localhost:8080/cjevent/web/resultcheck">
		<!-- <input type="hidden" name="remote_phone" value="010-5390-2409">--><!-- 수신번호 다수일때는 쉼표','로 구분 -->
		<!-- <input type="hidden" name="remote_name" value="우제영"> --><!-- 수신번호 다수일때는 이름을 쉼표','로 구분 -->
		<input type="hidden" name="remote_callback" value="01071727257"><!-- 발신번호 숫자만 입력 -->
		<input type="hidden" name="remote_msg" value="성공했습니다.">
		<input type="hidden" name="remote_contents" value="/resources/.png""><!-- 미리 업로드 된 jpg 이미지 파일명 -->

	<div class="sunsoo-web-wrapper">
		<div class="sunsoo-web-contents">
			<div class="sunsoo-web-event-intro">
				<a  class="sunsoo-web-event-btn1-scroll"
				 href="#event1" onclick="$.scrollTo( $('#event1'), 800 ); return false;" class="scroll">
					<img src="<c:url value="/resources/images/btnGoWebEvent1.png" />">
				</a>
				<a  class="sunsoo-web-event-btn2-scroll"
				href="#event2" onclick="$.scrollTo( $('#event2'), 800 ); return false;" class="scroll">
					<img src="<c:url value="/resources/images/btnGoWebEvent2.png" />">
				</a>
			</div>
			
			<div class="sunsoo-web-event1" id="event1">
				<div id="lista1" class="als-container">
				<span class="als-prev"><img src="/cjevent/resources/images/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
				<div class="als-viewport">
					<ul class="als-wrapper">
						<li class="als-item"><img src="/cjevent/resources/images/als-images/calculator.png" alt="calculator" title="calculator" />calculator</li>
						<li class="als-item"><img src="/cjevent/resources/images/als-images/light_bulb.png" alt="light bulb" title="light bulb" />light bulb</li>
						<li class="als-item"><img src="/cjevent/resources/images/als-images/card.png" alt="card" title="card" />card</li>
						<li class="als-item"><img src="/cjevent/resources/images/als-images/chess.png" alt="chess" title="chess" />chess</li>
						<li class="als-item"><img src="/cjevent/resources/images/als-images/clock.png" alt="alarm clock" title="alarm clock" />alarm clock</li>
						<li class="als-item"><img src="/cjevent/resources/images/als-images/cut.png" alt="scissors" title="scissors" /></li>
						<li class="als-item"><img src="/cjevent/resources/images/als-images/heart.png" alt="heart" title="heart" /></li>
						<li class="als-item"><img src="/cjevent/resources/images/als-images/map.png" alt="pin" title="pin" /></li>
						<li class="als-item"><img src="/cjevent/resources/images/als-images/mobile_phone.png" alt="mobile phone" title="mobile phone" /></li>
					</ul>
				</div>
				<span class="als-next"><img src="/cjevent/resources/images/thin_right_arrow_333.png" alt="next" title="next" /></span>
			</div>
				<!--<input type="text" name="remote_phone" id="remote_phone" maxlength="13" placeholder="'-'와 함께 숫자만 입력해 주세요" class="event_phone">-->
				<a href="#" id="checkRecipe" class="sunsoo-web-event-btn1-check">
					<img src="<c:url value="/resources/images/btnWebEvent1.png" />">
				</a>
			</div>
			<div class="sunsoo-web-event2" id="event2">
				<input type="text" maxlength="10" placeholder="응모번호를 입력하세요"  class="sunsoo-web-event-code">
				<a href="#" id="checkRecipe" class="sunsoo-web-event-btn2-check">
					<img src="<c:url value="/resources/images/btnWebEvent2.png" />">
				</a>
			</div>
			<div class="sunsoo-web-event-share">
			</div>
			<!-- 
			<div class="event_div_frames">
				<img src="<c:url value="/resources/images/intro.png" />">
				<a href="#" class="event_btn1">
					<img src="<c:url value="/resources/images/goBtn1.png" />">
				</a>
				<a href="#" class="event_btn2">
					<img src="<c:url value="/resources/images/goBtn2.png" />">
				</a>
			</div>
			<div class="event_div_frames">
				<img src="<c:url value="/resources/images/event1.png" />">
			</div>
			<div class="event_div_frames">
				<img src="<c:url value="/resources/images/event2.png" />">
			</div>
			<div class="event_div_frames">
				<img src="<c:url value="/resources/images/get.png" />">
			</div> x: 395px;  y: 418px; 492px; -->
		</div>
	</div>
	</form>
</body>
</html>