import flixel.text.FlxTextBorderStyle;
var kadeshit:FlxTextkadeshit = new FlxText();
var swordEngine = (["Tristan","Dave","Bambi"])[Math.floor(Math.random() * 3+.1)];
function postCreate() {
	if (StringTools.endsWith(curSong, "classic")){
	kadeshit = new FlxText(20, 5, 0, curSong + " - Hard | KE 1.5.4 (ron eidtion)",12);
	kadeshit.setFormat(Paths.font("vcr.ttf"),16, FlxColor.WHITE,FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
	iconP1.setIcon('oldbf');
	boyfriend.iconColor = 0x01D8FF;
	}
	switch(curSong)
	{
		case "slammed"|"holy-shit-dave-fnf":
		kadeshit = new FlxText(20, 5, 0, curSong + " - Hard | " + swordEngine + " Engine (KE 1.2)",12);
		kadeshit.setFormat(Paths.font("comic.ttf"),16, FlxColor.WHITE,FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
	}
	for(label in [kadeshit]) {
		label.x = 15 + (162 * label);
		label.camera = camHUD;
		add(label);
	}
}