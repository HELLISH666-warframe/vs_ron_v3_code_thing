import flixel.text.FlxText;
import flixel.text.FlxTextAlign;
import flixel.effects.particles.FlxTypedEmitter;
import flixel.effects.particles.FlxParticle;
import funkin.savedata.FunkinSave;
import funkin.backend.system.Logs;

var choice:Int = 0;
var things:Array<Dynamic> = [];
var particles:FlxTypedEmitter;


function postCreate() {
	FlxG.mouse.visible = false;
	bg.visible = canSelect = false;
	disableAutoPlay = false;

	choice = FlxG.save.data.freeplayOptionIndex;

	camText = new FlxCamera(30, 0, 980, 820);
	camText.bgColor = 0;
	FlxG.cameras.add(camText, false);

	var sideThingie = new FlxSprite(100, 0).loadGraphic(Paths.image("menus/freeplay/dd"));
	sideThingie.alpha = 0;
	add(sideThingie);
	FlxTween.tween(sideThingie, {x: 0, alpha: 1}, 1, {ease: FlxEase.expoOut});

	var sideThingie = new FlxSprite(100, 0).loadGraphic(Paths.image("menus/freeplay/my movie copy"));
	sideThingie.alpha = 0;
	add(sideThingie);
	FlxTween.tween(sideThingie, {x: 0, alpha: 1}, 1.3, {ease: FlxEase.expoOut});

	annotation = new FlxSprite().loadGraphic(Paths.image("menus/freeplay/annotation"));
	annotation.scale.set(0.6, 0.6);
	annotation.setPosition(15, FlxG.height - annotation.height - 700);
	annotationTxt = new FlxText(0, 0, 0, "SCORE:1e69420!!!!!");
	annotationTxt.setFormat(Paths.font('vcr.ttf'), 30);
	annotationTxt.setPosition(annotation.x + 5, annotation.y + 2);

	for (i in [annotation, annotationTxt]) {
		add(i);
		i.visible = true;
	}

	var prevPos:Float = -50;
	for (i in 0...songs.length) {
		var songCheck = songs[i].name;


		var yeah = new FlxText(0, prevPos, FlxG.width / 1.3, songs[i].displayName, 73);
		yeah.setFormat(Paths.font('segoeUI.ttf'), 90, 0xFFFFFFFF);
		yeah.alignment = FlxTextAlign.LEFT;
		yeah.camera = camText;
		add(yeah);

		var bg = new FlxSprite();
		bg.loadGraphic(Paths.image("menus/freeplay/bgs/" + songs[i].displayName));
		bg.screenCenter();
		bg.alpha = 0;
		insert(sideThingie, bg);

		things.push({text: yeah, background: bg, song: songs[i].name});
		prevPos = yeah.y + yeah.height;
	}

	for (i in grpSongs.members)
		i.alpha = 0.001;
	for (i in 0...iconArray.length)
		iconArray[i].alpha = 0.1;

	scoreBG.visible = scoreText.visible = diffText.visible = false;
	remove(coopText);

	particles = new FlxTypedEmitter(0, 0, 50);
	particles.width = FlxG.width / 1;
	particles.setPosition(500, 800);
	particles.acceleration.set(0, -100, 0, -300);
	particles.lifespan.set(3);
	particles.alpha.set(0.6, 1, 0, 0);
	particles.start(false, 0.2);
	insert(members.indexOf(annotation), particles);
	for (i in 0...300) {
		var p = new FlxParticle();
		p.loadGraphic(Paths.image("menus/freeplay/particle"));
		particles.add(p);
	}

	var annotime = new FlxTimer().start(1.7, () -> {
		annotation.visible = annotationTxt.visible = true;

		var s = FunkinSave.getSongHighscore(things[choice].song, "normal").score;
		var m = FunkinSave.getSongHighscore(things[choice].song, "normal").misses;
		annotationTxt.text = "Score: " + s + (s < 25000 ? '.....' : '!!!!!') + (s != 0 ? m == 0 ? "\nFC'D!!\n" : "\n" + m + " miss..\n" : "");
	});

	changeSelection(0, true);
}

function onChangeSelection(e) {
	if (things == [] || things[choice] == null)
		return;
	if (things[choice].background != null) {
		FlxTween.completeTweensOf(things[choice].background);
		FlxTween.tween(things[choice].background, {alpha: 0}, 0.1);
	}

	choice = FlxMath.wrap(choice + e.change, 0, things.length - 1);

	if (things[choice].background != null) {
		FlxTween.completeTweensOf(things[choice].background);
		FlxTween.tween(things[choice].background, {alpha: 1}, 0.3);
	}

	var s = FunkinSave.getSongHighscore(things[choice].song, "hard").score;
	var m = FunkinSave.getSongHighscore(things[choice].song, "hard").misses;
	trace("score: " + s + " misses: " + m);
	annotationTxt.text = "Score: " + s + (s < 25000 ? '.....' : '!!!!!') + (s != 0 ? m == 0 ? "\nFC'D!!\n" : "\n" + m + " miss..\n" : "");

	FlxG.save.data.freeplayOptionIndex = choice;
}

function postUpdate() {
	if (controls.UP_P)
		changeSelection(-1);
	if (controls.DOWN_P)
		changeSelection(1);
	if (controls.ACCEPT || controls.BACK)
		skipTransition = whiteTransition = false;

	for (i in 0...things.length)
		things[i].text.alpha = (i == choice ? 1 : 0.3);

	camText.follow(things[choice].text);
	curSelected = choice;
}

function onSelect(e) {
	e.song = things[choice].song;
}
