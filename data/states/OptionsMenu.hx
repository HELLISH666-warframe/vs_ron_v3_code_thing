var fish:CustomShader  = new CustomShader("fisheye");
var vhs:CustomShader  = new CustomShader("vhs");
var crt:CustomShader  = new CustomShader("fake CRT");
var time:Float = 0;
var iTime:Float = 0;
override function update(elapsed:Float){time += elapsed;
	vhs.data.iTime.value = [6*Math.sin(time)];
}
function postCreate() {
	CoolUtil.loadAnimatedGraphic(members[0], Paths.image("menus/freeplay/mainbgAnimate"));
	members[0].scale.set(2,2);
	members[0].updateHitbox();
	members[0].screenCenter();
	members[0].color = FlxColor.YELLOW;
	if (FlxG.save.data.vhs) {FlxG.camera.addShader(fish);
		fish.data.MAX_POWER.value = [0.10];
		FlxG.camera.addShader(vhs);
		FlxG.camera.addShader(crt);}
}