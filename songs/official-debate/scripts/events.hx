function postCreate(){
	leftBar.flipX = true;
	rightBar.flipX = true;
	hpBorder.flipX = true;s
}

function stepHit(curStep) {
	switch(curStep) {
		case 984:
			dad.color = FlxColor.BLACK;
			boyfriend.color = FlxColor.BLACK;
			camGame.flash(FlxColor.WHITE, 1);
		case 1112:
		FlxG.camera.flash(FlxColor.WHITE, 1);
		dad.color = FlxColor.WHITE;
		boyfriend.color = FlxColor.WHITE;
		//var savedPos:Float = gf.x;
		//gf.x = -1600;
		
		//for some reason this breaks???
		// cant be bothered to fix it FlxTween.tween(gf, {x: savedPos}, 0.8, {ease: FlxEase.circOut});
		//FlxTween.globalManager.cancelTweensOf(gf);
		//gf.x = -2520;
		case 1176:
			FlxG.camera.flash(FlxColor.WHITE, 1);
			iconP2.setIcon('trump');
			dad.healthColorArray = [224,139,115];
//			triggerEventNote('Change Scroll Speed', '1.2', '0.01');
	}
}