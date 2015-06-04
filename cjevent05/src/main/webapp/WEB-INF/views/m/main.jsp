<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=400px, initial-scale=2">
<script src="<c:url value="http://code.jquery.com/jquery-latest.min.js" />"></script>
<script src="<c:url value="/resources/js/Copy of event.js" />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/m_style.css" />">
<title>Mobile Main</title>
</head>
<body>

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
	</div>
		
		
		<div class="sunsoo-mobile-wrapper">
			<div class="sunsoo-mobile-contents">
				<div class="sunsoo-mobile-event-intro">
					<a class="sunsoo-mobile-event-btn1-scroll">
						<img src="<c:url value="/resources/images/btnGoWebEvent1.png" />">
					</a>
					<a class="sunsoo-mobile-event-btn2-scroll">
						<img src="<c:url value="/resources/images/btnGoWebEvent2.png" />">
					</a>
				</div>
				
				<div class="sunsoo-mobile-event1" id="event1">
 					<a class="sunsoo-mobile-event-btn1-check" >
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
				    
				    	<div>
				    		<a id="btn-step-left"><input type="button" value="이전단계" onclick=""></a>
				    		<a id="btn-step-right"><input type="button" value="다음단계" onclick=""></a>
				    	</div>
				</div>
			
				<div class="sunsoo-mobile-event2" id="event2">
					<a href="#" class="sunsoo-mobile-event-btn2-check-area" >
					<img src="<c:url value="/resources/images/btnWebEventArea.png" />">
					</a>
					<input type="text" maxlength="10" placeholder="응모번호를 입력하세요"  class="sunsoo-mobile-event-code">
					<a href="#" id="checkRecipe" class="sunsoo-mobile-event-btn2-check" >
						<img src="<c:url value="/resources/images/btnWebEvent2.png" />">
					</a>
				</div>
				<div class="sunsoo-mobile-event-share">
					<div class="ss-share-fb">
						<!--<img src="<c:url value="/resources/images/facebook.png" />">-->
					</div>
					<div class="ss-share-tw">
						<!--<img src="<c:url value="/resources/images/twitter.png" />"> -->
					</div>
					<div class="ss-share-ks">
						<!--<img src="<c:url value="/resources/images/kakaostory.png" />"> -->
					</div>
				</div>
			</div>
		</div>

</body>
</html>