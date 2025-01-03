import openfl.system.Capabilities;

var black:FlxSprite;
var blackCam:FlxCamera;
var strumLineNotes:FlxTypedGroup<StrumNote>;


var bar1:FlxSprite = new FlxSprite(0,0).makeSolid(200, FlxG.height, FlxColor.BLACK);
var bar2:FlxSprite = new FlxSprite(FlxG.width - 200,0).makeSolid(200, FlxG.height, FlxColor.BLACK);

var tiltCam:Bool = true;

function postCreate(){

	FlxG.cameras.add(blackCam = new FlxCamera(), false);
    blackCam.bgColor = 0x00000000;

	camGame.angle = -10;

	black = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
	black.cameras = [blackCam];
	black.screenCenter(FlxAxes.XY);
	add(black);

	bar1.cameras = bar2.cameras = [camHUD];
	add(bar1);
	add(bar2);

	for (i in 0...playerStrums.members.length){
		playerStrums.members[i].x -= 325;
	}

	for(i in 0...cpuStrums.members.length){
		cpuStrums.members[i].x -= 400;
	}
}

function update(elapsed){


	for (i in 0...playerStrums.members.length)playerStrums.members[i].y = lerp(playerStrums.members[i].y, 40, 0.05);
	if (!tiltCam) camHUD.angle = lerp(camHUD.angle, 0, 0.05);
}

function stepHit(curStep)	{if (curStep == 258)
	
		for (i in 0...4)
		{
			FlxTween.tween(strumLineNotes.members[i], {x: strumLineNotes.members[i].x + 1250, angle: strumLineNotes.members[i].angle + 359}, 1, {ease: FlxEase.linear, onComplete: function(w:FlxTween)
				setDefault(i)});
		}
		for (i in 4...8)
		{
			FlxTween.tween(strumLineNotes.members[i], {x: strumLineNotes.members[i].x - 275, angle: strumLineNotes.members[i].angle}, 1, {
				ease: FlxEase.linear,
				onComplete: function(w:FlxTween) setDefault(i)
			});
		}}
function beatHit(curBeat){
	switch(curBeat){
		case 0:
			camGame.zoom += 0.5;
			FlxTween.tween(camGame, {angle: 0, zoom:defaultCamZoom}, (Conductor.crochet / 1000) * 16, {ease:FlxEase.linear});	
			FlxTween.tween(black, {alpha: 0}, (Conductor.crochet / 1000) * 16, {ease:FlxEase.linear});
		case 9:
			FlxTween.tween(bar1, {x: -200}, Conductor.crochet/250, {ease:FlxEase.circOut, onComplete: function(){
				remove(bar1);
			}});
			FlxTween.tween(bar2, {x: FlxG.width}, Conductor.crochet/250, {ease:FlxEase.circOut, onComplete: function(){
				remove(bar2);
			}});

			for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x + 325}, (Conductor.crochet/1000), {ease:FlxEase.circOut});
			for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x + 400}, (Conductor.crochet/1000), {ease:FlxEase.circOut});
		case 68:
			
			for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x + -325}, (Conductor.crochet/1000), {ease:FlxEase.circIn});
			for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x + -600}, (Conductor.crochet/1000), {ease:FlxEase.circIn});
			case 139:

			for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x + 325}, (Conductor.crochet/1000), {ease:FlxEase.circOut});
			for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x + 600}, (Conductor.crochet/1000), {ease:FlxEase.circOut});
			case 200:

			for (i in 0...playerStrums.members.length) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x + -325}, (Conductor.crochet/1000), {ease:FlxEase.circIn});
			for (i in 0...cpuStrums.members.length) FlxTween.tween(cpuStrums.members[i], {x: cpuStrums.members[i].x + -600}, (Conductor.crochet/1000), {ease:FlxEase.circIn});

	}
}


function hishader(){
	if (Options.gameplayShaders){
		camGame.addShader(shader1);
		camGame.addShader(shader2);
		camHUD.addShader(shader1);
	}
}