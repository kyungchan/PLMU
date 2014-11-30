
var Octave = 3;
var Key_name = "";
var recoding = false;

function play_string(keyname){
	Key_name="piano-" + Octave + keyname;
	if(recoding == true){
		$('#recoding').val($('#recoding').val() + Key_name + "," + $('#recode-time').val() + "|");
	}
	audio = document.getElementById(Key_name); 
	audio.pause();
	audio.currentTime = 0;
	audio.play();
}


$(document).ready(function(){		
	$("a[data-action='recode']").click(function() {
		if (confirm("확인을 누르면 녹음이 시작됩니다.\n녹음은 7초동안 진행됩니다.")) {
			var sec = 0, ms = 0;
			recoding = true;
			$("a[data-action='recode']").attr('disabled', true);
			var startTime = new Date().getTime();
			int = setInterval(function() {
				var time = new Date().getTime();
				var dif = time - startTime;
				sec = Math.floor(dif / 10) / 100

				if (sec < 7) {
					$('#recode-time').val(sec);
				} else {
					$("a[data-action='recode']").attr('disabled', false);
					recoding = false;
					clearInterval(recodeTimer);
				}
			}, 1);
		}
		return false;
	});
	$('.whitekey').mousedown(function(){
		$(this).addClass('press_whitekey');
		play_string($(this).attr("id"));
	});

	$('.whitekey').mouseup(function(){
		$(this).removeClass('press_whitekey');
	});

	$('.blackkey').mousedown(function(){
		$(this).addClass('press_blackkey');
		play_string($(this).attr("id"));
	});

	$('.blackkey').mouseup(function(){
		$(this).removeClass('press_blackkey');
	});
	
	$(document).keydown(function(event){
	switch(event.which){
	case 83: //s
		play_string('C');
		$('#C').addClass('press_whitekey');
		break;
	case 69: //e
		play_string('Cs');
		$('#Cs').addClass('press_blackkey');
		break;
	case 68: //d
		play_string('D');
		$('#D').addClass('press_whitekey');
		break;
	case 82: //r
		play_string('Ds');
		$('#Ds').addClass('press_blackkey');
		break;
	case 70: //f
		play_string('E');
		$('#E').addClass('press_whitekey');
		break;
	case 71: //g
		play_string('F');
		$('#F').addClass('press_whitekey');
		break;
	case 89: //y
		play_string('Fs');
		$('#Fs').addClass('press_blackkey');
		break;
	case 72: //h
		play_string('G');
		$('#G').addClass('press_whitekey');
		break;
	case 85: //u
		play_string('Gs');
		$('#Gs').addClass('press_blackkey');
		break;
	case 74: //j
		play_string('A');
		$('#A').addClass('press_whitekey');
		break;
	case 73: //i
		play_string('As');
		$('#As').addClass('press_blackkey');
		break;
	case 75: //k
		play_string('B');
		$('#B').addClass('press_whitekey');
		break;
	case 37: //left
		if(Octave > 3){
			Octave--;
			$('#piano-octave').text(Octave);
		}
		break;
	case 39: //right
		if(Octave < 5){
			Octave++;
			$('#piano-octave').text(Octave);
		}
		break;
	}
	});
	
	$(document).keyup(function(event){
		switch(event.which){
		case 83: //s
			$('#C').removeClass('press_whitekey');
			break;
		case 69: //e
			$('#Cs').removeClass('press_blackkey');
			break;
		case 68: //d
			$('#D').removeClass('press_whitekey');
			break;
		case 82: //r
			$('#Ds').removeClass('press_blackkey');
			break;
		case 70: //f
			$('#E').removeClass('press_whitekey');
			break;
		case 71: //g
			$('#F').removeClass('press_whitekey');
			break;
		case 89: //y
			$('#Fs').removeClass('press_blackkey');
			break;
		case 72: //h
			$('#G').removeClass('press_whitekey');
			break;
		case 85: //u
			$('#Gs').removeClass('press_blackkey');
			break;
		case 74: //j
			$('#A').removeClass('press_whitekey');
			break;
		case 73: //i
			$('#As').removeClass('press_blackkey');
			break;
		case 75: //k
			$('#B').removeClass('press_whitekey');
			break;
		}
		});
	
	
});