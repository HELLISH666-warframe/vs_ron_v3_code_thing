
function bruh()
	{
		var bruh:FlxSprite = new FlxSprite();
		bruh.loadGraphic(Paths.image('ron/longbob'));
		bruh.antialiasing = true;
		bruh.active = false;
		bruh.scrollFactor.set();
		bruh.screenCenter();
		add(bruh);
		FlxTween.tween(bruh, {alpha: 0}, 1, {
			ease: FlxEase.cubeInOut,
			onComplete: function(twn:FlxTween)
			{
				bruh.destroy();
			}
		});
	}
function stepHit(curStep) {
	switch (curStep) {
		case 1:
			camGame.fade(0xFF000000, 12.8, true);
		case 128:
			defaultCamZoom = 0.7;
			camGame.color = FlxColor.WHITE;
			FlxG.camera.flash(FlxColor.WHITE, 1);
		case 384:
			defaultCamZoom = 0.8;
			FlxG.camera.flash(FlxColor.WHITE, 1);
		case 786:
			defaultCamZoom = 1;
			camGame.color = FlxColor.GRAY;
			FlxG.camera.flash(FlxColor.BLACK, 1);
//		case 892:
//			bruh();
		case 1024:
			defaultCamZoom = 0.9;
			FlxG.camera.flash(FlxColor.WHITE, 1);	
		case 1148:
			FlxTween.tween(FlxG.camera, {zoom: 1.5}, 0.4, {ease: FlxEase.expoOut,});
		case 1152:
			defaultCamZoom = 1;
		case 1264:
			defaultCamZoom = 0.9;
		case 1280:
			defaultCamZoom = 0.7;
			camGame.color = FlxColor.WHITE;
			FlxG.camera.flash(FlxColor.WHITE, 1);
	}
}
//function onSongStart(){}