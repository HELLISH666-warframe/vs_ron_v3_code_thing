//
import Xml;
import funkin.backend.utils.WindowUtils;
import funkin.backend.MusicBeatState;
import openfl.Lib;
import haxe.format.JsonPrinter;
import funkin.backend.utils.DiscordUtil;
import haxe.format.JsonParser;
import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextFormat;
import flixel.text.FlxTextFormatMarkerPair;

var pizza:Character;
var black:FlxSprite;

var finishedLoading:Bool = false;
var pressedEnter:Bool = false;

var skipLoadingAllowed:Bool = FlxG.save.data.dev;

var loading2:FlxSprite;
var arrow:FlxSprite;

function create() {
	   FlxG.sound.music.volume = 0;



	var colorbg:FlxSprite = new FlxSprite().makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK);
	colorbg.updateHitbox();
	colorbg.screenCenter();
	add(colorbg);

	

	var bg:FlxSprite = new FlxSprite(900,640).loadGraphic(Paths.image('menus/menuBGBlue'));
	bg.antialiasing = true;
	bg.screenCenter();
	add(bg);

	var fr:FlxSprite = new FlxSprite(900,640).loadGraphic(Paths.image('loading/FRFRFR'));
	fr.screenCenter();
	fr.scale.set(0.7,0.7);
	fr.antialiasing = true;
	add(fr);


	var loading:FlxSprite = new FlxSprite(900,640).loadGraphic(Paths.image('loading/loadiiing'));
	loading.scale.set(0.75,0.75);
	loading.antialiasing = true;
	add(loading);

	var text:FlxText = new FunkinText(0, 80, 0, PlayState.SONG.meta.name.toLowerCase(), 50, true);
	text.setFormat("fonts/fot_newrodin_pro_ub__ultra_bold__by_hammerbro101_dewr2mf.otf", 54, FlxColor.WHITE, "left", FlxColor.WHITE);
	text.screenCenter(FlxAxes.X);
	add(text);


	arrow = new FlxSprite(-100,635).loadGraphic(Paths.image('loading/arrow loading 06'));
	arrow.scale.set(0.75,0.75);
	arrow.antialiasing = true;
	add(arrow);

		


}

function update(elapsed:Float) {
	if (FlxG.keys.justPressed.ESCAPE && skipLoadingAllowed)
		FlxG.switchState(PlayState.isStoryMode ? new StoryMenuState() : new FreeplayState());
		arrow.x = arrow.x + 5;
	if (FlxG.keys.justPressed.ENTER && !pressedEnter && (skipLoadingAllowed == true ? true : finishedLoading)) {goToSong(); pressedEnter = true;}
}

function loadAssets() { // GET BAMBOOZLED LLLLL YOU THOUGHT IT WAS ACUTTALY LOADING
	var timeToLoadalldat = 0;

	for (sprite in 0...FlxG.random.int(8, 14)) {
		timeToLoadalldat += FlxG.random.float(0.1, 0.225);
	}

	new FlxTimer().start(timeToLoadalldat, (tmr:FlxTimer) -> {
		pizza.playAnim('enter');
		pizza.animation.finishCallback = (name:String) -> {if (name == 'enter') {pizza.playAnim('enterloop'); finishedLoading = true;}};
	});
}

function goToSong() {
	FlxG.switchState(new PlayState());
}

function beatHit() {
	if (curBeat % 3 == 0){
			arrow.x = -105;

			new FlxTimer().start(0.75, function(tmr){

				loading2 = new FlxSprite(900,640).loadGraphic(Paths.image('loading/loadiiing'));
				loading2.scale.set(0.75,0.75);
				loading2.antialiasing = true;
				add(loading2);

				
				FlxTween.tween(loading2.scale, {x: 0.8, y:0.8}, 0.6, {ease: FlxEase.cubeOut});
				FlxTween.tween(loading2, {alpha: 0}, 0.6);
				trace(loading2.alpha);
			new FlxTimer().start(0.9, function(tmr){
					loading2.scale.set(0.75,0.75);
					loading2.alpha = 1;
					remove(loading2);
			});
		});
	}

}



	