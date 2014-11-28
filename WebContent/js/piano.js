
var Octave = 3;
var Key_name = "";

function play_string(keyname){
	Key_name="piano-" + Octave + keyname;
	audio = document.getElementById(Key_name); 
	audio.pause();
	audio.currentTime = 0;
	audio.play();
}


$(document).ready(function(){
	$(document).keydown(function(event){
	switch(event.which){
	case 83: //s
		play_string('C');
		break;
	case 69: //e
		play_string('Cs');
		break;
	case 68: //d
		play_string('D');
		break;
	case 82: //r
		play_string('Ds');
		break;
	case 70: //f
		play_string('E');
		break;
	case 71: //g
		play_string('F');
		break;
	case 89: //y
		play_string('Fs');
		break;
	case 72: //h
		play_string('G');
		break;
	case 85: //u
		play_string('Gs');
		break;
	case 74: //j
		play_string('A');
		break;
	case 73: //i
		play_string('As');
		break;
	case 75: //k
		play_string('B');
		break;
	}
	});
});