import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import openfl.display.BlendMode;
var time:Float = 0;
var fxtwo:FlxSprite;
fxtwo = new FlxSprite().loadGraphic(Paths.image('stages/effect'));
fxtwo.scale.set(1.5, 1.5);
fxtwo.updateHitbox();
fxtwo.antialiasing = true;
fxtwo.screenCenter();
fxtwo.alpha = 0.25;
fxtwo.scrollFactor.set(0, 0);
add(fxtwo);

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
var graadienter:FlxSprite;	

override function update(elapsed:Float){time += elapsed;
    rain.data.iTime.value = [-24*Math.sin(time)];}
	function create() {

		graadienter = new FlxSprite(-800,-400).loadGraphic(Paths.image('stages/nothing/ss_gradient'));
		graadienter.blend = BlendMode.ADD;
		graadienter.antialiasing = true;
		insert(6, graadienter); // this should insert the bg behind the characters
		graadienter.visible = false;
	}
function postCreate() {				
	FlxG.camera.addShader(rain);
rain.data.zoom.value = [35];
rain.data.raindropLength.value = [0.075];
rain.data.opacity.value = [0.2];
}
function stepHit(curStep){
	if (curStep % 8 == 0)
		{
			FlxTween.globalManager.completeTweensOf(graadienter);
			graadienter.y += 40;
			FlxTween.tween(graadienter, {y: graadienter.y - 40}, 0.4, {ease: FlxEase.backOut});
		}
    switch (curStep)
    {
		case 128:
			
			graadienter.visible = true;
			fxtwo.visible = false;
			bgLol.visible = false;
//			triggerEventNote('Change Bars Size', '12', '1');
		case 384:
			graadienter.alpha = 1;
			graadienter.visible = false;
		case 786:
			camGame.color = FlxColor.GRAY;
			fxtwo.visible = true;
			bgLol.visible = true;
		case 1024:
			fxtwo.visible = false;
			bgLol.visible = false;	
		case 1280:
			graadienter.alpha = 1;
			graadienter.visible = true;
//			triggerEventNote('Change Bars Size', '12', '1');
    }}