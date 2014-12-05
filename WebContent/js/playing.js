function play_string(keyname){
	audio = document.getElementById(keyname); 
	audio.pause();
	audio.currentTime = 0;
	audio.play();
}

function divide_code(code){
	var lstcode = code.split('|');
	var leng = lstcode.length;
	var playcode = new Array(leng-1);
	for(var i=0; i < leng; i++){
		temp=lstcode[i].split(',');
		playcode[i] = new Array(2);
		playcode[i][0] = temp[0];
		playcode[i][1] = temp[1];
	}
	return playcode;
}


$(function(){
	var playcode = divide_code($("#musiccode").val());
	$("#musiccode").val(playcode[0][0]  + playcode[0][1]);
	$("#play_btn").click(function () {
		var code = 0;
		var sec = 0;
		var startTime = new Date().getTime();
		$("#play_btn").attr('disabled', true);
		int = setInterval(function() {
			var time = new Date().getTime();
			var dif = time - startTime;
			sec = Math.floor(dif / 10) / 100
			if (sec <= 7) {
				$('#playtime').val(sec);
				if(playcode[code][1] == sec){
					play_string(playcode[code][0]);
					code++;
				}
			} else {
				$("#play_btn").attr('disabled', false);
				clearInterval(int);
			}
		}, 1);
	});
});