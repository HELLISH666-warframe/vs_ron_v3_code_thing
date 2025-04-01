import funkin.backend.MusicBeatState;

gameOverSong = 'silence';
lossSFXName = null;
retrySFX = null;

var mainTxt:FlxText = new FlxText(20, 650, 0, "aqua.flv - retry?");
mainTxt.setFormat(Paths.font('cour.ttf'), 28, FlxColor.WHITE);


function postCreate() {
	character.visible = false;
	camOver = new FlxCamera(0, 0, 960, 720);
	camOver.bgColor = FlxColor.BLACK;
	FlxG.cameras.add(camOver, false);
	mainTxt.cameras = [camOver];
	add(mainTxt);

	helpChance = FlxG.random.int(1, 5);
	if (helpChance == 1) FlxG.openURL('https://support.google.com/');
}

function onEnd(event) {
	event.cancel();
	MusicBeatState.skipTransIn = MusicBeatState.skipTransOut = true;
	FlxG.switchState(new PlayState());	
}