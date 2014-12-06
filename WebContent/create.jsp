<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:choose><c:when test="${method == 'update'}">PLMU :: 글 수정</c:when><c:otherwise>PLMU :: 글 작성</c:otherwise></c:choose></title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="share/header.jsp"></jsp:include>
	<jsp:include page="share/nav.jsp"></jsp:include>
	<div id="container">
		<form action="plmu" method="POST">
			<input type="hidden" name="_method" value="${ method }" />
			<input type="hidden" name="inst" value="${inst}" />
			<input type="hidden" name="musiccode" value="${musiccode}" />
			<input type="hidden" name="id" value="${article.id}" />
			<input type="hidden" name="password" value="${password}" />
		 	<label for="inputTitle" class="col-sm-2 control-label">제목</label>
			<input type="text" id="inputTitle" class="form-control" name="title" value="${article.title}"></input>
		 	<label for="inputAuthor" class="col-sm-2 control-label">작성자</label>
			<input type="text" id="inputAuthor"class="form-control" name="author" value="${article.author}"></input>
			<c:if test="${ method != 'update' }">
		 	<label for="inputPw" class="col-sm-3 control-label">비밀번호(최대 16글자)</label>
			<input type="password" id="inputPw" class="form-control" name="password" maxlength='16'></input>
			</c:if>
		 	<label for="inputContext" class="col-sm-2 control-label">내용</label>
			<textarea id="inputContext" class="form-control" name="context" rows="10">${article.context}</textarea>
			<button type="submit" class="btn btn-default"><c:choose><c:when test="${method == 'update'}">수정</c:when><c:otherwise>작성</c:otherwise></c:choose></button>
		</form>
	</div>
	<jsp:include page="share/footer.jsp"></jsp:include>
</body>
</html>