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
	rightBar.visible = false;
	leftBar.visible = false;
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
		rightBar.visible = true;
		leftBar.visible = true;
		accuracyTxt.alpha = 1;
		scoreTxt.alpha = 1;
		iconP1.visible = true;
		iconP2.visible = true;
		defaultCamZoom -= 0.1;
		camHUD.alpha = 1;
		comboGroup.visible = true;
		FlxG.camera.flash(FlxColor.WHITE, 1);
//		insert(members.indexOf(stage.getSprite("wbg")), snowemitter); 
		case 752:
			defaultCamZoom += 0.1;
			case 761: 
			if (FlxG.save.data.mosaic) {
				mosaic.data.uBlocksize.value = [1];
				FlxG.camera.addShader(mosaic);
			}
			case 762:if (FlxG.save.data.mosaic) {mosaic.data.uBlocksize.value = [2];}
			case 763:if (FlxG.save.data.mosaic) {mosaic.data.uBlocksize.value = [3];}
			case 764:if (FlxG.save.data.mosaic) {mosaic.data.uBlocksize.value = [6];}
			case 765:if (FlxG.save.data.mosaic) {mosaic.data.uBlocksize.value = [9];}
			case 766:if (FlxG.save.data.mosaic) {mosaic.data.uBlocksize.value = [13];}
			case 767: if (FlxG.save.data.mosaic) {mosaic.data.uBlocksize.value = [20];}
			case 768:
			if (FlxG.save.data.mosaic) {mosaic.data.uBlocksize.value = [0];	FlxG.camera.removeShader(mosaic);}
			cameraSpeed = 3;
			if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);
			chrom.data.rOffset.value = [1];
			chrom.data.gOffset.value = [0.0];
			chrom.data.bOffset.value = [1 * -1];
			}
			defaultCamZoom -= 0.1;
			FlxG.camera.zoom -= 0.1;
			FlxG.camera.flash(FlxColor.fromRGB(224, 224, 224), 3);
/*			FlxTween.cancelTweensOf(camFollowPos);
			FlxTween.tween(camFollowPos, {x: camFollow.x, y: camFollow.y}, 0.01);
*/			case 1280:
				if (FlxG.save.data.chrom) {FlxG.camera.removeShader(chrom);camHUD.removeShader(chrom);}
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