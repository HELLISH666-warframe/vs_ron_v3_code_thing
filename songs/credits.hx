/*
| - Reformated by @ItsLJcool - |
*/
import flixel.text.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxTextBorderStyle;

public var showCredits:Bool = true;
// if you want to have this toggled in the `meta.json` file, uncomment this line
// showCredits = (PlayState?.instance?.SONG?.meta?.customValues?.showCredits ?? showCredits);

var curSong:String = PlayState.instance.SONG.meta.name;
var credits:FlxText;
var creditBG:FlxSprite;
function postCreate() {
// init shit bruh
var creditPath = Paths.file("songs/" + curSong + "/credits.txt");
var creditText = "ItsLJcool stole the credits";
if (Assets.exists(creditPath)) creditText = Assets.getText(creditPath);


credits = new FlxText(0, 0, 0, creditText);
credits.setFormat(Paths.font("w95.otf"), 24, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
credits.scrollFactor.set();
credits.screenCenter();




creditBG = new FlxSprite().makeGraphic(600, FlxG.height + 10, FlxColor.BLACK);
creditBG.scrollFactor.set();
creditBG.alpha = 0.0001; // renders but doesn't show. if it's 0, then it doesn't render.
creditBG.screenCenter();
add(creditBG);

add(credits);

creditBG.camera = credits.camera = camHUD;
}

function onSongStart() {
// ??
var targety:Int = 0;
targety = Std.int(credits.y);
credits.y = FlxG.camera.scroll.y+FlxG.height+40;
FlxTween.tween(credits, {y: targety}, 0.5);
if (!showCredits) return;
var coolDestroy = (spr:FlxSprite) -> {
    credits.destroy();
};
FlxTween.tween(creditBG, {alpha: 0.5}, 0.5);


for (die in [credits, creditBG]) FlxTween.tween(die, {alpha: 0}, 0.5, {startDelay: 5, onComplete: coolDestroy});
}