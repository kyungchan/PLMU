<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLMU</title>
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/core.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="centered">
		<jsp:include page="share/header.jsp"></jsp:include>
		<jsp:include page="share/nav.jsp"></jsp:include>
		<div id="container">
			<div id="main-image">
				<img alt="피아노메인" src="img/main-piano.jpg">
				<h2>당신의 음악을 만들어보세요!</h2>
				<h6> </h6>
				<h4>PLMU는 여러분이 원하는 음악을 간단히 만들 수 있게 해줍니다.</h4>
			</div>
			<div class="main-intro">
				<i class="fa fa-music fa-5x"></i>
				<h2>Composition</h2>
				<h4>간편하게 여러분의 음악을 만들어보세요!</h4>
			</div>
			<div class="main-intro">
				<i class="fa fa-share-alt-square fa-5x"></i>
				<h2>Sharing</h2>
				<h4>여러분이 만든 음악을 여러사람에게 공유해보세요!</h4>			
			</div>
			<div class="main-intro">
				<i class="fa fa-thumbs-up fa-5x"></i>
				<h2>Rating</h2>
				<h4>사람들의 음악을 평가해보세요!</h4>
			</div>
		</div>
		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>