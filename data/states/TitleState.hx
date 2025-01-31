import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.sound.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileCircle;
import openfl.Assets;
var done = false;
var god:CustomShader  = new CustomShader("godray");
var crt:CustomShader  = new CustomShader("fake CRT");
var fish:CustomShader  = new CustomShader("colorizer");
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var time:Float = 0;
var animbarScrt:FlxBackdrop;
var animbarScrb:FlxBackdrop;
var titleTextt:FlxSprite;
function update(elapsed:Float) {
	if (done != (done = true)) {
		CoolUtil.loadAnimatedGraphic(members[0], Paths.image("menus/titlescreen/trueTitleBgAnimated"));
		members[0].scale.set(2,2);
		members[0].updateHitbox();
		    FlxG.camera.addShader(crt);
			FlxG.camera.addShader(fish);
		if (blackScreen.frames != null) {
			CoolUtil.loadAnimatedGraphic(blackScreen, Paths.image("menus/titlescreen/titleThing"));
			blackScreen.scale.set(2.25,2.25);
			blackScreen.updateHitbox();
		}
		remove(titleText);
		import flixel.addons.display.FlxBackdrop;
		animbarScrt = new FlxBackdrop(Paths.image('menus/titlescreen/trueTitleBarTop'), FlxAxes.X, 0, 0);
		animbarScrb = new FlxBackdrop(Paths.image('menus/titlescreen/trueTitleBarBottom'), FlxAxes.X, 0, 0);
		animbarScrb.velocity.x -= 120;
		animbarScrt.velocity.x += 120;
		insert(members.indexOf(titleScreenSprites), animbarScrb);
		animbarScrt.updateHitbox();
		animbarScrb.updateHitbox();
		add(animbarScrt);
		titleTextt = new FlxSprite().loadGraphic(Paths.image('menus/titlescreen/trueTitlePlay'));
		insert(members.indexOf(titleScreenSprites), titleTextt);
		new FlxTimer().start(0.005, function(tmr:FlxTimer)
		{
			animbarScrb.x -= 2;
			animbarScrt.x += 2;
			tmr.reset(0.005);
		});
	}
	{time += elapsed;
		chrom.data.rOffset.value = [0.005*Math.sin(time)];
		chrom.data.bOffset.value = [-0.005*Math.sin(time)];
		titleTextt.angle += Math.sin(-time*8)/16;
	}
	var pressedEnter:Bool = FlxG.keys.justPressed.ENTER;

	if (FlxG.sound.music != null)
		Conductor.songPosition = FlxG.sound.music.time;

	if (pressedEnter) {
		if (!skippedIntro)
			skipIntro();
		else if (transitioning)
			pressEnter();
	}
}
function beatHit(curBeat) {			if(!transitioning){
	FlxTween.completeTweensOf(FlxG.camera);
	FlxG.camera.zoom += 0.03;
	FlxTween.tween(FlxG.camera, {zoom: 1}, Conductor.crochet / 1500, {ease: FlxEase.backOut});}}
function stepHit(curStep){
	{
		switch(curStep){
			case 63:
				FlxG.camera.removeShader(god);
			case 64:
				FlxG.camera.addShader(god);}}}
function create(){if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);
	chrom.data.rOffset.value = [1/2];
	chrom.data.gOffset.value = [0.0];
	chrom.data.bOffset.value = [1 * -1];
	titleText.angle += Math.sin(-time*8)/16;
}}
function pressEnter() {
	FlxTween.tween(titleTextt, {y: titleTextt.y - 500}, 2, {ease: FlxEase.backIn});

	FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
	
	FlxTween.cancelTweensOf(FlxG.camera);
	blackScreen.color = FlxColor.BLACK;
	blackScreen.screenCenter();
	FlxTween.tween(blackScreen, {alpha: 1}, 1.1, {ease: FlxEase.circIn});
	FlxTween.tween(FlxG.camera, {zoom: 3, angle: 22}, 1.1, {ease: FlxEase.quartIn});
	FlxTween.tween(animbarScrt, {y: animbarScrt.y - 200}, 0.5, {ease: FlxEase.quadIn});
	FlxTween.tween(animbarScrb, {y: animbarScrb.y + 200}, 0.5, {ease: FlxEase.quadIn});
	FlxG.camera.fade(0xFF000000, 0.8, true);

	transitioning = true;
	// FlxG.sound.music.stop();
	new FlxTimer().start(1, function(tmr:FlxTimer)
		
	//MusicBeatState.switchState((ClientPrefs.warnings ? new substates.WarningSubState() : new menus.DesktopMenu()));
	FlxG.switchState(new ModState('DesktopState')));
}
