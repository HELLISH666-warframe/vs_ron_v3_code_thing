
var blackeffect:FlxSprite;

var defaultStrumY:Float = 50;
defaultStrumY = strumLine.y;

function postCreate(){				
	blackeffect = new FlxSprite().makeGraphic(FlxG.width, FlxG.width, FlxColor.BLACK);
	blackeffect.scale.set(4,4);
	blackeffect.updateHitbox();
	blackeffect.antialiasing = true;
	blackeffect.screenCenter();
	blackeffect.scrollFactor.set();
	blackeffect.alpha = 0;
	insert(21, blackeffect);
	add(blackeffect);}

function stepHit(curStep)
{
	if ((curStep >= 272) && (curStep <= 1304))
	{
		if (curStep % 8 == 0)
			for (i in 0...4){
				for (guh in [playerStrums, cpuStrums])
					 FlxTween.tween( guh.members[i], {y: defaultStrumY + 20 }, 0.65, {ease: FlxEase.backOut, 								
					onComplete: function(twn:FlxTween)
					{
						FlxTween.tween(guh.members[i], {y: guh.members[i].y = 0 }, 0.65, {ease: FlxEase.backOut});
					}
				});
}}

	if (curStep == 540 || curStep == 604 || curStep == 668 || curStep == 732 || curStep == 1304)
		FlxTween.tween(FlxG.camera, {zoom: 1.2}, 0.4, {ease: FlxEase.backOut,});
	switch (curStep) {
		case 208:
			defaultCamZoom = 0.9;
		case 264:
			defaultCamZoom = 1.1;
		case 272:
			defaultCamZoom = 0.7;
			//addShader(camGame, "bloom");
			FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
		case 540 | 668:
			dad.playAnim('hey');
		case 604 | 732:
			boyfriend.playAnim('hey');
		case 1312:
			defaultCamZoom = 0.8;
		case 1440:
			defaultCamZoom = 0.9;
		case 1568:
			FlxTween.tween(blackeffect, {alpha: 1}, 0.5, {ease: FlxEase.circInOut,});
			defaultCamZoom = 1.05;
		case 1600:
			FlxTween.tween(blackeffect, {alpha: 0}, 0.5, {ease: FlxEase.circOut,});
			defaultCamZoom = 0.8;
	}
}