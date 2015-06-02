<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="step_result" method="post" action="">
		<a class="sunsoo-web-event-btn1-scroll"
				 href="#event1" onclick="$.scrollTo( $('#event1'), 800 ); return false;" class="scroll">
					<img src="<c:url value="/resources/images/btnGoWebEvent1.png" />">
		</a>
	</form>
</body>
</html>