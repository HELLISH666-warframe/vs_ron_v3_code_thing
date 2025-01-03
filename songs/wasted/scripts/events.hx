var fog:FlxSprite;
var truefog:FlxSprite;
var time:Float = 0;
var iTime:Float = 0;
var ray = new CustomShader('godray');
var crt = new CustomShader('fake CRT');
var wig:CustomShader  = new CustomShader("glitchsmh");
var chrom:CustomShader  = new CustomShader("chromatic aberration");

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
}override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.005*Math.sin(time)];
	chrom.data.bOffset.value = [-0.005*Math.sin(time)];
	wig.data.iTime.value = [0.005*Math.sin(time)];
}
function beatHit(curBeat) {
	if ((curBeat >= 1) && (curBeat < 233))
		{
			for (i in 0...4)
			{ 
				for (guh in [playerStrums, cpuStrums])
				{
					var member = guh.members[i];
									
					if (curBeat % 2 == 0)
					{
						var angler = (i%1 ? 7 : -7) * ((curBeat%8==0) ? -7 : 7);
	
						FlxTween.tween(member, {y: angler + (PlayState.downscroll ? 10 : -10)}, 0.125, {
								ease: FlxEase.quartIn,
								onComplete: function(twn:FlxTween)
								{
									FlxTween.tween(member, {y: 20 - (PlayState.downscroll ? 10 : -10)}, 0.33, {ease: FlxEase.circInOut});
								}
							});
					}
				}
			}
		}
	switch(curBeat) {
		case 76: 
			var it = 1; for (i in stage.stageSprites) {
				FlxTween.color(i, (Conductor.crochet/1000) * 4.5,0xFFFFFFFF, 0xFF000000);
			}
			FlxTween.cancelTweensOf(FlxG.camera, ['zoom']);
			FlxTween.tween(FlxG.camera, {zoom: 1.1}, Conductor.crochet / 1000 * 5, {ease: FlxEase.circIn, onUpdate: function(value) {defaultCamZoom = 0.8;}});
		case 80: 
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
	}
}
function stepHit(step)
{
	if ((curStep >= 1104) && (curStep < 1360))
	{
		for (i in 0...8)
		{
		boyfriend.y += Math.sin(curStep/6)/2;
		dad.y -= Math.sin(curStep/6)/2;
		gf.y += Math.sin(curStep/4)/2;
		gf.angle += 0.7;
		boyfriend.angle += Math.sin(curStep/8)/6;
		dad.angle -= Math.sin(curStep/8)/6;
		}
	}
	switch(curStep) 
	{
		case 1088:
		camGame.visible = false;
		camHUD.visible = false;
		case 1104:
		camGame.visible = true;
		camHUD.visible = true;
		camGame.addShader(ray);
		case 1360:
		camGame.removeShader(ray);
		camGame.visible = false;
		camHUD.visible = false;
		case 1480:
		FlxTween.tween(dad, {angle: 0}, 0.2, {ease: FlxEase.linear});
		FlxTween.tween(boyfriend, {angle: 0}, 0.2, {ease: FlxEase.linear});
		FlxTween.tween(gf, {angle: 0}, 0.2, {ease: FlxEase.linear});
	if (FlxG.save.data.glitch) {FlxG.camera.addShader(wig);camHUD.addShader(wig);
		wig.data.iTime.value = [2,2];wig.data.on.value = [1.];
		}
		if (FlxG.save.data.crt) {FlxG.camera.addShader(crt);camHUD.addShader(crt);}
	if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);camHUD.addShader(chrom);
		chrom.data.rOffset.value = [1/2];
		chrom.data.gOffset.value = [0.0];
		chrom.data.bOffset.value = [1 * -1];
		}
		case 1488:
		camGame.visible = true;
		camHUD.visible = true;
	}
}