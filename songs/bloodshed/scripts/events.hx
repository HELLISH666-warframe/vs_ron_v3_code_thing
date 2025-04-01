playCutscenes = true;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
//var evilTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069);

/*function postCreate() {				
Estatic = new FlxSprite().loadGraphic(Paths.image('stages/deadly'));
Estatic.scrollFactor.set();
Estatic.screenCenter();
Estatic.alpha = 0;
}*/
function stepHit(curStep) {
	switch(curStep) {
		case 1:
		var snowemitter:FlxTypedEmitter = new FlxTypedEmitter(9999, 0, 300);
		snowemitter.width = FlxG.width*1.5;
		snowemitter.velocity.set(-10, 1600, 10, 2200);
		snowemitter.lifespan.set(5);
		snowemitter.y = FlxG.height;
		snowemitter.acceleration.set(-10, 1600, 10, 2200);

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

		add(snowemitter);
		snowemitter.start(false, 0.035);
		case 128:
//			evilTrail.color = FlxColor.RED;	
//			insert(members.indexOf(dad)-1, evilTrail);
	}
}