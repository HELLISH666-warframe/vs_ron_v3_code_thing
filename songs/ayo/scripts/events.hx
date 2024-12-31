
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