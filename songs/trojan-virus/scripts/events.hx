import flixel.effects.particles.FlxTypedEmitter;
playCutscenes = false;
var glitch:CustomShader  = new CustomShader("glitchsmh");
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var vhs:CustomShader  = new CustomShader("vhs");
var time:Float = 0;
var iTime:Float = 0;
var rain:flixel.effects.particles.FlxTypedEmitter;
rain = new FlxTypedEmitter(-1280,0, 1280);
rain.loadParticles(Paths.image("stages/raindrop"),500);
rain.scale.set(0.5, 0.5, 1, 1);
rain.lifespan.set(0);
rain.velocity.set(-20, 400,20,800);
rain.keepScaleRatio = true;
//rain.cameras = [camHUD];
rain.width = 1280*4;
rain.start(false, 0.01);
var moveing:Bool = false;
var rain:CustomShader  = new CustomShader("rain");
var nonohud:Bool = false;
var defaultStrumX:Array<Float> = [50,162,274,386];
var defaultStrumX2:Array<Float> = [730,842,954,1066];

override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
	glitch.data.iTime.value = [0.005*Math.sin(time)];
	rain.data.iTime.value = [-25*Math.sin(time)];
	vhs.data.iTime.value = [-1*Math.sin(time)];
	{
		if (moveing)
		{
			for (i in 0...cpuStrums.members.length) cpuStrums.members[i].x = defaultStrumX[i]+ 32 * Math.sin((time*2 + i*0.25) * Math.PI);
			for (i in 0...playerStrums.members.length) playerStrums.members[i].x = defaultStrumX2[i]+ 32 * Math.sin((time*2 + i*0.25) * Math.PI);
		}
	}
	{
		if (!moveing)
		{
			for (i in 0...cpuStrums.members.length) cpuStrums.members[i].x = defaultStrumX[i];
			for (i in 0...playerStrums.members.length) playerStrums.members[i].x = defaultStrumX2[i];
		}
	}
if (nonohud)
	{
	scoreTxt.alpha = accuracyTxt.alpha = missesTxt.alpha = 0;
	strumLines.visible= iconP1.visible = iconP2.visible = false;
	}}
function postCreate() {
if (FlxG.save.data.rain) {FlxG.camera.addShader(rain);rain.data.zoom.value = [35];
	rain.data.raindropLength.value = [0.075];rain.data.opacity.value = [0.2];
	}
}
				FlxG.camera.shake(0.00625, 0.1);

			camHUD.shake(0.00125, 0.15);
function stepHit(step)
{
	switch (step)
	{
	case 384:
		if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);
			chrom.data.rOffset.value = [chromeOffset/2];
			chrom.data.gOffset.value = [0.0];
			chrom.data.bOffset.value = [chromeOffset * -1];}
		if (FlxG.save.data.vhs) {FlxG.camera.addShader(vhs);}
		if (FlxG.save.data.glitch) {FlxG.camera.addShader(glitch);camHUD.addShader(glitch);}
		FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
		glitch.data.on.value = [1.];
		camHUD.shake(0.002);
		defaultCamZoom = 0.8;
		moveing = true;
	case 640:
		moveing = false;

if (FlxG.save.data.glitch) {glitch.data.on.value = [0.];}
		defaultCamZoom = 0.55;
	case 912:
		moveing = true;
if (FlxG.save.data.glitch) {glitch.data.on.value = [1.];}
		defaultCamZoom = 0.88;
	case 1160 | 1164 | 1165 | 1166 | 1167:
		window.move(window.x + FlxG.random.int( -50, 50),window.y + FlxG.random.int( -32, 32));
	case 1424:
		moveing = false;
if (FlxG.save.data.glitch) {camHUD.removeShader(glitch);}
		FlxTween.tween(camHUD, {alpha: 0}, 2, {ease: FlxEase.circInOut});
//		case 1432:
//			FlxTween.tween(camHUD, {alpha: 0}, 2, {ease: FlxEase.circInOut});
	case 1490:
		defaultCamZoom = 1;
			//stupid
/*			dad.playAnim('hey',true);
		dad.specialAnim = true;
		dad.heyTimer = 9999;
*/	case 1552:
        nonohud = true;
		camHUD.alpha = 1;
		var budjet = new FlxSprite(0, 0);
		budjet.loadGraphic(Paths.image('ron/budjet'));
		budjet.scrollFactor.set();
		budjet.screenCenter();
		budjet.cameras = [camHUD];
		add(budjet);
		dad.visible = false;
		defaultCamZoom = 0.9;
	}
	if ((curStep >= 384) && (curStep <= 640))
		FlxG.camera.shake(0.00625, 0.1);
	
	camHUD.shake(0.00125, 0.15);
}