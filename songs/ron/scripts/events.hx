import flixel.effects.particles.FlxTypedEmitter;
var fxtwo:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stages//effect'));
var defaultStrumY:Float = 50;
defaultStrumY = strumLine.y;
var time:Float = 0;
var rain:flixel.effects.particles.FlxTypedEmitter;
rain = new FlxTypedEmitter(-1280,0, 1280);
rain.loadParticles(Paths.image("stages/raindrop"),500);
rain.scale.set(0.5, 0.5, 1, 1);
rain.lifespan.set(0);
rain.velocity.set(-20, 400,20,800);
rain.keepScaleRatio = true;
rain.width = 1280*4;
rain.start(false, 0.01);
var rain:CustomShader  = new CustomShader("rain");

function update(elapsed:Float){time += elapsed;
    rain.data.iTime.value = [-24*Math.sin(time)];
}
function postCreate() {
	stage.getSprite("blackeffect").alpha=0.001;
}
function stepHit(curStep)
{
	if ((curStep >= 272) && (curStep <= 1304))
	{
		if (curStep % 8 == 0)
			for (i in 0...4){
				for (guh in [playerStrums, cpuStrums])
					 FlxTween.tween(guh.members[i], {y: defaultStrumY + 20}, 0.65, {ease: FlxEase.backOut, 								
					onComplete: function(twn:FlxTween)
					{
						FlxTween.tween(guh.members[i], {y: guh.members[i].y = 0 }, 0.65, {ease: FlxEase.backOut});
					}
				});
			}
		}
	if (curStep == 540||curStep == 604||curStep == 668||curStep == 732||curStep == 1304)
		FlxTween.tween(FlxG.camera, {zoom: 1.2}, 0.4, {ease: FlxEase.backOut});
	switch (curStep) {
		case 208:
			defaultCamZoom = 0.9;
		case 264:
			defaultCamZoom = 1.1;
		case 272:
			defaultCamZoom = 0.7;
			FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
		case 540 | 668:
			dad.playAnim('hey');
		case 604 | 732:
			boyfriend.playAnim('hey');
		case 1304:
			if (FlxG.save.data.rain) {FlxG.camera.addShader(rain);
				rain.data.zoom.value = [35];
				rain.data.raindropLength.value = [0.075];
				rain.data.opacity.value = [0.2];
				}
			fxtwo.scale.set(1.5, 1.5);
			fxtwo.updateHitbox();
			fxtwo.antialiasing = true;
			fxtwo.screenCenter();
			fxtwo.alpha = 0.2;
			fxtwo.scrollFactor.set(0, 0);
			add(fxtwo);
			fxtwo.camera = camHUD;
		case 1312:
			defaultCamZoom = 0.8;
		case 1440:
			defaultCamZoom = 0.9;
		case 1568:
			FlxTween.tween(stage.getSprite("blackeffect"), {alpha: 1}, 0.5, {ease: FlxEase.circInOut});
			defaultCamZoom = 1.05;
		case 1600:
			FlxTween.tween(stage.getSprite("blackeffect"), {alpha: 0}, 0.5, {ease: FlxEase.circOut});
			defaultCamZoom = 0.8;
	}
}