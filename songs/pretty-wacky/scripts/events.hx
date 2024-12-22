import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;

var mosaic:CustomShader = new CustomShader("mosaic");
function postCreate(){}
override function update(elapsed:Float){}
function stepHit(curStep){
	switch(curStep){
		case 256:
		var snowemitter:FlxTypedEmitter = new FlxTypedEmitter();
		snowemitter.width = FlxG.width*1.5;
		snowemitter.velocity.set(-10, -240, 10, -320);
		snowemitter.lifespan.set(5);
		snowemitter.y = FlxG.height;
		snowemitter.acceleration.set(0, -100, 0, -300);

		for (i in 0...150)
		{
			var p = new FlxParticle();
			var p2 = new FlxParticle();
			p.makeGraphic(12,12,FlxColor.GRAY);
			p2.makeGraphic(24,24,FlxColor.GRAY);

			snowemitter.add(p);
			snowemitter.add(p2);
		}

		add(snowemitter);
		snowemitter.start(false, 0.05);
		case 752:
			defaultCamZoom += 0.1;
			case 761: mosaic.data.uBlocksize.value = [1];
			FlxG.camera.addShader(mosaic);
			case 762:mosaic.data.uBlocksize.value = [2];
			case 763:mosaic.data.uBlocksize.value = [3];
			case 764:mosaic.data.uBlocksize.value = [6];
			//FlxG.camera.addShader(mosaic);
			case 765:mosaic.data.uBlocksize.value = [9];
			case 766: mosaic.data.uBlocksize.value = [13];
			case 767: mosaic.data.uBlocksize.value = [20];
			case 1280:
				FlxG.camera.removeShader(mosaic);
			case 1808:
				FlxTween.tween(camHUD, {alpha: 0}, 2, {ease: FlxEase.circInOut});
	}	
	if (curStep >= 256)
	{
		if ((curStep <= 512) && (curStep % 4 == 0))
		{
			if (curStep % 8 == 0)
			{
				camGame.angle = -2;
				camHUD.angle = -4;
			}
			else
			{
				camGame.angle = 2;
				camHUD.angle = 4;
			}
			FlxTween.tween(camGame, {angle: 0}, 0.4, {ease: FlxEase.circOut});
			FlxTween.tween(camHUD, {angle: 0}, 0.4, {ease: FlxEase.circOut});
		}
	}
}

function hishader(){
	if (Options.gameplayShaders){
		camGame.addShader(shader1);
		camGame.addShader(shader2);
		camHUD.addShader(shader1);
	}
}
