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
import openfl.Assets;
var done = false;
static var crt:CustomShader  = new CustomShader("fake CRT");
static var fish:CustomShader  = new CustomShader("godray");
var fish:CustomShader  = new CustomShader("colorizer");
function update() {
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
		var animbarScrt = new FlxBackdrop(Paths.image('menus/titlescreen/trueTitleBarTop'), FlxAxes.X, 0, 0);
		var animbarScrb = new FlxBackdrop(Paths.image('menus/titlescreen/trueTitleBarBottom'), FlxAxes.X, 0, 0);
		animbarScrb.velocity.x -= 120;
		animbarScrt.velocity.x += 120;
		insert(members.indexOf(titleScreenSprites), animbarScrb);
		insert(members.indexOf(titleScreenSprites), animbarScrt);
	}
}
function beatHit(curBeat) {
	FlxTween.completeTweensOf(FlxG.camera);
	FlxG.camera.zoom += 0.03;
	FlxTween.tween(FlxG.camera, {zoom: 1}, Conductor.crochet / 1500, {ease: FlxEase.backOut});
}
