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
	<div class="wrap_cjevent05">
		<div class="contents">
			<div class="event_intro">
				<a href="#" class="event_btn1">
					<img src="<c:url value="/resources/images/goBtn1.png" />">
				</a>
				<a href="#" class="event_btn2">
					<img src="<c:url value="/resources/images/goBtn2.png" />">
				</a>
			</div> <!--  24a4a3 left:257 width:351 top:1383 height:35 -->
			<div class="event1">
				<input id="phone" type="text" maxlength="11" placeholder="'-'없이 숫자만 입력해 주세요"  class="event_phone">
				<a href="#" id="checkRecipe" class="event_btn3">
					<img src="<c:url value="/resources/images/goBtn3.png" />">
				</a>
			</div>
			<div class="event2">
				<input type="text" maxlength="10" placeholder="응모번호를 입력하세요"  class="event_code">
			</div>
			<div class="event_get">
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
</body>
</html>