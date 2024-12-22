if (false) {
	var shader = new CustomShader("motion-blur");
	function create() {
		FlxG.camera.addShader(shader);
		shader.Direction = [5.0, 1.0];
	}
	var camDir = FlxPoint.get(0,0);
	var intensitylerp = 0.0;
	function update() {
		shader.iTime = Conductor.songPosition / 1000;
		if (camDir.x != FlxG.camera.scroll.x || camDir.y != FlxG.camera.scroll.y) {
			shader.Direction = [FlxG.camera.scroll.x-camDir.x, FlxG.camera.scroll.y-camDir.y];
			intensitylerp = lerp(intensitylerp, Math.abs((FlxG.camera.scroll.x - camDir.x) / 40), 0.5);
			shader.Intensity = intensitylerp;
			camDir = FlxPoint.get(FlxG.camera.scroll.x, FlxG.camera.scroll.y);
		}
	}
}
