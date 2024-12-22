function beatHit() 
{
for (i=>cam in [camHUD, camGame]) {
	FlxTween.cancelTweensOf(cam);
	var offset = 1;
	cam.angle = curBeat % 2 == 0 ? -3 + (offset * 0.5) : 3 - (offset * 0.5);
	cam.zoom += 0.05;
	camHUD.x = curBeat % 2 == 0 ? 10 - (20 * offset) : -10 + (20 * offset);
	FlxTween.tween(cam, {angle: 0}, Conductor.crochet / 1000, {ease: FlxEase.circOut});
	}
}