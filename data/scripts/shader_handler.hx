function beatHit(curBeat) {
	switch(curBeat) {
		case 246:
		dad.color = boyfriend.color = FlxColor.BLACK;
		camGame.flash(FlxColor.WHITE, 1);
		case 278:
		camGame.flash(FlxColor.WHITE, 1);
		dad.color = boyfriend.color = FlxColor.WHITE;
		case 294:
		camGame.flash(FlxColor.WHITE, 1);
		iconP2.setIcon('trump');
	}
}