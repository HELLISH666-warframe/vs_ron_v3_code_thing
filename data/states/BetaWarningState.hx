var chrom:CustomShader  = new CustomShader("chromatic aberration");
var wig:CustomShader  = new CustomShader("glitchsmh");
var vhs:CustomShader  = new CustomShader("vhs");
var crt:CustomShader  = new CustomShader("fake CRT");
var time:Float = 0;
var timer:Int;
var mmtw:FlxSound = new FlxSound();
if (FlxG.save.data.vhs) {
override function postCreate() {

	mmtw = new FlxSound();
	mmtw = FlxG.sound.load(Paths.music('breakfast'), 0, true);
	mmtw.volume = 0;
	mmtw.play(false, FlxG.random.int(0, Std.int(mmtw.length / 2)));
		var bg:FlxSprite = CoolUtil.loadAnimatedGraphic(new FlxSprite(), Paths.image('menus/titlescreen/titleThing'));
		add(bg);
		bg.screenCenter();
		bg.updateHitbox();
		bg.scale.set(2.25,2.25);
		bg.scrollFactor.set(0.1,0.1);
		bg.alpha = 0.33;
		titleAlphabet.visible = false;
		disclaimer.visible = false;

		screen = new FlxSprite().loadGraphic(Paths.image("warning/lol"));
		screen.screenCenter();
		screen.angle = -3;
		add(screen);
		
		FlxTween.tween(screen, {y: screen.y + 20}, 1, {ease: FlxEase.circInOut, type: FlxTween.PINGPONG});
		FlxTween.tween(screen, {angle: 3}, 2, {ease: FlxEase.backInOut, type: FlxTween.PINGPONG});
		if (FlxG.save.data.crt){FlxG.camera.addShader(crt);}
	if (FlxG.save.data.glitch) {FlxG.camera.addShader(wig);
		wig.data.on.value = [1.];
	}
	if (FlxG.save.data.vhs) {FlxG.camera.addShader(vhs);}
	if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);
		chrom.data.rOffset.value = [1/2];
		chrom.data.gOffset.value = [0.0];
		chrom.data.bOffset.value = [1 * -1];
	}
}
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.005*Math.sin(time)];
	chrom.data.bOffset.value = [-0.005*Math.sin(time)];
	wig.data.iTime.value = [0.005*Math.sin(time)];
    vhs.data.iTime.value = [1*Math.sin(time)];
	timer += 1;
	if (mmtw.volume < .5) {
		mmtw.volume += elapsed * .01;
	}
	if (FlxG.keys.justPressed.ENTER){
		mmtw.destroy();
		FlxG.sound.play(Paths.sound('resumeSong'));
		FlxTween.tween(FlxG.camera, {zoom: 0.5, angle: 45}, 0.5, {ease: FlxEase.quadIn});
	}
}
}