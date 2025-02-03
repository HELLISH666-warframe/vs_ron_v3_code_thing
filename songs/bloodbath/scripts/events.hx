import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
importScript("data/scripts/bloodbleed-shit");
var time:Float = 0;
var evilTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); 
function postCreate(){		
	evilTrail.color = FlxColor.RED;
	insert(members.indexOf(dad)-1, evilTrail);
	}
override function update(elapsed:Float){time += elapsed;
//	iconP2.alpha = (2-(health)-0.25)/2+0.2;
//	iconP1.alpha = (health-0.25)/2+0.2;
iconP2.alpha = (2-(health)-0.15)/1+0.2;
iconP1.alpha = (health-0.15)/1+0.2;
}
function stepHit(curStep){
	{
	if (curStep == 258)
		{
			windowmovebath = true;
			for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 300, angle: playerStrums.members[i].angle}, 1,  {ease: FlxEase.linear});
			for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x + 1250, angle: cpuStrums.members[i].angle + 359}, 1, {ease: FlxEase.linear});
			cameramovebath = true;
		}
		if (curStep == 518)
		{
			FlxG.camera.angle = 0;
			FlxTween.cancelTweensOf(FlxG.camera);
			FlxTween.tween(camHUD, {angle: Math.floor(camHUD.angle/360)*360}, 0.8, {ease: FlxEase.expoOut});
//			FlxTween.tween(camHUD, {angle: Math.floor(camHUD.angle/360)*360+360}, 3, {ease: FlxEase.circOut} );
//			FlxTween.tween(FlxG.camera, {angle: Math.floor(FlxG.camera.angle/360)*360+360}, 3, {ease: FlxEase.circOut} );
windowmovebath = false;
cameramovebath = false;
		}
		if (curStep == 768)
		{
			windowmovebath = true;
			cameramovebath = true;
		}
	}
	iconP2.alpha = (2-(health)-0.25)/2+0.2;
	iconP1.alpha = (health-0.25)/2+0.2;
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