import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
var time:Float = 0;
var rain:flixel.effects.particles.FlxTypedEmitter;
var evilTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); 
rain = new FlxTypedEmitter(-1280,0, 1280);
rain.loadParticles(Paths.image("stages/raindrop"),500);
rain.scale.set(0.5, 0.5, 1, 1);
rain.lifespan.set(0);
rain.velocity.set(-20, 400,20,800);
rain.keepScaleRatio = true;
rain.width = 1280*4;
rain.start(false, 0.01);
var rain:CustomShader  = new CustomShader("rain");
var kadeEngineWatermark:FlxText;
override function update(elapsed:Float){time += elapsed;
	rain.data.iTime.value = [-24*Math.sin(time)];
	iconP2.alpha = (2-(health)-0.15)/1+0.2;
	iconP1.alpha = (health-0.15)/1+0.2;
}
function stepHit(curStep) {
	switch(curStep){
		case 1:
		FlxTween.tween(healthBar, {alpha: 0}, 0.3, {ease: FlxEase.circOut});
		FlxTween.tween(healthBarBG, {alpha: 0}, 0.3, {ease: FlxEase.circOut});
		case 288:
			case 256|896:
			defaultCamZoom = 1;
		case 288:
			defaultCamZoom = 0.65;
			evilTrail.color = FlxColor.RED;
			insert(members.indexOf(dad)-1, evilTrail);
			FlxG.camera.flash(FlxColor.WHITE, 1);
			if (FlxG.save.data.rain) {
			FlxG.camera.addShader(rain);
//			camHUD.addShader(rain);
			rain.data.zoom.value = [40];
			rain.data.raindropLength.value = [0.1];
			rain.data.opacity.value = [0.25];}
		case 544:
			defaultCamZoom = 0.8;
			FlxG.camera.flash(FlxColor.WHITE, 1);
			rain.data.opacity.value = [0.0];
		case 864|992:
			defaultCamZoom = 0.9;
		case 912:
			defaultCamZoom = 1.05;	
		case 928:
//			missval = false;
			defaultCamZoom = 0.65;
//			addShader(camGame, "rain");
            rain.data.zoom.value = [40];
            rain.data.raindropLength.value = [0.8];
			rain.data.opacity.value = [0.25];
			FlxG.camera.flash(FlxColor.WHITE, 1);
		case 1056:
			defaultCamZoom = 0.65;
		case 1184:
			defaultCamZoom = 0.8;
			FlxG.camera.flash(FlxColor.WHITE, 1);
//			missval = true;
//			Shaders["rain"].shader.data.zoom.value = [40];
            rain.data.raindropLength.value = [0.1];
            rain.data.opacity.value = [0.0];
	}
}
