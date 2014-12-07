
var Key_name = "";
var recoding = false;

function play_string(keyname){
	Key_name="drum-"+ keyname;
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
			var sec = 0;
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
					clearInterval(int);
					if (confirm("녹음이 끝났습니다.\n공유하시겠습니까?")) {
						$('form').submit();
					} else {
						$('#recoding').val("");
						$('#recode-time').val(0);
					}
				}
			}, 1);
		}
		return false;
	});
	$('.drumkey').mousedown(function(){
	//	$(this).effect("highlight", {color:"#0101DF"}, 500); 
		play_string($(this).attr("id"));
	});

	
	$(document).keydown(function(event){
	switch(event.which){
	case 65: //a
		play_string('base');
	//	$('#base').effect("highlight", {color:"#0101DF"}, 500); 
		break;
	case 83: //s
		play_string('crash');
	//	$('#crash').effect("highlight", {color:"#0101DF"}, 500); 
		break;
	case 68: //d
		play_string('floor');
	//	$('#floot').effect("highlight", {color:"#0101DF"}, 500); 
		break;
	case 70: //f
		play_string('hihat');
		//$('#hihat').effect("highlight", {color:"#0101DF"}, 500); 
		break;
	case 71: //g
		play_string('l_tom');
	//	$('#l_tom').effect("highlight", {color:"#0101DF"}, 500); 
		break;
	case 72: //h
		play_string('ride');
	//	$('#ride').effect("highlight", {color:"#0101DF"}, 500); 
		break;
	case 74: //j
		play_string('s_tom');
	//	$('#s_tom').effect("highlight", {color:"#0101DF"}, 500); 
		break;
	case 75: //k
		play_string('snare');
	//	$('#snare').effect("highlight", {color:"#0101DF"}, 500); 
		break;
	}
	});
	
	
});