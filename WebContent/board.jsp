<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLMU :: 공유게시판</title>
<script src="js/jquery-2.1.1.min.js"></script>
<link rel="icon" type="image/png"  href="img/icon.png"/>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="share/header.jsp"></jsp:include>
	<jsp:include page="share/nav.jsp"></jsp:include>
	<div id="container">
		<table class="table table-striped">
			<thead>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>좋아요</th>
				<th>싫어요</th>
				<th>작성일</th>
			</thead>
			<tbody>
				<c:forEach var="articles" items="${articles.list }">
					<c:choose>		
						<c:when test="${articles.likecount - articles.dislike >= 3 && articles.likecount - articles.dislike <6}">
							<c:set var="textcolor" value="#555555"/>
						</c:when>
						<c:when test="${articles.likecount - articles.dislike >= 6}">
							<c:set var="textcolor" value="#000000"/>
						</c:when>
						<c:when test="${articles.likecount - articles.dislike <= -3  && articles.likecount - articles.dislike > -6}">
							<c:set var="textcolor" value="#c7c7c7"/>
						</c:when>
						<c:when test="${articles.likecount - articles.dislike <= -6}">
							<c:set var="textcolor" value="#ededed"/>
						</c:when>
						<c:otherwise>
							<c:set var="textcolor" value="#8c8c8c"/>
						</c:otherwise>
					</c:choose>
					<tr>
						<td width='10%'><c:out value="${articles.id}" /></td>
						<td width='45%'><a href="plmu?pg=show&id=${articles.id}" style="color:<c:out value="${textcolor}" />; font-weight:bold;">
								<c:out value="${articles.title}" />
						</a></td>
						<td width='13%'><c:out value="${articles.author}" /></td>
						<td width='7%'><c:out value="${articles.likecount}" /></td>
						<td width='7%'><c:out value="${articles.dislike}" /></td>
						<td width='*'><c:out value="${articles.timestamp}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="plmu?pg=play" id="createbtn" class="btn btn-default">음악공유하기</a>
				
		<c:set var="currentPage" value="${articles.page}" />
		<c:set var="url" value="plmu?pg=board" />
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
						<li><a href="${url}&page=${currentPage - 1}">&laquo;</a></li>
					</c:otherwise>
				</c:choose>
		
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:choose>
						<c:when test="${i == currentPage}">
							<li class="active"><a href="${url}?page=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${url}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
		
				<c:choose>
					<c:when test="${currentPage >= numPages}">
						<li class="disabled"><a href="#">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${url}&page=${currentPage + 1}">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
	<jsp:include page="share/footer.jsp"></jsp:include>
</body>
</html>