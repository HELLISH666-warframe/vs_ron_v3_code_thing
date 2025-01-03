var transitionWheel:FlxSprite = new FlxSprite(0, 0);
transitionWheel.frames = Paths.getSparrowAtlas('menus/transition');
transitionWheel.animation.addByPrefix("thing", "transition wipe", 30, false);
// transitionWheel.scale.set(2, 2);
// transitionWheel.antialiasing = true;
transitionWheel.updateHitbox();
static var skipTransition:Bool = false;
static var whiteTransition:Bool = false;

// hi anchored
// FlxG.game.rotation = 0;
// FlxG.game.x = 282;

function create() {
	transitionTween.cancel();
	transitionCamera.scroll.y = 0;
	transitionCamera.height = 720;
	// transitionCamera.x = 0;

	remove(blackSpr);
	remove(transitionSprite);
	if (!skipTransition)
		add(transitionWheel);

	// transitionWheel
	new FlxTimer().start(0.5, () -> {
		finish();
	});

	if (!skipTransition)
		transitionWheel.animation.play('thing', true, newState == null, () -> {
			finish();
		}, true);
	if (whiteTransition)
		transitionCamera.fade(0xFFFFFFFF, 0.4, newState == null, () -> {
			finish();
		}, true);
}

// function finish () {
//	if (whiteTransition) transitionCamera.fade(0xFFFFFFFF, 0.25);
// }
