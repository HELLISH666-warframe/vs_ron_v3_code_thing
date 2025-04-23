playCutscenes = true;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
importScript("data/scripts/bloodbleed-shit");
//var evilTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069);

/*function postCreate() {				
Estatic = new FlxSprite().loadGraphic(Paths.image('stages/deadly'));
Estatic.scrollFactor.set();
Estatic.screenCenter();
Estatic.alpha = 0;
}*/
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
function stepHit(curStep) {
	switch(curStep) {
		case 1:
		var snowemitter:FlxTypedEmitter = new FlxTypedEmitter(9999, 0, 300);
		snowemitter.width = FlxG.width*1.5;
		snowemitter.velocity.set(-10, 1600, 10, 2200);
		snowemitter.lifespan.set(5);
		snowemitter.y = FlxG.height;
		snowemitter.acceleration.set(-10, 1600, 10, 2200);

		for (i in 0...150)
		{
			var p = new FlxParticle();
			var p2 = new FlxParticle();
			var p3 = new FlxParticle();
			p.makeGraphic(12,16,FlxColor.BLACK);
			p2.makeGraphic(8,12,FlxColor.BLACK);
			p3.makeGraphic(16,20,FlxColor.BLACK);

			snowemitter.add(p);
			snowemitter.add(p2);
			snowemitter.add(p3);
		}

		add(snowemitter);
		snowemitter.start(false, 0.035);
		case 128:
		if (FlxG.save.data.rain) {FlxG.camera.addShader(rain);
			rain.data.zoom.value = [40];rain.data.raindropLength.value = [0.1];
			rain.data.opacity.value = [0.25];}
			FlxG.camera.flash(FlxColor.WHITE, 1);
		if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);
			chrom.data.rOffset.value = [chromeOffset2/2];
			chrom.data.bOffset.value = [chromeOffset2/2];
			}
			cameraSpeed = 2;
		case 256:
			cameraSpeed = 3;
			for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 275 ,angle: 360}, 1,{ease: FlxEase.backOut});
			for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x + 1250 ,angle: 360}, 1, {ease: FlxEase.quintInOut});
		case 368:
			defaultCamZoom = 1;
		case 376:
			FlxG.camera.shake(0.03, 1);
		case 384:
			rain.data.zoom.value = [20];
			rain.data.raindropLength.value = [0.05];
			defaultCamZoom = 0.7;
			cameraSpeed = 8;
			FlxG.camera.flash(FlxColor.WHITE, 1);
			camFollow.y -= 10400;
			boyfriend.y -= 10400;
			dad.y -= 10400;
			gf.visible = false;
		case 512:
			defaultCamZoom = 0.75;
			cameraSpeed = 2.5;
		case 576:
			FlxTween.tween(dad, {y: dad.y + 5600}, 5.4, {ease: FlxEase.quadIn});
			FlxTween.tween(boyfriend, {y: boyfriend.y + 5600}, 5.4, {ease: FlxEase.quadIn});
			defaultCamZoom = 0.85;
			cameraSpeed = 2;
		case 632:
			defaultCamZoom = 1.1;
		case 640:
			cameraSpeed = 1.5;
			rain.data.zoom.value = [40];
			rain.data.raindropLength.value = [0.1];
			cameramoveshed = false;
			defaultCamZoom = 0.7;
			FlxTween.tween(camGame, {angle: 0}, 1, {ease: FlxEase.circOut});
			FlxTween.tween(camHUD, {angle: 0}, 1, {ease: FlxEase.circOut});
			FlxG.sound.play(Paths.sound('hellexplode'), 0.7);
			FlxG.camera.flash(FlxColor.WHITE, 1);
//			FlxG.camera.follow(camFollowPos, LOCKON, cameraSpeed);
		case 896: 
			cameramoveshed = true;
			rain.data.zoom.value = [20];
			rain.data.raindropLength.value = [0.05];
			FlxG.camera.flash(FlxColor.WHITE, 1);	
			FlxG.sound.play(Paths.sound('hellexplode'), 0.7);
			dad.y -= 5400;
			boyfriend.y -= 5400;
			FlxTween.tween(boyfriend, {angle: 359.99 * 8}, 23);
//			FlxG.camera.follow(camFollowPos, LOCKON, cameraSpeed*2);
		case 1136:
			cameramoveshed = false;
			FlxTween.tween(dad, {y: dad.y - 1000}, 1, {ease: FlxEase.quadIn});
			FlxTween.tween(boyfriend, {y: boyfriend.y - 1000}, 1, {ease: FlxEase.quadIn});
			camGame.fade(0xFFFFFFFF, (Conductor.stepCrochet/1000)*14);
			FlxTween.tween(camGame, {angle: 0}, 0.3, {ease: FlxEase.circOut});
			FlxTween.tween(camHUD, {angle: 0}, 0.3, {ease: FlxEase.circOut});
		case 1151: 
//			FlxG.camera.follow(camFollowPos, LOCKON, 0.5);
			defaultCamZoom = 0.7;
			FlxG.camera.flash(FlxColor.WHITE, 1);	
			rain.data.opacity.value = [0.0];
			FlxTween.angle(boyfriend, 0, boyfriend.angle + 359.99, 3, { type: FlxTween.LOOPING } );
			camGame.fade(0xFFFFFFFF, 0.1, true);
			defaultCamZoom -= 0.1;
			dad.y += 9400;
			boyfriend.y = dad.y+650;
		case 1153: 
			boyfriend.y = dad.y-650;
	}
}
function update(elapsed:Float){time += elapsed;
	//chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	//chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
    rain.data.iTime.value = [-24*Math.sin(time)];
	iconP2.alpha = (2-(health)-0.15)/1+0.2;
	iconP1.alpha = (health-0.15)/1+0.2;
}