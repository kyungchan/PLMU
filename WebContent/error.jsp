<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLMU :: 알림</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="js/bootstrap.min.js"></script>
</head>
<body>		
	<jsp:include page="share/header.jsp"></jsp:include>
	<jsp:include page="share/nav.jsp"></jsp:include>
	<div id="container" class="center">	
	<c:if test="${ok == 'ok'}">
	<%
		String id=request.getAttribute("id").toString();
  		response.sendRedirect("plmu?pg=show&id=" + id);
	%> 
	</c:if>
	<c:if test="${auth == 'ok'}">
	<%
		String id=request.getAttribute("id").toString();
		String action=request.getAttribute("action").toString();
		String password=request.getAttribute("password").toString();
		if(action.equals("update")){
			session.setAttribute("password", password);
	  		response.sendRedirect("plmu?pg=update&id=" + id);
		} else if (action.equals("delete")){
	  		response.sendRedirect("plmu?pg=delete&id=" + id + "&password=" + password);
		}
	%> 
	</c:if>
	<div class="alert alert-danger" role="alert">
	  <span class="sr-only">Error:</span>
	  ${errormsg}<br>
	</div>
	<a href="plmu" class="btn btn-default">홈으로</a>
	</div>
	<jsp:include page="share/footer.jsp"></jsp:include>
</body>
</html>