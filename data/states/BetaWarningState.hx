var chrom:CustomShader  = new CustomShader("chromatic aberration");
var glitch:CustomShader  = new CustomShader("glitchsmh");
var vhs:CustomShader  = new CustomShader("vhs");
var crt:CustomShader  = new CustomShader("fake CRT");
var time:Float = 0;
var mmtw:FlxSound = new FlxSound();
var chromeOffset = (FlxG.save.data.chromeOffset/350);

function postCreate() {
	mmtw = FlxG.sound.load(Paths.music('breakfast'), 0, true);
	mmtw.volume = 0;
	mmtw.play(false, FlxG.random.int(0, Std.int(mmtw.length / 2)));
	var bg:FlxSprite = CoolUtil.loadAnimatedGraphic(new FlxSprite(), Paths.image('menus/titlescreen/titleThing'));
	bg.scale.set(2.25,2.25);
	bg.updateHitbox();
	bg.screenCenter();
	bg.scrollFactor.set(0.1,0.1);
	bg.alpha = 0.33;
	add(bg);
	titleAlphabet.visible = false;
	disclaimer.visible = false;

	var screen:FlxSprite = new FlxSprite().loadGraphic(Paths.image("warning/lol"));
	screen.angle = -3;
	add(screen);
		
	FlxTween.tween(screen, {y: screen.y + 20}, 1, {ease: FlxEase.circInOut, type: FlxTween.PINGPONG});
	FlxTween.tween(screen, {angle: 3}, 2, {ease: FlxEase.backInOut, type: FlxTween.PINGPONG});
	if (FlxG.save.data.glitch) {FlxG.camera.addShader(glitch);
		glitch.data.on.value = [1.];
	}
	if (FlxG.save.data.vhs)FlxG.camera.addShader(vhs);
	if (FlxG.save.data.crt)FlxG.camera.addShader(crt);
	if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);
		chrom.data.rOffset.value = [chromeOffset/2];
		chrom.data.bOffset.value = [chromeOffset * -1];
	}
}
override function update(elapsed:Float){time += elapsed;
	glitch.data.iTime.value = [time];
    vhs.data.iTime.value = [time];
	if (mmtw.volume < .5) {
		mmtw.volume += elapsed * .01;
	}
	if (FlxG.keys.justPressed.ENTER){
		mmtw.destroy();
		FlxG.sound.play(Paths.sound('resumeSong'));
		FlxTween.tween(FlxG.camera, {zoom: 0.5, angle: 45}, 0.9, {ease: FlxEase.quadIn});
		new FlxTimer().start(0.8, function(tmr:FlxTimer)
		FlxG.switchState(new TitleState()));
	}
}