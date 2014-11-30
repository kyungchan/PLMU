<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<div id="nav">
	<input class="hide" type="text" value="${ current }">
	<ul>
		<li>
			<div id="nav-home" class="nav-ele">
				<a href="plmu?pg=index">홈</a>
			</div>
			
		</li>
		<li>
			<div id="nav-play"  class="nav-ele">
				<a href="plmu?pg=play">악기연주</a>
			</div>
		</li>
		<li>
			<div id="nav-board"  class="nav-ele">
				<a href="#">게시판</a>
			</div>
		</li>
	</ul>
</div>

<script>
$(function(){
	var current = $("#cur-nav").val();
	
	if (current == "index") {
	  $("#nav-home").addClass("nav-active");
	}
	else if (current == "play") {
	  $("#nav-play").addClass("nav-active");
	}
	else if (current == "board") {
	  $("#nav-board").addClass("nav-active");
	}
	else {
		$("#nav-home").addClass("nav-active");
	}
});
</script>