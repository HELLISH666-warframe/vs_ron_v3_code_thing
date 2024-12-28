import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
var evilTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); 
var cameramove:Bool = false;
var currentBeat:Float = (1 / 1000)*(170/60);
function postCreate(){		
	evilTrail.color = FlxColor.RED;
	insert(members.indexOf(dad)-1, evilTrail);
	if (cameramove)
	{
		camHUD.angle = 11 * Math.sin((curStep % 270/10) * Math.PI);
		FlxG.camera.angle = 2 * Math.sin((curStep % 270/6) * Math.PI);
	}
	}

function stepHit(curStep){
	{
		if (curStep == 1)
		for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x - 1250, angle: cpuStrums.members[i].angle + 359}, (Conductor.crochet/1000), {ease:FlxEase.circOut});
		for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {y: cpuStrums.members[i].y + 600, angle: cpuStrums.members[i].angle + 959}, (Conductor.crochet/1000), {ease:FlxEase.circOut});
		for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x - 600, angle: cpuStrums.members[i].angle - 959}, (Conductor.crochet/1000), {ease:FlxEase.circOut});
		camHUD.angle = 11 * Math.sin((curStep % 970/10) * Math.PI);
		FlxG.camera.angle = 2 * Math.sin((curStep % 270/6) * Math.PI);
		if (curStep == 518)
		{
			//camHUD.angle = 0;
			//FlxG.camera.angle = 0;
			FlxTween.cancelTweensOf(FlxG.camera);
			FlxTween.cancelTweensOf(camHUD);
			FlxTween.tween(camHUD, {angle: Math.floor(camHUD.angle/360)*360+360}, 3, {ease: FlxEase.circOut} );
			FlxTween.tween(FlxG.camera, {angle: Math.floor(FlxG.camera.angle/360)*360+360}, 3, {ease: FlxEase.circOut} );
			windowmove = false;
			cameramove = false;
		}
		if (curStep == 768)
		{
			windowmove = true;
			cameramove = true;
		}
	}
	switch(curStep){
		case 1 | 518 | 540: defaultCamZoom = 0.9;
		case 253: defaultCamZoom = 1.2;
		case 409 | 575: defaultCamZoom = 1.1;
		case 413 | 528: defaultCamZoom = 0.95;
		case 513 | 639: defaultCamZoom = 0.85;
		case 535: defaultCamZoom = 1;
		case 582: defaultCamZoom = 1.05;
		case 592: defaultCamZoom = 0.98;
		case 599: defaultCamZoom = 1.15;
		//"n3therwordly"_did_the_redo
    }
}
