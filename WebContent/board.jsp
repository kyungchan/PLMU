<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLMU :: 공유게시판</title>
<script src="js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="centered">
	<jsp:include page="share/header.jsp"></jsp:include>
	<jsp:include page="share/nav.jsp"></jsp:include>
		<div id="container">
			<table class="table table-striped">
				<thead>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</thead>
				<tbody>
					<c:forEach var="articles" items="${articles.list }">
						<tr>
							<td width='10%'><c:out value="${articles.id}" /></td>
							<td width='50%'><a href="plmu?pg=show&id=${articles.id}">
									<c:out value="${articles.title}" />
							</a></td>
							<td width='15%'><c:out value="${articles.author}" /></td>
							<td width='25%'><c:out value="${articles.timestamp}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="plmu?pg=play" id="createbtn" class="btn btn-default">음악공유하기</a>
					
			<c:set var="currentPage" value="${articles.page}" />
			<c:set var="url" value="plmu" />
			<c:set var="startPage" value="${articles.startPageNo}" />
			<c:set var="endPage" value="${articles.endPageNo}" />
			<c:set var="numPages" value="${articles.numPages}" />
			<nav class="pagination-center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${1 >= currentPage}">
							<li class="disabled"><a href="#">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${url}?page=${currentPage - 1}">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
			
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:choose>
							<c:when test="${i == currentPage}">
								<li class="active"><a href="${url}?page=${i}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${url}?page=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			
					<c:choose>
						<c:when test="${currentPage >= numPages}">
							<li class="disabled"><a href="#">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${url}?page=${currentPage + 1}">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>