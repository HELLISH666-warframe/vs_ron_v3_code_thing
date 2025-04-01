//yes_i_know_how_unoptimized_this_shit_is
import flixel.effects.particles.FlxTypedEmitter;
var rain:flixel.effects.particles.FlxTypedEmitter;
import openfl.display.BlendMode;
rain = new FlxTypedEmitter(-1280,0, 1280);
rain.loadParticles(Paths.image("stages/raindrop"),500);
rain.scale.set(0.5, 0.5, 1, 1);
rain.lifespan.set(0);
rain.velocity.set(-20, 400,20,800);
rain.keepScaleRatio = true;
//rain.cameras = [camHUD];
rain.width = 1280*4;
rain.start(false, 0.01);
var rain:CustomShader  = new CustomShader("rain");
var crt = new CustomShader('fake CRT');
var ray = new CustomShader('godray');
var iTime:Float = 0;
var time:Float = 0;
var defaultStrumY:Float = 50;
public var camOverlay:FlxCamera;
camOverlay = new FlxCamera();
if (FlxG.save.data.rain) {FlxG.camera.addShader(rain);rain.data.zoom.value = [32];
	rain.data.raindropLength.value = [0.03];rain.data.opacity.value = [0.125];}
	blackeffect = new FlxSprite().makeGraphic(FlxG.width, FlxG.width, FlxColor.BLACK);
	blackeffect.scale.set(4,4);
	blackeffect.updateHitbox();
	blackeffect.antialiasing = true;
	blackeffect.screenCenter();
	blackeffect.scrollFactor.set();
	blackeffect.alpha = 0;
	add(blackeffect);
	var fgfxtwo = new FlxSprite().loadGraphic(Paths.image('stages/pissedStreet/fog'));
	fgfxtwo.scale.set(3, 3);
	fgfxtwo.updateHitbox();
	fgfxtwo.antialiasing = true;
	fgfxtwo.screenCenter();
	fgfxtwo.alpha = 0.5;
	fgfxtwo.color = FlxColor.BLACK;
	fgfxtwo.scrollFactor.set(0.4, 0.4);
	add(fgfxtwo);			
	fgfxtwo.visible = false;
override function update(elapsed:Float){time += elapsed;
	rain.data.iTime.value = [-25*Math.sin(time)];
	ray.data.iTime.value = [-1*Math.sin(time)];
}
function postCreate() {
	underwater.visible = false;
	street.visible = hillfront.visible = mountains.visible = city.visible = sky.visible = rain3.visible = true;
	rain2.visible = true;
	rain1.visible = true;
}
function stepHit(step)
{
	switch (step)
	{
		case 192:
			defaultCamZoom = 0.9;
			cameraSpeed = 8;
		case 320:
			defaultCamZoom = 0.95;
			//penile injection
			fgfxtwo.visible = true;
			if (FlxG.save.data.rain) {rain.data.zoom.value = [35];
				rain.data.raindropLength.value = [0.075];rain.data.opacity.value = [0.2];}
			fxtwo = new FlxSprite().loadGraphic(Paths.image('stages/pissedStreet/fog'));
			fxtwo.scale.set(2, 2);
			fxtwo.updateHitbox();
			fxtwo.antialiasing = true;
			fxtwo.screenCenter();
			fxtwo.alpha = 0.2;
			fxtwo.scrollFactor.set(0.8, 0.8);
			fxtwo.color = FlxColor.BLACK;
			fxtwo.blend = BlendMode.OVERLAY;
			add(fxtwo);
			cameraSpeed = 0.2;
			fxtwo.cameras = [camOverlay];
			FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
		case 576:
			if (FlxG.save.data.rain) {rain.data.zoom.value = [32];
				rain.data.raindropLength.value = [0.03];rain.data.opacity.value = [0.125];}
				fgfxtwo.visible = false;
			fxtwo.visible = false;
			cameraSpeed = 1;
			defaultCamZoom = 0.8;
		case 816:
			defaultCamZoom = 0.9;
		case 836:
			defaultCamZoom = 0.95;
			cameraSpeed = 0.2;
			fxtwo.visible = true;
			fgfxtwo.visible = true;
			FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
			if (FlxG.save.data.rain) {rain.data.zoom.value = [40];
				rain.data.raindropLength.value = [0.1];rain.data.opacity.value = [0.25];}
		case 1088:
			rain1.visible = street.visible = rain2.visible = hillfront.visible = mountains.visible = city.visible = sky.visible = rain3.visible = false;
			cameraSpeed = 1;
			defaultCamZoom = 0.9;
			camGame.alpha = 0;
			if (FlxG.save.data.rain) {rain.data.opacity.value = [0];}
		case 1104:
			cameraSpeed = 8;
			camGame.alpha = 1;
			defaultCamZoom = 0.75;
	//		triggerEventNote('Change Character', 'bf', 'bfUnderwater');
//			triggerEventNote('Change Character', 'dad', 'ronUnderwater');
//			triggerEventNote('Change Character', 'gf', 'gfUnderwater');
			dad.scale.set(1.2,1.2);
			boyfriend.x += 120;
			dad.x -= 120;
			if (FlxG.save.data.crt) {FlxG.camera.addShader(crt);camHUD.addShader(crt);}
			camGame.addShader(ray);
			FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
			underwater.visible = true;
		case 1232:
			defaultCamZoom = 0.85;
		case 1360:
			camGame.alpha = 0;
//			if (FlxG.save.data.crt) {FlxG.camera.removeShader(crt);camHUD.removeShader(crt);}
			camGame.removeShader(ray);
/*			for (i in 0...8)
				{ 
				var member = strumLineNotes.members[i];
				member.y = defaultStrumY;
				}
*/		case 1400:
			gf.angle = 0;
			boyfriend.angle = 0;
			dad.angle = 0;

		case 1488:
//		if (FlxG.save.data.crt) {FlxG.camera.addShader(crt);camHUD.addShader(crt);}
		if (FlxG.save.data.rain) {rain.data.zoom.value = [32];
			rain.data.raindropLength.value = [0.03];rain.data.opacity.value = [0.125];}
		rain1.visible = street.visible = rain2.visible = hillfront.visible = mountains.visible = city.visible = rain3.visible = sky.visible = fgfxtwo.visible = true;
		underwater.visible = false;
		cameraSpeed = 1;
		defaultCamZoom = 1;
		camGame.alpha = 1;
		FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
	}
}