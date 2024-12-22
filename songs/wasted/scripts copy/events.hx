var fog:FlxSprite;
var truefog:FlxSprite;
var fiss = new CustomShader('godray');
var crt = new CustomShader('fake CRT');
function postCreate() {
	fog = new FlxSprite().loadGraphic(Paths.image('stages/pissedStreet/fog'));
	fog.scale.set(2, 2);
	fog.screenCenter();
	fog.scrollFactor.set(0.8, 0.8);
	fog.cameras = [camHUD];
	truefog = new FlxSprite().loadGraphic(Paths.image('stages/pissedStreet/truefog'));
	truefog.scale.set(2, 2);
	truefog.screenCenter();
	truefog.scrollFactor.set(0.8, 0.8);
	insert(members.indexOf(stage.getSprite("mountains")), truefog);
	truefog.visible = false;
}
function beatHit(curBeat) {
	if ((curBeat >= 129) && (curBeat < 233))
	{
		for (i in 0...4)
		{ 
			for (guh in [playerStrums, cpuStrums])
			{
				var member = guh.members[i];
								
				if (curBeat % 2 == 0)
				{
					var angler = (i%2 ? 10 : -10) * ((curBeat%4==2) ? -1 : 1);

					FlxTween.tween(member, {angle: angler, y: member.y + (PlayState.downscroll ? 10 : -10)}, 0.125, {
							ease: FlxEase.quartIn,
							onComplete: function(twn:FlxTween)
							{
								FlxTween.tween(member, {angle: 0, y: member.y - (PlayState.downscroll ? 10 : -10)}, 0.33, {ease: FlxEase.circInOut});
							}
						});
				}
			}
		}
	}
	switch(curBeat) {
		case 124: 
			var it = 0; for (i in stage.stageSprites) {
				FlxTween.color(i, (Conductor.crochet/1000) * 4.5,0xFFFFFFFF, 0xFF000000);
			}
			FlxTween.cancelTweensOf(FlxG.camera, ['zoom']);
			FlxTween.tween(FlxG.camera, {zoom: 1.1}, Conductor.crochet / 1000 * 5, {ease: FlxEase.circIn, onUpdate: function(value) {defaultCamZoom = 0.8;}});
		case 129: 
			truefog.visible = true;
			add(fog);
			fog.color = 0xFF77ADFF;
			FlxG.camera.flash(0xFF000000, 1, null, true);
			dad.color = 0xFF000000;
			boyfriend.color = 0xFF000000;
			gf.color = 0xFF000000;
			truefog.color = 0xFFFFFFFF;
			stage.getSprite("sky").color = 0xFFFFFFFF;
			stage.getSprite("city").color = 0xFFFFFFFF;
			stage.getSprite("mountains").color = 0xFF000000;
			stage.getSprite("hillfront").color = 0xFF000000;
			stage.getSprite("street").color = 0xFF000000;
			stage.getSprite("street").alpha = 0.5;
			stage.getSprite("hillfront").alpha = 0.25;
			stage.getSprite("mountains").alpha = 0.125;
			gf.alpha = 0.75;
		case 233:
			truefog.visible = false;
			remove(fog);
			var it = 0; 
			for (i in stage.stageSprites) {
				if (i.color == 0xFF000000)
					FlxTween.color(i, (Conductor.crochet/2000), 0xFF000000, 0xFFFFFFFF, {ease: FlxEase.circOut});
			}
			for (i in [dad, gf, boyfriend])
				FlxTween.color(i, (Conductor.crochet/2000), 0xFF000000, 0xFFFFFFFF, {ease: FlxEase.circOut});

			stage.getSprite("street").alpha = 
			stage.getSprite("hillfront").alpha = 
			stage.getSprite("mountains").alpha = 
			gf.alpha = 1;
	case 393:
		camGame.addShader(fish);
			case 484:
		camGame.removeShader(fish);
			case 529:
		camGame.addShader(crt);
	}
}
