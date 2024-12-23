function postCreate() {
	firebg.alpha = 0;
}
function stepHit(curStep) {
	switch(curStep) {
		case 288:
			FlxTween.tween(firebg, {alpha: 1}, 1, {ease: FlxEase.circOut});
			FlxTween.angle(satan, 0, 359.99, 0.75, { type: FlxTween.LOOPING } );
		case 544:
			FlxG.camera.flash(FlxColor.WHITE, 1);
			FlxTween.tween(firebg, {alpha: 0}, 1, {ease: FlxEase.circOut});
			FlxTween.cancelTweensOf(satan);
			FlxTween.angle(satan, 0, satan.angle+359.99, 3, {ease: FlxEase.circOut} );
		case 928:
			FlxTween.tween(firebg, {alpha: 1}, 1, {ease: FlxEase.circOut});
			FlxTween.angle(satan, 0, 359.99, 0.75, { type: FlxTween.LOOPING } );
		case 1184:
			FlxTween.tween(firebg, {alpha: 0}, 1, {ease: FlxEase.circOut});
			FlxTween.cancelTweensOf(satan);
			FlxTween.angle(satan, 0, satan.angle+359.99, 3, {ease: FlxEase.circOut} );
	}
}
