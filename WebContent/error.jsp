<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="js/bootstrap.min.js"></script>
</head>
<body>		
	<jsp:include page="share/header.jsp"></jsp:include>
	<jsp:include page="share/nav.jsp"></jsp:include>
	<div class="centered">
		<div id="container">
		<c:choose>
		<c:when test="${ok == 'ok'}">
		<%
			String id=request.getParameter("errormsg");
   			response.sendRedirect("plmu?pg=show&id=" + id);
		%> 
		</c:when>
		</c:choose>
			${errormsg}<br>
			<a href="plmu" class="btn btn-default">돌아가기</a>
		</div>
		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>