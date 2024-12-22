function stepHit(step){
	switch(curStep) 
	{
	case 248:
		defaultCamZoom += 0.2;
	case 256:
		defaultCamZoom -= 0.1;
		FlxG.camera.flash(FlxColor.WHITE, 1);
	case 416:
		defaultCamZoom += 0.1;
	case 448:
		defaultCamZoom -= 0.1;
	case 480:
		defaultCamZoom += 0.1;
	case 512:
		FlxG.camera.flash(FlxColor.WHITE, 1);
		defaultCamZoom -= 0.2;
	case 888:
		defaultCamZoom += 0.3;
	case 896:
		defaultCamZoom -= 0.1;
	case 1152:
		defaultCamZoom += 0.05;
	case 1168:
		defaultCamZoom += 0.05;
	case 1184:
		defaultCamZoom -= 0.3;
	}
}