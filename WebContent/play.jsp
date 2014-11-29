<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLMU :: 악기연주</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/core.js"></script>
<script src="js/piano.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="centered">
		<jsp:include page="share/header.jsp"></jsp:include>
		<jsp:include page="share/nav.jsp"></jsp:include>
		<div id="container">
			<div id="instrument">
			<c:choose>
				<c:when test="${inst == 'piano'}">
					<jsp:include page="instrument/piano.jsp"></jsp:include>
				</c:when>
			</c:choose>
			</div>
		</div>
		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>
