import flixel.text.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxTextBorderStyle;
//how_the_FUCK_do_i_use_contains!?!?!?!
if ((curSong == 'ron-classic') || (curSong == 'wasted-classic') || (curSong == 'ayo-classic') || (curSong == 'bloodshed-classic') || (curSong == 'trojan-virus-classic') || (curSong == 'bleeding-classic')){
var kadeshit:FlxText = new FlxText(20, 5, 0, PlayState.SONG.meta.displayName +  " - Hard " +  "| KE 1.5.4 (ron eidtion)",12);
for(k=>label in [kadeshit]) {
	label.setFormat(Paths.font("vcr.ttf"), 16,  FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);

	label.x = 15 + (162 * k);
	label.cameras = [camHUD];

	add(label);}
}
var swordEngine = (["Tristan","Dave","Bambi"])[Math.floor(Math.random() * 3+.1)];
if ((curSong == 'slammed') || (curSong == 'holy-shit-dave-fnf')){
var kadeshitb:FlxText = new FlxText(20, 5, 0, PlayState.SONG.meta.displayName + " - Hard | " + swordEngine +   " Engine (KE 1.2)",12);
for(k=>label in [kadeshitb]) {
	label.setFormat(Paths.font("comic.ttf"), 16,  FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
	
	label.x = 15 + (162 * k);
	label.cameras = [camHUD];
	
	add(label);}
}