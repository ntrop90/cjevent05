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
		old=0;
		num=0;
		function visual(){
		 num++;
		 if(num==4){   /* 이미지의 총 개수 */
		  num = 0;
		 }
		 $(".visual li").eq(old).stop(true,true).fadeOut(1000);
		 $(".visual li").eq(num).stop(true,true).fadeIn(1000);
		  
		 
		 old=num; 
		 
		}
		//auto = setInterval("visual()", 3000);

		$(document).ready(function(){
		 $("#main_visual .visual_in").hover(function(){
		  clearInterval(auto);
		 }, function(){
		  //auto = setInterval("visual()", 3000);
		 });
		 /*좌우버튼 클릭시*/
		 $(".bt_right").click(function(){
		  num=old+1;
		  snum=$(".visual li").length; /*이미지 li의 개수선언 */
		  if(num<snum){ /*num : 이미지전체개수보다 적으면 수행*/
		   $(".visual li").eq(old).stop(true,true).fadeOut(300);
		   $(".visual li").eq(num).fadeIn(300);
		  
		   old=num;
		  }
		 });

		 $(".bt_left").click(function(){
		  num=old-1;
		 
		  if(num>=0){
		   $(".visual li").eq(old).stop(true,true).fadeOut(300);
		   $(".visual li").eq(num).fadeIn(300);
		  
		   old=num;
		  }
		 });
		});
		
		
	     function ViewLayer(){
	        document.getElementById("Pop").style.display='inline';
	     }
		
		
		</script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
<title>Web Main</title>
</head>
<body>
	<div id="loading_page">로딩중</div>
	<div id="content_page" style="display:none">
	<script type="text/javascript">
    document.getElementById('loading_page').style.display="none";
    document.getElementById('content_page').style.display="";
</script>

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
				  <div id="main_visual">
						   <div class="visual_in">
							    <div class="visual">
							     <li class="list0"><a href="#"><img src="/cjevent/resources/images/step1_default.png" alt=""></a></li>
							     <li class="list1"><a href="#"><img src="/cjevent/resources/images/step1_mom.png" alt=""></a></li>
							     <li class="list2"><a href="#"><img src="/cjevent/resources/images/step1_dad.png" alt=""></a></li>
							     <li class="list3"><a href="#"><img src="/cjevent/resources/images/step1_child.png" alt=""></a></li>
							    </div>
						    <div> <!--좌우버튼-->
							     <a class="bt_left" href="#none"><img src="/cjevent/resources/images/event_arrow_left.png" alt="이전보기"></a>
							     <a class="bt_right" href="#none"><img src="/cjevent/resources/images/event_arrow_right.png" alt="다음보기"></a>
						    </div>
						   </div>
				 </div>
				 
				
			</div>
			
				<!--<input type="text" name="remote_phone" id="remote_phone" maxlength="13" placeholder="'-'와 함께 숫자만 입력해 주세요" class="event_phone">-->
				<a href="javascript:ViewLayer();" class="sunsoo-web-event-btn1-check" >
					<img src="<c:url value="/resources/images/btnWebEvent1.png"/>">
					<div id="Pop">
   						<img src="/cjevent/resources/images/dad_01_hotdog.png">		
   						<div id="popupclose">
   						
   						</div>
   						<div id="popupcheck">
   						</div>
					</div>
					</a>
		</div>
			
			</form>
			
			
			<div class="sunsoo-web-event2" id="event2">
				<input type="text" maxlength="10" placeholder="응모번호를 입력하세요"  class="sunsoo-web-event-code">
				<a href="#" id="checkRecipe" class="sunsoo-web-event-btn2-check" >
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
	
</body>
</html>