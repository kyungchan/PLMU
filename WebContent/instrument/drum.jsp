<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="drum" class="center">
	<button id="base" class="drumkey" type="button" class="btn btn-default">A<br>Base</button>
	<button id="crash" class="drumkey"  type="button" class="btn btn-default">S<br>Crash</button>
	<button id="floor" class="drumkey"  type="button" class="btn btn-default">D<br>Floor</button>
	<button id="hihat" class="drumkey"  type="button" class="btn btn-default">F<br>Hihat</button>
	<button id="l_tom" class="drumkey"  type="button" class="btn btn-default">G<br>L_tom</button>
	<button id="ride" class="drumkey"  type="button" class="btn btn-default">H<br>ride</button>
	<button id="s_tom" class="drumkey"  type="button" class="btn btn-default">J<br>S_tom</button>
	<button id="snare" class="drumkey"  type="button" class="btn btn-default">K<br>Snare</button>
</div>

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