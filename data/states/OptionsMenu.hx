var crt:CustomShader  = new CustomShader("fake CRT");
function postCreate() {
	CoolUtil.loadAnimatedGraphic(members[0], Paths.image("menus/freeplay/mainbgAnimate"));
	members[0].scale.set(2,2);
	members[0].updateHitbox();
	members[0].screenCenter();
	members[0].color = FlxColor.YELLOW;
	if (FlxG.save.data.crt) {FlxG.camera.addShader(crt);}
}