import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
var snowemitter:FlxTypedEmitter = new FlxTypedEmitter(FlxG.camera.scroll.x,0,300);
var baro:FlxSprite = new FlxSprite().makeSolid(150, FlxG.height*3, FlxColor.BLACK);
var bart:FlxSprite = new FlxSprite().makeSolid(150, FlxG.height*3, FlxColor.BLACK);
    
var scanlines:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stages/nothing/scanlines'));
scanlines.antialiasing = false;
scanlines.active = false;
scanlines.scrollFactor.set();
scanlines.screenCenter();
scanlines.scale.set(4,4);
FlxTween.tween(scanlines, {alpha: 0.5}, 0.5, {ease: FlxEase.circInOut, type: FlxTween.PINGPONG});

baro.x = 0;
bart.x = FlxG.width-150;
for(i in [bart,baro]){
    add(i);
    i.scrollFactor.set();
    i.camera = camHUD;
    i.visible = false;
}
function postCreate() {
    graadienter.color = FlxColor.BLACK;
    wbg.color = FlxColor.BLACK;
}
function stepHit(step)
{
    switch (step)
    {
        case 256:
		snowemitter.width = FlxG.width*1.5;
		snowemitter.velocity.set(-10, -240, 10, -320);
		snowemitter.lifespan.set(5);
		snowemitter.y = FlxG.height;
		snowemitter.acceleration.set(0, -100);

		for (i in 0...150)
		{
			var p = new FlxParticle();
			var p2 = new FlxParticle();
			p.makeGraphic(12,12,FlxColor.GRAY);
			p2.makeGraphic(24,24,FlxColor.GRAY);

			snowemitter.add(p);
			snowemitter.add(p2);
		}
        insert(7, snowemitter);
		snowemitter.start(false, 0.05);

        snowemitter.x = FlxG.camera.scroll.x -300;
        snowemitter.y = FlxG.camera.scroll.y+FlxG.height+40;

		graadienter.color = wbg.color = FlxColor.WHITE;
        case 768:
        insert(members.indexOf(graadienter), scanlines); 
        baro.visible = bart.visible = true;
        graadienter.color = FlxColor.fromRGB(224,224,224);
        wbg.color = FlxColor.fromRGB(224,224,224);
        case 1280:
        remove(scanlines);
        baro.visible = bart.visible = false;
        graadienter.color = FlxColor.fromRGB(255,255,255);
        wbg.color = FlxColor.fromRGB(255,255,255);
    }
}