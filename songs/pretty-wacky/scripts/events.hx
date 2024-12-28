import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;

var time = 0;
var mosaic:CustomShader = new CustomShader("mosaic");
var chrom:CustomShader  = new CustomShader("chromatic aberration");
function postCreate(){
    healthBarBG.alpha = 0;
    healthBar.alpha = 0;
	missesTxt.alpha = 0;
	accuracyTxt.alpha = 0;
    scoreTxt.alpha = 0;
    iconP1.visible = false;
    iconP2.visible = false;
	scoreTxt.alpha = 0;
	comboGroup.visible = false;
	camHUD.color = FlxColor.GRAY;
}
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.005*Math.sin(time)];
	chrom.data.bOffset.value = [-0.005*Math.sin(time)];}
function stepHit(curStep){
	switch(curStep){
		case 250:
		defaultCamZoom += 0.2;
		case 256:
		camHUD.color = FlxColor.WHITE;
		healthBarBG.alpha = 1;
		healthBar.alpha = 1;
		missesTxt.alpha = 1;
		accuracyTxt.alpha = 1;
		scoreTxt.alpha = 1;
		iconP1.visible = true;
		iconP2.visible = true;
		defaultCamZoom -= 0.1;
		camHUD.alpha = 1;
		comboGroup.visible = true;
		FlxG.camera.flash(FlxColor.WHITE, 1);
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
//		insert(members.indexOf(stage.getSprite("wbg")), snowemitter); 
		case 752:
			defaultCamZoom += 0.1;
			case 761: mosaic.data.uBlocksize.value = [1];
			FlxG.camera.addShader(mosaic);
			case 762:mosaic.data.uBlocksize.value = [2];
			case 763:mosaic.data.uBlocksize.value = [3];
			case 764:mosaic.data.uBlocksize.value = [6];
			case 765:mosaic.data.uBlocksize.value = [9];
			case 766: mosaic.data.uBlocksize.value = [13];
			case 767: mosaic.data.uBlocksize.value = [20];
			case 768:
			mosaic.data.uBlocksize.value = [0];
			cameraSpeed = 3;
			FlxG.camera.addShader(chrom);
//			camHUD.addShader(chrom);
			chrom.data.rOffset.value = [1];
			chrom.data.gOffset.value = [0.0];
			chrom.data.bOffset.value = [1 * -1];
			defaultCamZoom -= 0.1;
			FlxG.camera.zoom -= 0.1;
			FlxG.camera.flash(FlxColor.fromRGB(224, 224, 224), 3);
/*			FlxTween.cancelTweensOf(camFollowPos);
*/			FlxTween.tween(camFollowPos, {x: camFollow.x, y: camFollow.y}, 0.01);
			case 1280:
				FlxG.camera.removeShader(mosaic);
				FlxG.camera.removeShader(chrom);
				camHUD.removeShader(chrom);
//				FlxTween.cancelTweensOf(camFollowPos);
				cameraSpeed = 1;
				defaultCamZoom += 0.1;
				FlxG.camera.zoom += 0.1;
				FlxG.camera.flash(FlxColor.fromRGB(224, 224, 224), 3);
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