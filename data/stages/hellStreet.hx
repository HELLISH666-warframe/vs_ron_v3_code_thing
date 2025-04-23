import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import flixel.addons.display.FlxBackdrop;
importScript("data/scripts/bloodbleed-shit");
var wastedGrp:FlxTypedGroup<FlxSprite> = [];
var bloodshedGrp:FlxTypedGroup<FlxSprite> = [];
var snowemitter:FlxTypedEmitter = new FlxTypedEmitter(9999, 0, 300);
snowemitter.width = FlxG.width*1.5;
snowemitter.velocity.set(-10, -240, 10, -320);
snowemitter.lifespan.set(5);
snowemitter.y = FlxG.height;
//snowemitter.acceleration.set(-10, 1600, 10, 2200);
snowemitter.acceleration.set(-10, 1900, 10, 2200);

for (i in 0...150)
{
    var p = new FlxParticle();
    var p2 = new FlxParticle();
    var p3 = new FlxParticle();
    p.makeGraphic(12,16,FlxColor.BLACK);
    p2.makeGraphic(8,12,FlxColor.BLACK);
    p3.makeGraphic(16,20,FlxColor.BLACK);

    snowemitter.add(p);
    snowemitter.add(p2);
    snowemitter.add(p3);
}
exploders.scale.set(5.8, 5.8);
var explode:FlxSound = FlxG.sound.load(Paths.sound("hellexplode"));
function postCreate() {
    satan.scrollFactor.set(0.2, 0.4);
    satan.screenCenter();
    satan.y += 600;
    satan.x -= 100;
    satan.updateHitbox();
    hellbg.setGraphicSize(Std.int(hellbg.width * 5));
    hellbg.alpha = 0.1;
    firebg.alpha = 0;
	for(i in [satan,asdfsa,mountainsbackbl,hillfrontbl,mountainsbl,streetbl,space,earth,
		freindly,islands])
    i.visible = false;
    wbg.alpha = 0;	
    wbg.updateHitbox();
    wbg.antialiasing = true;
    wbg.screenCenter();
    wbg.scrollFactor.set(0.2, 0.05);
    add(wbg);
	freindly.scrollFactor.set(0.05, 0.05);
	freindly.screenCenter();
	freindly.updateHitbox();
    firebg.scale.set(5,3);
    firebg.scrollFactor.set();
    firebg.screenCenter();
    firebg.alpha = 0.0001;
    add(firebg);
    islands.screenCenter(FlxAxes.X);
	islands.y= 3846574875857837583;
	insert(100, snowemitter);
	snowemitter.start(false, 0.035);

	wastedGrp = new FlxTypedGroup();
	bloodshedGrp = new FlxTypedGroup();

	var cloudsbig = new FlxBackdrop(Paths.image('stages/street/ron_clouds'), FlxAxes.X, 0, 0);
	cloudsbig.scrollFactor.set(0.1,0.1);
	cloudsbig.screenCenter();
	insert(10, cloudsbig);
	wastedGrp.add(cloudsbig);
	
	FlxTween.tween(cloudsbig, {x: cloudsbig.x + 6000}, 720, {type: FlxTween.LOOPING });
	
	var cloudssmall = new FlxBackdrop(Paths.image('stages/street/ron_clouds'), FlxAxes.X, 0, 0);
	cloudssmall.scale.set(4.7,4.7);
	cloudssmall.updateHitbox();
	cloudssmall.scrollFactor.set(0.05,0.1);
	cloudssmall.screenCenter();
	cloudssmall.y -= 120;
	insert(11, cloudssmall);
	wastedGrp.add(cloudssmall);
	
	FlxTween.tween(cloudssmall, {x: cloudssmall.x + 3000}, 360, {type: FlxTween.LOOPING });
	wastedGrp.add(street);
	wastedGrp.add(witheredRa);
	wastedGrp.add(cityback);
	wastedGrp.add(cityj);
	wastedGrp.add(mountainsback);
	wastedGrp.add(mountains);
	wastedGrp.add(hillfront);

}
function stepHit(curStep)
{
   var evilTrail = null;
   if (curStep >= 128 && evilTrail == null) {
       evilTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069);
     }
    if (curStep < 1151)
        Estatic.alpha = (((2-health)/3)+0.3)/2;
    else
        Estatic.alpha = 0;
    if (curStep >= 384)
    {
        if (curStep <= 576 || ((curStep >= 896) && (curStep <= 1151)))				
			snowemitter.x = FlxG.camera.scroll.x;
			snowemitter.y = FlxG.camera.scroll.y;
    }
    else
    {
        Estatic.alpha = 0;
		snowemitter.y = 9999;
    }
    switch (curStep)
    {
		case 128:
			evilTrail.color = FlxColor.RED;
			//bye_bye_street
			wastedGrp.destroy();

			for(i in [asdfsa,mountainsbackbl,hillfrontbl,mountainsbl,streetbl,satan])
			i.visible = true;

			hellbg.alpha = 0.5;
			FlxTween.angle(satan, 0, 359.99, 0.75, { type: FlxTween.LOOPING } );
			//triggerEventNote('Change Scroll Speed', '1.3', '1');
			witheredRa.color = 0xFF660000;
		case 129:
			insert(members.indexOf(dad)-1, evilTrail);
		case 320:
			FlxTween.tween(satan, {y: satan.y - 700, angle: 359.99}, 3, {ease: FlxEase.circInOut});
		case 382:
			exploders.visible = true;
			exploders.animation.play('explosion');
			FlxG.sound.play(Paths.sound('hellexplode'), 5.7);
		case 384:
			mountainsbackbl.destroy();
			hillfrontbl.destroy();
			mountainsbl.destroy();
			streetbl.destroy();
			exploders.animation.play('explosion');
			FlxG.sound.play(Paths.sound('hellexplode'), 5.7);
			cameramoveshed = true;
			FlxTween.color(witheredRa, 1, 0xFF660000, 0xFF000000);
			FlxG.sound.play(Paths.sound('hellexplode'), 0.7);
//			triggerEventNote('Change Bars Size', '8', '1');
			FlxTween.tween(firebg, {alpha: 1}, 1, {ease: FlxEase.quadInOut});
			islands.y = boyfriend.y + 6370;
			FlxTween.tween(boyfriend, {x: boyfriend.x + 300}, 0.5, {ease: FlxEase.circOut});
			FlxTween.tween(dad, {x: dad.x - 300}, 0.5, {ease: FlxEase.circOut});
			FlxTween.tween(dad, {y: dad.y + 5600}, 23, {ease: FlxEase.circIn});
			FlxTween.tween(boyfriend, {y: boyfriend.y + 5600}, 23, {ease: FlxEase.circIn});
			FlxTween.tween(boyfriend, {angle: 359.99 * 4}, 23);
			FlxTween.angle(satan, 0, 359.99, 0.75, { type: FlxTween.LOOPING } );
			wbg.alpha = 1;
		case 576:
			islands.visible = true;
		case 894:
			FlxG.sound.play(Paths.sound('hellexplode'), 0.7);
			exploders.animation.play('explosion');
		case 896: 
			islands.visible = false;
		case 1016:
			satan.y = boyfriend.y + 2000;
			FlxTween.tween(satan, {y: boyfriend.y - 2000}, 4);
		case 1151: 
			FlxTween.angle(freindly, 0, 5, 3, { type: FlxTween.PINGPONG } );
			intensecameramoveshed = space.visible = earth.visible = freindly.visible = true;
    }
}