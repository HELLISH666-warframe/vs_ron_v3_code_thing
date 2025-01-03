import flixel.text.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxTextBorderStyle;

var deathCounter:FlxText = new FlxText(20, 5, 0, PlayState.SONG.meta.displayName + PlayState.difficulty.toUpperCase() +  "| KE 1.5.4 (ron eidtion)",12);
for(k=>label in [deathCounter,]) {
	label.setFormat(Paths.font("vcr.ttf"), 16,  FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
	label.y = 15 + (2 * k);
	label.x = 15 + (162 * k);
	label.cameras = [camHUD];

	add(label);}