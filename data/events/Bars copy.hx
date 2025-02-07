function onEvent(_) {
	if (_.event.name == 'Bars copy'){
		var value0 = _.event.params[1];
		var value1 = _.event.params[2];
	if (value0 != "regular" && value0 != "custom" && value0 != "") {
		// bloodshed legacy redux zooms. they r fucked up for some reason
		value1 = value0.split(",")[1] + "," + value0.split(",")[2] + "," + value1;
		value0 = "custom";
	}
	defaultCamZoom = Std.parseFloat(value1);
	FlxTween.tween(camGame.zoom, {zoom: Std.parseFloat(value1.split(',')[0])}, Std.parseFloat(value1.split(',')[1]), {ease:
	switch(value1.split(',')[2]) {
		case 'backin': FlxEase.backIn;
		case 'backinout': FlxEase.backInOut;
		case 'backout': FlxEase.backOut;
		case 'bouncein': FlxEase.bounceIn;
		case 'bounceinout': FlxEase.bounceInOut;
		case 'bounceout': FlxEase.bounceOut;
		case 'circin': FlxEase.circIn;
		case 'circinout': FlxEase.circInOut;
		case 'circout': FlxEase.circOut;
		case 'cubein': FlxEase.cubeIn;
		case 'cubeinout': FlxEase.cubeInOut;
		case 'cubeout': FlxEase.cubeOut;
		case 'elasticin': FlxEase.elasticIn;
		case 'elasticinout': FlxEase.elasticInOut;
		case 'elasticout': FlxEase.elasticOut;
		case 'expoin': FlxEase.expoIn;
		case 'expoinout': FlxEase.expoInOut;
		case 'expoout': FlxEase.expoOut;
		case 'quadin': FlxEase.quadIn;
		case 'quadinout': FlxEase.quadInOut;
		case 'quadout': FlxEase.quadOut;
		case 'quartin': FlxEase.quartIn;
		case 'quartinout': FlxEase.quartInOut;
		case 'quartout': FlxEase.quartOut;
		case 'quintin': FlxEase.quintIn;
		case 'quintinout': FlxEase.quintInOut;
		case 'quintout': FlxEase.quintOut;
		case 'sinein': FlxEase.sineIn;
		case 'sineinout': FlxEase.sineInOut;
		case 'sineout': FlxEase.sineOut;
		case 'smoothstepin': FlxEase.smoothStepIn;
		case 'smoothstepinout': FlxEase.smoothStepInOut;
		case 'smoothstepout': FlxEase.smoothStepInOut;
		case 'smootherstepin': FlxEase.smootherStepIn;
		case 'smootherstepinout': FlxEase.smootherStepInOut;
		case 'smootherstepout': FlxEase.smootherStepOut;
		case _: FlxEase.linear;
	}});}}