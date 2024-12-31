import flixel.text.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxTextBorderStyle;

var kadeEngineWatermark:FlxText;
function postCreate() {
	kadeEngineWatermark = new FlxText(5, 10, 0, '$songName - ${CoolUtil.difficulties[storyDifficulty]} | $swordEngine Engine (KE 1.2)', 16);
	kadeEngineWatermark.cameras = [camHUD];
	kadeEngineWatermark.setFormat(Paths.font("comic.ttf"), 16, FlxColor.WHITE,  "center", FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
	kadeEngineWatermark.scrollFactor.set();
	{
		kadeEngineWatermark.text = 'bloodshed-classic - hard | KE 1.5.4 (ron eidtion)';
		kadeEngineWatermark.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
	}
	add(kadeEngineWatermark);
}
