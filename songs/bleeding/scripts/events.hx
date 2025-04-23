import flixel.addons.effects.FlxTrail;
import flixel.effects.particles.FlxTypedEmitter;
import openfl.display.BlendMode;
importScript("data/scripts/bloodbleed-shit");
var time:Float = 0;
var glitch:CustomShader = new CustomShader("glitchsmh");
var bleed:CustomShader = new CustomShader("bleedingvhs");
var vhs:CustomShader = new CustomShader("vhs");
var bloodshedTrail = null;
var rain:flixel.effects.particles.FlxTypedEmitter;
rain = new FlxTypedEmitter(-1280,0, 1280);
rain.loadParticles(Paths.image("stages/raindrop"),500);
rain.scale.set(0.5, 0.5, 1, 1);
rain.lifespan.set(0);
rain.velocity.set(-20, 400,20,800);
rain.keepScaleRatio = true;
rain.width = 1280*4;
rain.start(false, 0.01);
var rain:CustomShader  = new CustomShader("rain");
exploders.scale.set(3.8, 3.8);
function postCreate() {
    evilbar();
    if (FlxG.save.data.rain) {camGame.addShader(rain);
	rain.data.zoom.value = [40];
	rain.data.raindropLength.value = [0.1];
	rain.data.opacity.value = [0.25];
	}
}
override function update(elapsed:Float){time += elapsed;
    glitch.data.iTime.value = bleed.data.iTime.value = rain.data.iTime.value = vhs.data.iTime.value = [time];
}
function stepHit(curStep){
    switch (curStep)
    {
        case 256:
		for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 300, angle: playerStrums.members[i].angle}, 1, {ease: FlxEase.linear});
		for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x - 1250, angle: cpuStrums.members[i].angle + 359}, 1, {ease: FlxEase.linear});
        case 384:
        Estatic.alpha=1;
        FlxTween.tween(Estatic, {"scale.x":1.2,"scale.y":1.2}, Conductor.crochet / 1000, {ease: FlxEase.quadInOut, type: FlxTween.PINGPONG});
        camGame.flash(FlxColor.WHITE, 1);
		if (FlxG.save.data.glitch) {camGame.addShader(glitch);glitch.data.on.value = [1.];}
		if (FlxG.save.data.vhs) {camHUD.addShader(vhs);}
		if (FlxG.save.data.chrom) {camGame.addShader(chrom);camHUD.addShader(chrom);
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

        explode();
        
        exploders.visible = cameramovebleed = true;
        FlxTween.tween(gf, {y: gf.y + 800, angle: 45}, 1, {ease: FlxEase.quadIn});
        healthBar.setGraphicSize(800,Std.int(healthBar.height));
		healthBar.updateHitbox();
        case 640:
        cameramovebleed = gf.visible = false;
		FlxTween.tween(camHUD, {angle: Math.floor(camHUD.angle/360)*360}, 0.8, {ease: FlxEase.expoOut});
        case 1408:
        explode();
        cameramovebleed = true;
        case 1664:	
		//triggerEventNote('Change Scroll Speed', '1.45', '1');
		camGame.flash(FlxColor.WHITE, 1);
		cameramovebleed = false;
		intensecameramovebleed = true;
		if (FlxG.save.data.vhs)camHUD.removeShader(vhs);
		if (FlxG.save.data.vhs)camHUD.addShader(bleed);
		Estatic.color = FlxColor.BLACK;
		Estatic.blend = BlendMode.NORMAL;
		defaultCamZoom -= 0.1;
		FlxTween.tween(dad, {y: dad.y + 25}, 1, {ease: FlxEase.circInOut, type: FlxTween.PINGPONG});
		FlxTween.tween(boyfriend, {y: boyfriend.y + 25}, 1, {ease: FlxEase.circInOut, type: FlxTween.PINGPONG});
        case 1920:
        Estatic.color = FlxColor.RED;
		//triggerEventNote('Change Scroll Speed', '1.2', '1');
        if (FlxG.save.data.vhs)camHUD.removeShader(bleed);
		camGame.flash(FlxColor.WHITE, 1);
		defaultCamZoom += 0.1;
    }
}
function explode(){
    exploders.animation.play('explosion');
    FlxG.sound.play(Paths.sound('hellexplode'), 0.7);
}