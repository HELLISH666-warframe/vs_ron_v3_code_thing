public var bar1:FlxSprite = new FlxSprite(0, -560).makeSolid(1600 * 2, 560, 0xFF000000);
public var bar2:FlxSprite = new FlxSprite(0, 720).makeSolid(1600 * 2, 560, 0xFF000000);
public var camOther:HudCamera;
function postCreate() {
	FlxG.cameras.remove(camHUD, false);
    FlxG.cameras.add(camOther = new HudCamera(), false);
    camOther.bgColor = 0x00000000;
    FlxG.cameras.add(camHUD, false);
	for(i in [bar1, bar2]) {
		insert(0, i);

		i.cameras = [camOther];
		//i.zoomFactor = 0;
		FlxTween.cancelTweensOf(bar2);
		FlxTween.cancelTweensOf(bar1);
	}
}

function onEvent(_) {
	if (_.event.name == 'Bars') {
		var sizeNeeded = _.event.params[0];
		var timeNeeded = _.event.params[1];
		var easingType = (_.event.params[2] == "In" ? FlxEase.circIn : 
			(_.event.params[2] == "Out" ? FlxEase.circOut : FlxEase.circInOut)
		);

		FlxTween.tween(bar1, {y: -560 + (10 * Std.int(sizeNeeded))}, Conductor.crochet / 1000 * timeNeeded, {ease: easingType});
		FlxTween.tween(bar2, {y: 720 + -(10 * Std.int(sizeNeeded))}, Conductor.crochet / 1000 * timeNeeded, {ease: easingType});
	}
}