import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
lossSFXName = 'gdDeath';
retrySFX = 'gdLive';
var enterSound:FlxSound = FlxG.sound.load(Paths.sound("gdDeath"));
function postCreate() {
	character.visible = false;
	var emitter:FlxTypedEmitter = new FlxTypedEmitter(character.x + 190, character.y + 550);
	for (i in 0 ... 32)
		{
			var p = new FlxParticle();
			var bSize = FlxG.random.int(8,20);
			p.makeGraphic(bSize, bSize, 0xFFFFFFFF);
			p.exists = false;
			//p.alphaRange = new FlxRange(1.0, 0.0);
			emitter.add(p);
		}
		
		FlxTween.tween(FlxG.camera, {alpha: 0}, 2, {ease: FlxEase.linear});
		
		emitter.velocity.set(-32, 32, 32, -32);
		emitter.lifespan.set(3);
		add(emitter);
		emitter.start(true, 1, 0);}