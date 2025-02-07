importScript("data/scripts/bloodbleed-shit");

function postCreate() {
	firebg.alpha = 0;
}
function stepHit(curStep){if (curSong.toLowerCase() == 'bloodbath') 
{
	if ((curStep >= 254) && (curStep <= 518))
	{
		if (fx.alpha < 0.6)
			fx.alpha += 0.05;            
		if (curStep == 256)
		{
		FlxTween.angle(satan, 0, 359.99, 1.5, { 
		ease: FlxEase.quadIn, 
		onComplete: function(twn:FlxTween) 
			{
			FlxTween.angle(satan, 0, 359.99, 0.75, { type: FlxTween.LOOPING } );
			}} );
		}
	FlxG.camera.shake(0.01, 0.1);
	camHUD.shake(0.001, 0.15);
	if ((curStep >= 768) && (curStep <= 1040))
		{
		if (fx.alpha > 0)
		fx.alpha -= 0.05;
		if (curStep == 768)
			{
			FlxTween.angle(satan, 0, 359.99, 0.75, { 
			ease: FlxEase.quadIn, 
			onComplete: function(twn:FlxTween) 
				{
				FlxTween.angle(satan, 0, 359.99, 0.35, { type: FlxTween.LOOPING } );
					}});
			}
			FlxG.camera.shake(0.015, 0.1);
			camHUD.shake(0.0015, 0.15);
			}
			else
				{
					if ((curStep == 519) || (curStep == 1041))
						FlxTween.cancelTweensOf(satan);
					if (satan.angle != 0)
						FlxTween.angle(satan, satan.angle, 359.99, 0.5, {ease: FlxEase.quadIn});
					if (fx.alpha > 0.3)
						fx.alpha -= 0.05;
				}
				Estatic.alpha = (((2-health)/3)+0.2);
			}
	
	switch(curStep) {
		case 768:
			 defaultCamZoom = 1.1;
			 FlxTween.tween(firebg, {alpha: 1}, 1, {ease: FlxEase.quadInOut});
	case 1039: defaultCamZoom = 0.85; // shit ton of code because yeah
		case 1056: windowmove = false;
	}
}
	if (curSong.toLowerCase() == 'bloodshed-classic'){
		Estatic.alpha = (((2-health)/3)+0.2);
		switch(curStep) {
			case 288:
				FlxTween.tween(firebg, {alpha: 1}, 1, {ease: FlxEase.circOut});
				FlxTween.angle(satan, 0, 359.99, 0.75, { type: FlxTween.LOOPING } );
			case 544:
				FlxG.camera.flash(FlxColor.WHITE, 1);
				FlxTween.tween(firebg, {alpha: 0}, 1, {ease: FlxEase.circOut});
				FlxTween.cancelTweensOf(satan);
				FlxTween.angle(satan, 0, satan.angle+359.99, 3, {ease: FlxEase.circOut} );
			case 928:
				FlxTween.tween(firebg, {alpha: 1}, 1, {ease: FlxEase.circOut});
				FlxTween.angle(satan, 0, 359.99, 0.75, { type: FlxTween.LOOPING } );
			case 1184:
				FlxTween.tween(firebg, {alpha: 0}, 1, {ease: FlxEase.circOut});
				FlxTween.cancelTweensOf(satan);
				FlxTween.angle(satan, 0, satan.angle+359.99, 3, {ease: FlxEase.circOut} );	
}
	}
if (curSong.toLowerCase() == 'bleeding-classic')
{
	if ((curStep >= 256) && (curStep <= 512))
	{
		if (fx.alpha < 0.6)
			fx.alpha += 0.05;			
		if (curStep == 256)
		{
			FlxTween.angle(satan, 0, 359.99, 1.5, { 
				ease: FlxEase.quadIn, 
				onComplete: function(twn:FlxTween) 
				{
					FlxTween.angle(satan, 0, 359.99, 0.75, { type: FlxTween.LOOPING } );
				}} 
			);
		}
		FlxG.camera.shake(0.01, 0.1);
		camHUD.shake(0.001, 0.15);
	}
	else if ((curStep >= 768) && (curStep <= 1296))
	{
		if (fx.alpha > 0)
			fx.alpha -= 0.05;
		if (curStep == 768)
		{
			FlxTween.angle(satan, 0, 359.99, 0.75, { 
				ease: FlxEase.quadIn, 
				onComplete: function(twn:FlxTween) 
				{
					FlxTween.angle(satan, 0, 359.99, 0.35, { type: FlxTween.LOOPING } );
				}} 
			);
		}
		FlxG.camera.shake(0.015, 0.1);
		camHUD.shake(0.0015, 0.15);
	}
	else
	{
		if ((curStep == 1297) || (curStep == 614))
			FlxTween.cancelTweensOf(satan);
		if (satan.angle != 0)
			FlxTween.angle(satan, satan.angle, 359.99, 0.5, {ease: FlxEase.quadIn});
		if (fx.alpha > 0.3)
			fx.alpha -= 0.05;
	}
	Estatic.alpha = (((2-health)/3)+0.2);
}}