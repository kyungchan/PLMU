<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLMU :: 암호</title>
<link rel="icon" type="image/png"  href="img/icon.png"/>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="share/header.jsp"></jsp:include>
	<jsp:include page="share/nav.jsp"></jsp:include>
	<div id="container" class="center">
		<div class="panel panel-default">
			<div class="panel-body">
				<h5>비밀번호(최대 16글자)</h5>
				<form action="plmu" method="POST">
					<input type="hidden" name="_method" value="auth" />
					<input type="hidden" name="id" value="${ id }" />
					<input type="hidden" name="action" value="${ action }" />
					<input type="password" name="password" maxlength='16'></input><br>
					<button type="submit" class="btn btn-default">확인</button>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="share/footer.jsp"></jsp:include>
</body>
</html>