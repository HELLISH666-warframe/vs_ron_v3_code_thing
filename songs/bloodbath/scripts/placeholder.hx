import openfl.Lib;
var cameramove:Bool = false;
var currentBeat:Float = (Conductor.songPosition / 1000)*(Conductor.bpm/60);
function popUpScore(note:Note = null):Void
{		var daRating:Rating = Conductor.judgeNote(note, noteDiff);
	var ratingNum:Int = 0;

	if (SCREWYOU)
	{
		switch(daRating.name)
		{
			// i should nerf unforgiving input its too hard
			// skill issue
			case 'shit':
				health -= 0.15*healthLoss;
			case 'bad':
				health -= 0.045*healthLoss;
			case 'good' | 'sick':
				health += 0.05*healthLoss;
		}
	}}
function postCreate(){	
	if (cameramove)
		{
			camHUD.angle = 81 * Math.sin((currentBeat/6) * Math.PI);
			FlxG.camera.angle = 2 * Math.sin((currentBeat/6) * Math.PI);
		}	
}
function stepHit(curStep){
	{
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
		case 1: defaultCamZoom = 0.9;
		case 253: defaultCamZoom = 1.2;
		case 409: defaultCamZoom = 1.1;
		case 413: defaultCamZoom = 0.95;    
		case 513: defaultCamZoom = 0.85;
		case 518: defaultCamZoom = 0.9;
		case 528: defaultCamZoom = 0.95;
		case 535: defaultCamZoom = 1;
		case 540: defaultCamZoom = 0.9;
		case 575: defaultCamZoom = 1.1;
		case 582: defaultCamZoom = 1.05;
		case 592: defaultCamZoom = 0.98;
		case 599: defaultCamZoom = 1.15;
		case 639: defaultCamZoom = 0.85;
    }
}
