//frakits_made_the_modchart
function postCreate() {
	camHUD.height += 60;
	camGame.zoom = 0.6;
	defaultCamZoom = 0.8;
}
function beatHit(curBeat) {
	if (curBeat > 35) {
		if (curBeat == 36)
			camZoomingInterval = 1;
		FlxTween.cancelTweensOf(camHUD);
		camHUD.angle = -5 + (10 * curBeat % 2);
		FlxTween.tween(camHUD, {y: -50, angle: 0}, (Conductor.crochet / 1000) / 2, {ease: FlxEase.circOut, onComplete: function() {
			FlxTween.tween(camHUD, {y: 0, angle: 0}, (Conductor.crochet / 1000) / 2, {ease: FlxEase.quartIn});
		}
		});
		camGame.zoom += 0.05;
	}
}

var enterSound:FlxSound = FlxG.sound.load(Paths.sound("gameover/exe/deathEnd"));
GameOverSubstate.script = 'data/scripts/gameovers/meta';
function onEnd(event) {
	boyfriend.visible = false;
//	deathSoundName = 'gdDeath';
	var emitter = new FlxEmitter(boyfriend.x + 90, boyfriend.y - 50);

	for (i in 0 ... 32)
	{
		var p = new FlxParticle();
		var bSize = FlxG.random.int(8,20);
		p.makeGraphic(bSize, bSize, 0xFFFFFFFF);
		p.exists = false;
		//p.alphaRange = new FlxRange(1.0, 0.0);
		emitter.add(p);
	}
	
	FlxTween.tween(FlxG.camera, {alpha: 0}, 2, {ease: FlxEase.linear});
	
	emitter.velocity.set(-32, 32, 32, -32);
	emitter.lifespan.set(3);
	add(emitter);
	emitter.start(true, 1, 0);
	FlxG.switchState(new PlayState());	

}