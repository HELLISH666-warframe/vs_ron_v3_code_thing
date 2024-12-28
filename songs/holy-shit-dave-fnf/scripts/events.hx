function postCreate(){}
override function update(elapsed:Float){}
function stepHit(curStep){
	switch(curStep){
		case 352:
			defaultCamZoom = 1;
		case 368:
			defaultCamZoom = 1.2;
		case 384:
			FlxG.camera.flash(FlxColor.WHITE, 0.2);
		case 400:
			defaultCamZoom = 1.5;
		case 448:
			defaultCamZoom = 0.9;
	}

//	if (curStep >= 384 && curStep < 400)
//		dad.playAnim('um');
//	else if (curStep >= 400 && curStep < 448)
//		dad.playAnim('err');
}