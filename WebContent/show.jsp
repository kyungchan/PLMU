<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="js/playing.js"></script>
<script>
	$(function() {
		$("a[data-action='delete']").click(function() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				location = 'plmu?pg=password&id=' + $(this).attr('data-id') + "&action=delete";
			}
			return false;
		});
	});
</script>
</head>
<body> 
	<div id="fb-root"></div>
	<script>
  	window.fbAsyncInit = function() {
		  FB.init({
			  appId      : '650698035050699',
			  cookie     : true,  
			  xfbml      : true,  
			  version    : 'v2.1' 
			});
  	};

	(function(d, s, id) {
  			var js, fjs = d.getElementsByTagName(s)[0];
  			if (d.getElementById(id)) return;
  			js = d.createElement(s); js.id = id;
  			js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&appId=650698035050699&version=v2.0";
  			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	
	<c:if test="${redirect == 'ok'}"> 
	<%
  			response.sendRedirect("plmu?pg=show&id=" + request.getParameter("id"));
	%> 
	</c:if>
	<jsp:include page="share/header.jsp"></jsp:include>
	<jsp:include page="share/nav.jsp"></jsp:include>
	<input id="musiccode" type="hidden" value="${ music.musiccode }" >	
	<div id="container">
		<span>글제목 : ${article.title}</span>
		<div class="divider"></div>
		<div>작성자 : ${article.author}</div>
		<div class="divider"></div>
		<div>작성일 : ${article.timestamp}</div>
		<div class="divider"></div>
		<div>좋아요 : ${article.likecount} 싫어요 : ${article.dislike}</div>
		<div class="divider"></div>
		<div>${article.context}</div>
		<div class="center">
			<a id="play_btn" href="#" class="btn btn-default">▶</a>
			<input id="playtime" type="text" value="0" readonly>	
		</div>
		<div class="divider"></div>
		<div class="right">
			<a href="plmu?pg=show&id=${article.id}&like=1" class="btn btn-default">좋아요</a>
			<a href="plmu?pg=show&id=${article.id}&like=0" class="btn btn-default">싫어요</a>
			<a href="plmu?pg=password&id=${article.id}&action=update" class="btn btn-default">글수정</a>
			<a href="#" class="btn btn-default" data-action="delete" data-id="${article.id}">글삭제</a>
			<div class="fb-share-button" data-href="http://54.148.103.75/plmu/plmu?pg=show&id=${article.id}" data-layout="button"></div></div>
		</div>
	</div>
	<jsp:include page="share/footer.jsp"></jsp:include>
	
<div class="hide">
<c:if test="${ music.instrument == 'piano' }">
	<audio id="piano-3C" preload="auto" controls>
		<source src="audio/piano/3C.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-3Cs" preload="auto" controls>
		<source src="audio/piano/3Cs.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-3D" preload="auto" controls>
		<source src="audio/piano/3D.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-3Ds" preload="auto" controls>
		<source src="audio/piano/3Ds.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-3E" preload="auto" controls>
		<source src="audio/piano/3E.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-3F" preload="auto" controls>
		<source src="audio/piano/3F.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-3Fs" preload="auto" controls>
		<source src="audio/piano/3Fs.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-3G" preload="auto" controls>
		<source src="audio/piano/3G.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-3Gs" preload="auto" controls>
		<source src="audio/piano/3Gs.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-3A" preload="auto" controls>
		<source src="audio/piano/3A.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-3As" preload="auto" controls>
		<source src="audio/piano/3As.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-3B" preload="auto" controls>
		<source src="audio/piano/3B.mp3" type="audio/mpeg"></source>
	</audio>
	
	<audio id="piano-4C" preload="auto" controls>
		<source src="audio/piano/4C.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-4Cs" preload="auto" controls>
		<source src="audio/piano/4Cs.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-4D" preload="auto" controls>
		<source src="audio/piano/4D.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-4Ds" preload="auto" controls>
		<source src="audio/piano/4Ds.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-4E" preload="auto" controls>
		<source src="audio/piano/4E.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-4F" preload="auto" controls>
		<source src="audio/piano/4F.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-4Fs" preload="auto" controls>
		<source src="audio/piano/4Fs.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-4G" preload="auto" controls>
		<source src="audio/piano/4G.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-4Gs" preload="auto" controls>
		<source src="audio/piano/4Gs.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-4A" preload="auto" controls>
		<source src="audio/piano/4A.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-4As" preload="auto" controls>
		<source src="audio/piano/4As.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-4B" preload="auto" controls>
		<source src="audio/piano/4B.mp3" type="audio/mpeg"></source>
	</audio>
	
	
	<audio id="piano-5C" preload="auto" controls>
		<source src="audio/piano/5C.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-5Cs" preload="auto" controls>
		<source src="audio/piano/5Cs.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-5D" preload="auto" controls>
		<source src="audio/piano/5D.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-5Ds" preload="auto" controls>
		<source src="audio/piano/5Ds.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-5E" preload="auto" controls>
		<source src="audio/piano/5E.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-5F" preload="auto" controls>
		<source src="audio/piano/5F.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-5Fs" preload="auto" controls>
		<source src="audio/piano/5Fs.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-5G" preload="auto" controls>
		<source src="audio/piano/5G.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-5Gs" preload="auto" controls>
		<source src="audio/piano/5Gs.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-5A" preload="auto" controls>
		<source src="audio/piano/5A.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-5As" preload="auto" controls>
		<source src="audio/piano/5As.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="piano-5B" preload="auto" controls>
		<source src="audio/piano/5B.mp3" type="audio/mpeg"></source>
	</audio>
</c:if>
<c:if test="${ music.instrument == 'drum' }">
<div class="hide">
	<audio id="drum-base" preload="auto" controls>
		<source src="audio/drum/base.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="drum-crash" preload="auto" controls>
		<source src="audio/drum/crash.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="drum-floor" preload="auto" controls>
		<source src="audio/drum/floor.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="drum-hihat" preload="auto" controls>
		<source src="audio/drum/hihat.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="drum-l_tom" preload="auto" controls>
		<source src="audio/drum/L_tom.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="drum-ride" preload="auto" controls>
		<source src="audio/drum/ride.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="drum-s_tom" preload="auto" controls>
		<source src="audio/drum/S_tom.mp3" type="audio/mpeg"></source>
	</audio>
	<audio id="drum-snare" preload="auto" controls>
		<source src="audio/drum/snare.mp3" type="audio/mpeg"></source>
	</audio>
</div>
</c:if>
</div>	
</body>
</html>