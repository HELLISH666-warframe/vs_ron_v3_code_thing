function onEvent(_) {
	var value1:String = _.event.params[0];
	var value2:String = _.event.params[1];
	var flValue1:Null<Float> = Std.parseFloat(value1);
	var flValue2:Null<Float> = Std.parseFloat(value2);
	if (_.event.name == 'add_cam_zoom') {
		if (Math.isNaN(flValue1)) flValue1 = null;
		if (Math.isNaN(flValue2)) flValue2 = null;
		if (flValue1 == null) flValue1=0.015;
		if (flValue2 == null) flValue2=0.03;

		FlxG.camera.zoom += flValue1;
		camHUD.zoom += flValue2;
		trace(defaultCamZoom);
		trace(camHUD.zoom+'HUDDDDD');
	}
}