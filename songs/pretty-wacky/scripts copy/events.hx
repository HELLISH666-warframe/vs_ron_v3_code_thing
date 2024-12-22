import openfl.system.Capabilities;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import gameassets.Note;

var black:FlxSprite;
var blackCam:FlxCamera;

var bar1:FlxSprite = new FlxSprite(0,0).makeSolid(200, FlxG.height, FlxColor.BLACK);
var bar2:FlxSprite = new FlxSprite(FlxG.width - 200,0).makeSolid(200, FlxG.height, FlxColor.BLACK);

var bloom:CustomShader = new CustomShader("mosaic");
var tiltCam:Bool = true;


function postCreate(){

	FlxG.cameras.add(blackCam = new FlxCamera(), false);
    blackCam.bgColor = 0x00000000;

	camGame.angle = -0;

	black = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);

	bar1.cameras = bar2.cameras = [camHUD];
}

function update(elapsed){


	for (i in 0...playerStrums.members.length)playerStrums.members[i].y = lerp(playerStrums.members[i].y, 40, 0.05);
	if (!tiltCam) camHUD.angle = lerp(camHUD.angle, 0, 0.05);
}

function beatHit(curBeat){
	if(tiltCam){
		if (curBeat % 2 == 0) camHUD.angle = 1 else camHUD.angle = -1;
	}

{

	switch(curBeat){
		case 0:
			camGame.zoom += 0.5;
			FlxTween.tween(camGame, {angle: 0, zoom:defaultCamZoom}, (Conductor.crochet / 1000) * 16, {ease:FlxEase.linear});
			FlxTween.tween(black, {alpha: 0}, (Conductor.crochet / 1000) * 16, {ease:FlxEase.linear});
		case 9:
			FlxTween.tween(bar1, {x: -200}, Conductor.crochet/850, {ease:FlxEase.circOut, onComplete: function(){
				remove(bar1);
			}});
			FlxTween.tween(bar2, {x: FlxG.width}, Conductor.crochet/850, {ease:FlxEase.circOut, onComplete: function(){
				remove(bar2);

			}});
		case 73:
		var snowemitter:FlxTypedEmitter = new FlxTypedEmitter();
		snowemitter.width = FlxG.width*1.5;
		snowemitter.velocity.set(-10, -240, 10, -320);
		snowemitter.lifespan.set(5);
		snowemitter.y = FlxG.height;

		for (i in 0...150)
		{
			var p = new FlxParticle();
			var p2 = new FlxParticle();
			p.makeGraphic(12,12,FlxColor.GRAY);
			p2.makeGraphic(24,24,FlxColor.GRAY);

			snowemitter.add(p);
			snowemitter.add(p2);
		}

		add(snowemitter);
		snowemitter.start(false, 0.05);
		case 220:
			FlxTween.tween(bar1, {x: 1080}, Conductor.crochet/650, {ease:FlxEase.circIn, onComplete: function(){
				add(bar1);
			}});
			FlxTween.tween(bar2, {x: 0}, Conductor.crochet/650, {ease:FlxEase.circIn, onComplete: function(){
				add(bar2);
			}});

			for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x + -100}, (Conductor.crochet/1000), {ease:FlxEase.circIn});
			for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x + 100}, (Conductor.crochet/1000), {ease:FlxEase.circIn});
					camGame.addShader(bloom);
			case 369:
			camGame.removeShader(bloom);
			FlxTween.tween(bar1, {x: -200}, Conductor.crochet/850, {ease:FlxEase.circOut, onComplete: function(){
				remove(bar1);
			}});
			FlxTween.tween(bar2, {x: FlxG.width}, Conductor.crochet/850, {ease:FlxEase.circOut, onComplete: function(){
				remove(bar2);
			}});

			for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x + 170}, (Conductor.crochet/1000), {ease:FlxEase.circOut});
			for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x + -130}, (Conductor.crochet/1000), {ease:FlxEase.circOut});

	}
}


function hishader(){
	if (Options.gameplayShaders){
		camGame.addShader(shader1);
		camGame.addShader(shader2);
		camHUD.addShader(shader1);
	}
}
}
