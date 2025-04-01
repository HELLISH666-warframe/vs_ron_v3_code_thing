//fuck_you_im_Doing_all_the_events_in_stage
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import openfl.display.BlendMode;
importScript("data/scripts/bloodbleed-shit");
var explode:FlxSound;
var time:Float = 0;
var exploders:FlxSprite = new FlxSprite();
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var wig:CustomShader  = new CustomShader("glitchsmh");
var bleed:CustomShader  = new CustomShader("bleedingvhs");
var vhs:CustomShader  = new CustomShader("vhs");
var bloodshedTrail = null;
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
var rain:CustomShader  = new CustomShader("rain");
explode = FlxG.sound.load(Paths.sound("hellexplode"));

var exploders:FlxSprite = new FlxSprite();
exploders.frames = Paths.getFrames("stages/hellStreet/explosion");
exploders.animation.addByPrefix("explosion", "explosion",  24, false);
exploders.scale.set(3.8, 3.8);
exploders.scrollFactor.set(0, 0);
exploders.screenCenter();

var wastedGrp:FlxTypedGroup<Dynamic>;

override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
	wig.data.iTime.value = [0.005*Math.sin(time)];
    bleed.data.iTime.value = [1*Math.sin(time)];
	vhs.data.iTime.value = [1*Math.sin(time)];
    rain.data.iTime.value = [-24*Math.sin(time)];
}
function postCreate() {
	hellbg.setGraphicSize(Std.int(hellbg.width * 5));
	hellbg.y += hellbg.height / 5;
    satan.setGraphicSize(Std.int(satan.width * 1.2));
	satan.scrollFactor.set(0.2, 0.4);
	satan.screenCenter();
	satan.updateHitbox();
    blackeffect = new FlxSprite().makeGraphic(FlxG.width*3, FlxG.width*3, FlxColor.BLACK);
    blackeffect.updateHitbox();
    blackeffect.antialiasing = true;
    blackeffect.screenCenter();
    blackeffect.scrollFactor.set();
    add(blackeffect);
    
	exploders.visible = false;
	add(exploders);

	hellbg.alpha = 	satan.alpha = firebg.alpha = blackeffect.alpha = 0;
    islands.visible = false;

	if (FlxG.save.data.rain) {FlxG.camera.addShader(rain);
	rain.data.zoom.value = [40];
	rain.data.raindropLength.value = [0.1];
	rain.data.opacity.value = [0.25];
	}
}
function stepHit(curStep)
{
	{
		if (curStep == 256)
		{
			for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 300, angle: playerStrums.members[i].angle}, 1, {ease: FlxEase.linear});
			for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x - 1250, angle: cpuStrums.members[i].angle + 359}, 1, {ease: FlxEase.linear});
		}
	}
	if (curStep == 384)
	{
		wbg.alpha = 0.66;
		add(Estatic);
		satan.alpha = hellbg.alpha	= firebg.alpha =  Estatic.alpha = 1;
        //bye_bye_street
        //sky.visible = false;
		city.destroy();
		mountains.destroy();
		street.destroy();
		FlxTween.tween(Estatic, {"scale.x":1.2,"scale.y":1.2}, Conductor.crochet / 1000, {ease: FlxEase.quadInOut, type: FlxTween.PINGPONG});
		camGame.flash(FlxColor.WHITE, 1);
		//addShader(FlxG.camera,"glitchsmh");
		//Shaders["glitchsmh"].shader.data.on.value = [1.];
		if (FlxG.save.data.glitch) {FlxG.camera.addShader(wig);
			camHUD.addShader(wig);wig.data.on.value = [1.];}
		//bloodshedGrp.visible = false;
		blackeffect.visible = false;
		satan.color = FlxColor.BLACK;
		firebg.screenCenter();	
			
		//addShader(camHUD, "vhs");
		if (FlxG.save.data.vhs) {camHUD.addShader(vhs);}
		//addShader(FlxG.camera, "chromatic aberration");
		if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);camHUD.addShader(chrom);
			chrom.data.rOffset.value = [chromeOffset*Math.sin(curStep*4)/2];
			chrom.data.bOffset.value = [chromeOffset*Math.sin(curStep*4) * -1/2];}
		remove(bloodshedTrail);
        bloodshedTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
        insert(members.indexOf(dad)-1, bloodshedTrail);
        dad.y -= 230;
		dad.x -= 230;
//		dad.y -= 530;
//		dad.x -= 990;
		boyfriend.y -= 230;
		boyfriend.x += 300;

		FlxTween.angle(satan, 0, 359.99, 1.5, 
			{ 
			ease: FlxEase.quadIn, 
			onComplete: function(twn:FlxTween) 
				{
					FlxTween.angle(satan, 0, 359.99, 0.75, { type: FlxTween.LOOPING } );
				}
			});
				
		FlxG.sound.play(Paths.sound('hellexplode'), 0.7);

		exploders.visible = true;
		exploders.animation.play('explosion');
				
		//bgLol.visible = false;
		islands.visible = true;
		cameramovebleed = true;
				
		FlxTween.tween(satan, {y: gf.y - 500}, 1, {ease: FlxEase.backInOut});
		FlxTween.tween(gf, {y: gf.y + 800, angle: 45}, 1, {ease: FlxEase.quadIn});
		healthBar.setGraphicSize(800,Std.int(healthBar.height));
		healthBar.updateHitbox();
	}
	if (curStep == 640)
	{
		gf.visible = false;
		cameramovebleed = false;
		FlxTween.tween(camHUD, {angle: Math.floor(camHUD.angle/360)*360}, 0.8, {ease: FlxEase.expoOut});
	}
	//BULLSHIT
	if (curStep == 1408)
	{
		FlxG.sound.play(Paths.sound('hellexplode'), 0.7);
			
		cameramovebleed = true;
		wbg.alpha = 0;
			
		FlxTween.globalManager.completeTweensOf(satan);
		FlxTween.angle(satan, 0, 359.99, 0.33, { type: FlxTween.LOOPING } );
		exploders.animation.play('explosion');
	}
	if (curStep == 1664)
	{		
		//triggerEventNote('Change Scroll Speed', '1.45', '1');
		camGame.flash(FlxColor.WHITE, 1);
		cameramovebleed = false;
		intensecameramovebleed = true;
		if (FlxG.save.data.vhs) {camHUD.removeShader(vhs);}
		if (FlxG.save.data.vhs) {camHUD.addShader(bleed);}
		Estatic.color = FlxColor.BLACK;
		Estatic.blend = BlendMode.NORMAL;
		defaultCamZoom -= 0.1;
		FlxTween.tween(islands, {y: islands.y + 25}, 1, {ease: FlxEase.circInOut, type: FlxTween.PINGPONG});
		FlxTween.tween(dad, {y: dad.y + 25}, 1, {ease: FlxEase.circInOut, type: FlxTween.PINGPONG});
		FlxTween.tween(boyfriend, {y: boyfriend.y + 25}, 1, {ease: FlxEase.circInOut, type: FlxTween.PINGPONG});
	}
	if (curStep == 1920)
	{
		Estatic.color = FlxColor.RED;
		satan.color = FlxColor.WHITE;
		//clearShader(camHUD);
		//triggerEventNote('Change Scroll Speed', '1.2', '1');
		camGame.flash(FlxColor.WHITE, 1);
		FlxTween.tween(hellbg, {alpha: 0}, 1, {ease: FlxEase.circInOut});
		FlxTween.tween(firebg, {alpha: 0}, 1, {ease: FlxEase.circInOut});
		FlxTween.cancelTweensOf(satan);
		FlxTween.angle(satan, satan.angle, 359.99, 0.5, {ease: FlxEase.quadIn});
		defaultCamZoom += 0.1;
	}
	if (curStep > 384)
	{
		if (FlxG.save.data.chrom) {
		chrom.data.rOffset.value = [chromeOffset*Math.sin(curStep*4)/2];
		chrom.data.gOffset.value = [0.0];
		chrom.data.bOffset.value = [chromeOffset*Math.sin(curStep*4) * -1/2];}
	}
}
function destroy() {
	wbg.destroy();
	hellbg.destroy();
	city.destroy();
	mountains.destroy();
	firebg.destroy();
	satan.destroy();
	street.destroy();
	islands.destroy();
}