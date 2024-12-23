var fx:FlxSprite;
var Estatic:FlxSprite;

fx = new FlxSprite().loadGraphic(Paths.image('stages/effect'));
fx.setGraphicSize(Std.int(2560 * 1)); // i dont know why but this gets smol if i make it the same size as the kade ver
fx.updateHitbox();
fx.antialiasing = true;
fx.screenCenter();
fx.scrollFactor.set(0, 0);
fx.alpha = 0.3;

Estatic = new FlxSprite().loadGraphic(Paths.image('stages/deadly'));
Estatic.scrollFactor.set();
Estatic.screenCenter();
Estatic.alpha = 0;
function postCreate() {
	firebg.alpha = 0;

	add(fx);
	add(Estatic);
	FlxTween.tween(Estatic, {"scale.x":1.2,"scale.y":1.2}, Conductor.crochet / 1000, {ease: FlxEase.quadInOut, type: FlxTween.PINGPONG});
}
function stepHit(curStep)if (curSong.toLowerCase() == 'bloodbath') 
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
	
	switch(curStep) {
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
		case 768:
			 defaultCamZoom = 1.1;
			 FlxTween.tween(firebg, {alpha: 1}, 1, {ease: FlxEase.quadInOut});
	case 1039: defaultCamZoom = 0.85; // shit ton of code because yeah
		case 1056: windowmove = false;
	}
	if (curSong.toLowerCase() == 'bloodshed-classic')
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
if (curSong.toLowerCase() == 'bleeding-classic')
	switch(curStep) {
		case 384:
			defaultCamZoom += 0.15;
		case 512:
			SCREWYOU = false;
			if (!ClientPrefs.gameplaySettings['botplay'])
				botplayTxt.visible = false;
			var xx = dad.x;
			var yy = dad.y;
			triggerEventNote('Change Character', 'dad', 'hellron');
			resetTrail();
			//dad.x = xx+80;
			//dad.y = yy+200;
			defaultCamZoom -= 0.25;
		case 664:
			defaultCamZoom += 0.3;
		case 672:
			defaultCamZoom -= 0.3;
		case 768:
			SCREWYOU = true;
			botplayTxt.visible = true;
			if (!ClientPrefs.gameplaySettings['botplay'])
				botplayTxt.text = "UNFORGIVING INPUT ENABLED!";
			var xx = dad.x;
			var yy = dad.y;
			triggerEventNote('Change Character', 'dad', 'dripronclassic');
			resetTrail();
			//dad.x = xx-80;
			//dad.y = yy-200;
			FlxTween.tween(firebg, {alpha: 1}, 1, {ease: FlxEase.quadInOut});
			defaultCamZoom += 0.1;
		case 832:
			defaultCamZoom += 0.1;
		case 896:
			defaultCamZoom += 0.1;
		case 1024:
			defaultCamZoom += 0.1;
		case 1040:
			defaultCamZoom -= 0.2;
		case 1168:
			defaultCamZoom -= 0.1;
		case 1296:
			defaultCamZoom -= 0.1;
			SCREWYOU = false;
			if (!ClientPrefs.gameplaySettings['botplay'])
				botplayTxt.visible = false;
	}
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
					FlxTween.angle(satan, 0, 359.99, 0.75, { type: FlxTween.PINGPONG } );
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
					FlxTween.angle(satan, 0, 359.99, 0.35, { type: FlxTween.PINGPONG } );
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
}