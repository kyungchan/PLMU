<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLMU :: ${article.title}</title>
<script src="js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/bootstrap.min.js"></script>
<script>
	$(function() {
		$("a[data-action='delete']").click(function() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				location = 'plmu?pg=delete&id=' + $(this).attr('data-id');
			}
			return false;
		});
	});
</script>
</head>
<body>
	<div class="centered">
		<jsp:include page="share/header.jsp"></jsp:include>
		<jsp:include page="share/nav.jsp"></jsp:include>
		<div id="container">
			<span>글제목 : ${article.title}</span>
			<div class="divider"></div>
			<div>작성자 : ${article.author}</div>
			<div class="divider"></div>
			<div>작성일 : ${article.timestamp}</div>
			<div class="divider"></div>
			<div>${article.context}</div>
			<div class="divider"></div>
			<a href="plmu?pg=update&id=${article.id}" class="btn btn-default">글수정</a>
			<a href="#" class="btn btn-default" data-action="delete"
				data-id="${article.id}">글삭제</a>

		</div>
	</div>
</body>

</html>