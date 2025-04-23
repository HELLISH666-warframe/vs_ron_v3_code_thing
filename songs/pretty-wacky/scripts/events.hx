var time = 0;
var mosaic:CustomShader = new CustomShader("mosaic");
var chrom:CustomShader  = new CustomShader("chromatic aberration");
function postCreate(){
for(i in [healthBarBG1,healthBarBG2,healthBar1,missesTxt,accuracyTxt,scoreTxt,iconP1,iconP2,scoreTxt,comboGroup]){
	i.alpha=0.001;
}
	camHUD.color = FlxColor.GRAY;
}
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];}
function stepHit(curStep){
	switch(curStep){
		case 250:
		defaultCamZoom += 0.2;
		case 256:
		camHUD.color = FlxColor.WHITE;
		for(i in [healthBarBG1,healthBarBG2,healthBar1,missesTxt,accuracyTxt,scoreTxt,iconP1,iconP2,scoreTxt,comboGroup]){
			i.alpha=1;
		}
		defaultCamZoom -= 0.1;
		FlxG.camera.flash(FlxColor.WHITE, 1);
		case 752:
		defaultCamZoom += 0.1;
		case 761: 
		if (FlxG.save.data.mosaic) {
			mosaic.data.uBlocksize.value = [1];
			FlxG.camera.addShader(mosaic);
		}
		case 762:if (FlxG.save.data.mosaic) mosaic.data.uBlocksize.value = [2];
		case 763:if (FlxG.save.data.mosaic) mosaic.data.uBlocksize.value = [3];
		case 764:if (FlxG.save.data.mosaic) mosaic.data.uBlocksize.value = [6];
		case 765:if (FlxG.save.data.mosaic) mosaic.data.uBlocksize.value = [9];
		case 766:if (FlxG.save.data.mosaic) mosaic.data.uBlocksize.value = [13];
		case 767:if (FlxG.save.data.mosaic) mosaic.data.uBlocksize.value = [20];
		case 768:
		if (FlxG.save.data.mosaic) {mosaic.data.uBlocksize.value = [0];	FlxG.camera.removeShader(mosaic);}
		cameraSpeed = 3;
		if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);
		chrom.data.rOffset.value = [chromeOffset/2];
		chrom.data.bOffset.value = [chromeOffset * -1];
		}
		defaultCamZoom -= 0.1;
		FlxG.camera.zoom -= 0.1;
		FlxG.camera.flash(FlxColor.fromRGB(224, 224, 224), 3);
		case 1280:
		if (FlxG.save.data.chrom) {FlxG.camera.removeShader(chrom);camHUD.removeShader(chrom);}
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