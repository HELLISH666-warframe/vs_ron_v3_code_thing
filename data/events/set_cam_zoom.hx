function onEvent(_) {
	if (_.event.name == 'set_cam_zoom') {
		defaultCamZoom = Std.parseFloat(_.event.params[0]);
	}
}