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
	<c:set var="message" value="${remote_msg}" />
	<c:choose>
		<c:when test="$(message == 0)">
			<script>
				$(document).ready(function() {
					alert(${message});
				});
			</script>
		</c:when>
		<c:when test="$(message == 1)">
			<script>
				$(document).ready(function() {
					alert(${message});
				});
			</script>
		</c:when>
		<c:when test="$(message == 2)">
			<script>
				$(document).ready(function() {
					alert(${message});
				});
			</script>
		</c:when>
		<c:otherwise>
			<script>
				$(document).ready(function() {
					alert(${message});
				});
			</script>
		</c:otherwise>
	</c:choose>	
</body>
</html>