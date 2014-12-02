function play_string(keyname){
	audio = document.getElementById(keyname); 
	audio.pause();
	audio.currentTime = 0;
	audio.play();
}

$(function(){
	
});