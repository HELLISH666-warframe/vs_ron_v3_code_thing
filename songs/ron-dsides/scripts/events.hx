import flixel.effects.particles.FlxTypedEmitter;
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
var funnyDSidesSpin:Bool = false;
function postCreate(){
	if (FlxG.random.int(1, 70) == 69)
		iconP2.setIcon('peak-dsides');
}
function update(elapsed:Float)
{		
if (funnyDSidesSpin) iconP2.angle += 180*elapsed;
rain.data.iTime.value = [-24*Math.sin(elapsed)];
}
function onDadHit(e){		
	if (funnyDSidesSpin) 
	dad.angle = FlxG.random.int(0,359);
}
function stepHit(){
	switch(curStep){
		case 768:
		funnyDSidesSpin = true;
		case 1037:
		funnyDSidesSpin = false;
		FlxTween.tween(dad, {angle: Math.floor(dad.angle/360)*360}, 0.8, {ease: FlxEase.expoOut});
		FlxTween.tween(iconP2, {angle: Math.floor(iconP2.angle/360)*360}, 0.8, {ease: FlxEase.expoOut});
		case 1315:
		if (FlxG.save.data.rain) {
			FlxG.camera.addShader(rain);
			rain.data.zoom.value = [35];
			rain.data.raindropLength.value = [0.075];
			rain.data.opacity.value = [0.2];}
		defaultCamZoom += 0.1;
		fxtwo = new FlxSprite().loadGraphic(Paths.image('stages/effect'));
		fxtwo.scale.set(1.5, 1.5);
		fxtwo.updateHitbox();
		fxtwo.antialiasing = true;
		fxtwo.screenCenter();
		fxtwo.alpha = 0.2;
		fxtwo.scrollFactor.set(0, 0);
		fxtwo.camera = camHUD;
		add(fxtwo);
		FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
	}
}