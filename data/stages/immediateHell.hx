import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import openfl.display.BlendMode;
var fx:FlxSprite;
var Estatic:FlxSprite;
var explode:FlxSound;
var time:Float = 0;
var iTime:Float = 0;
var exploders:FlxSprite = new FlxSprite();
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var wig:CustomShader  = new CustomShader("glitchsmh");
var vhs:CustomShader  = new CustomShader("bleedingvhs");
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

fx = new FlxSprite().loadGraphic(Paths.image('stages/effect'));
fx.setGraphicSize(Std.int(2560 * 1)); // i dont know why but this gets smol if i make it the same size as the kade ver
fx.updateHitbox();
fx.antialiasing = true;
fx.screenCenter();
fx.scrollFactor.set(0, 0);
fx.alpha = 0.3;

Estatic = new FlxSprite().loadGraphic(Paths.image('stages/deadly'));
Estatic.scrollFactor.set();
Estatic.screenCenter();
Estatic.alpha = 0;
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.005*Math.sin(time)];
	chrom.data.bOffset.value = [-0.005*Math.sin(time)];
	wig.data.iTime.value = [0.005*Math.sin(time)];
    vhs.data.iTime.value = [1*Math.sin(time)];
    rain.data.iTime.value = [-24*Math.sin(time)];
}
function postCreate() {
    satan.setGraphicSize(Std.int(satan.width * 1.2));
    blackeffect = new FlxSprite().makeGraphic(FlxG.width*3, FlxG.width*3, FlxColor.BLACK);
    blackeffect.updateHitbox();
    blackeffect.antialiasing = true;
    blackeffect.screenCenter();
    blackeffect.scrollFactor.set();
    blackeffect.alpha = 0;
    add(blackeffect);
    
    var exploders:FlxSprite = new FlxSprite();
    exploders.cameras = [camHUD];
    exploders.frames = Paths.getSparrowAtlas('stages/hellStreet/explosion');
    exploders.scrollFactor.set(0, 0);
    exploders.animation.addByPrefix('explosion', 'explosion', 24, false);
    exploders.updateHitbox();
    exploders.screenCenter();
    insert(0,exploders);
    exploders.animation.play('explosion');
    exploders.scale.set(0.01,0.01);
    exploders.alpha = 0.01;

    firebg.alpha = 0;
    islands.visible = false;
	bloodshed_lamp.visible = false;

    FlxG.camera.addShader(rain);
    rain.data.zoom.value = [40];
    rain.data.raindropLength.value = [0.1];
    rain.data.opacity.value = [0.25];
}
function stepHit(curStep)
    {
		{
//			if (curStep == 256)
//			{
//				for (i in 0...4)
//				{
//					FlxTween.tween(strumLineNotes.members[i], {x: strumLineNotes.members[i].x - 1250, angle: strumLineNotes.members[i].angle + 359}, 1, {ease: FlxEase.linear, onComplete: function(w:FlxTween)
//						setDefault(i)});
//				}
//				for (i in 4...8)
//				{
//					FlxTween.tween(strumLineNotes.members[i], {x: strumLineNotes.members[i].x - 300, angle: strumLineNotes.members[i].angle}, 1, {
//						ease: FlxEase.linear,
//						onComplete: function(w:FlxTween) setDefault(i)
//					});
//				}
//			}
			if (curStep == 384)
			{
				sky.alpha = 0.66;
				add(Estatic);
				Estatic.alpha = 1;
                //bye_bye_street
                //sky.visible = false;
                city.visible = false;
                mountains.visible = false;
                street.visible = false;
				FlxTween.tween(Estatic, {"scale.x":1.2,"scale.y":1.2}, Conductor.crochet / 1000, {ease: FlxEase.quadInOut, type: FlxTween.PINGPONG});
				camGame.flash(FlxColor.WHITE, 1);
				//addShader(FlxG.camera,"glitchsmh");
				//Shaders["glitchsmh"].shader.data.on.value = [1.];
                FlxG.camera.addShader(wig);
                camHUD.addShader(wig);
                wig.data.on.value = [1.];
				//bloodshedGrp.visible = false;
				blackeffect.visible = false;
				satan.color = FlxColor.BLACK;
				firebg.alpha = 1;
				firebg.screenCenter();
				
				//addShader(camHUD, "vhs");
                camHUD.addShader(vhs);
				//addShader(FlxG.camera, "chromatic aberration");
                FlxG.camera.addShader(chrom);
                camHUD.addShader(chrom);
				chrom.data.rOffset.value = [1*Math.sin(curStep*4)/2];
				chrom.data.gOffset.value = [0.0];
				chrom.data.bOffset.value = [1*Math.sin(curStep*4) * -1/2];
				remove(bloodshedTrail);
                bloodshedTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
                insert(members.indexOf(dad)-1, bloodshedTrail);
                //dad.y -= 230;
				//dad.x -= 230;
				dad.y -= 530;
				dad.x -= 990;
				boyfriend.y -= 230;
				boyfriend.x += 300;

				FlxTween.angle(satan, 0, 359.99, 1.5, { 
					ease: FlxEase.quadIn, 
					onComplete: function(twn:FlxTween) 
					{
						FlxTween.angle(satan, 0, 359.99, 0.75, { type: FlxTween.LOOPING } );
					}} 
				);
				
				FlxG.sound.play(Paths.sound('hellexplode'), 0.7);
				
				exploders.animation.play('explosion');
				exploders.scale.set(2,2);
				exploders.alpha = 1;
				exploders.screenCenter();
				
				//bgLol.visible = false;
				islands.visible = true;
				cameramove = true;
				
				FlxTween.tween(satan, {y: gf.y - 500}, 1, {ease: FlxEase.backInOut});
				FlxTween.tween(gf, {y: gf.y + 800, angle: 45}, 1, {ease: FlxEase.quadIn});
				healthBar.setGraphicSize(800,Std.int(healthBar.height));
				healthBar.updateHitbox();
			}
			if (curStep == 640)
			{
				gf.visible = false;
				//cameramove = false;
			}
			//BULLSHIT
			if (curStep == 1408)
			{
				FlxG.sound.play(Paths.sound('hellexplode'), 0.7);
				
				cameramove = true;
				//wbg.alpha = 0;
				
				FlxTween.globalManager.completeTweensOf(satan);
				FlxTween.angle(satan, 0, 359.99, 0.33, { type: FlxTween.LOOPING } );
				exploders.animation.play('explosion');
				exploders.scale.set(2,2);
				exploders.alpha = 1;
				exploders.screenCenter();
			}
			if (curStep == 1664)
			{		
				//triggerEventNote('Change Scroll Speed', '1.45', '1');
				camGame.flash(FlxColor.WHITE, 1);
				cameramove = false;
				intensecameramove = true;
				//clearShader(camHUD);
				//addShader(camHUD, "bleedingvhs");
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
				chrom.data.rOffset.value = [1*Math.sin(curStep*4)/2];
				chrom.data.gOffset.value = [0.0];
				chrom.data.bOffset.value = [1*Math.sin(curStep*4) * -1/2];
			}
		}
    }