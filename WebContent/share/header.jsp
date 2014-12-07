<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="header">
	<img alt="logo" src="img/logo.png">
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
<div class="fb-share-button" data-href="http://54.148.103.75/plmu" data-layout="button"></div></div>