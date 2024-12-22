var bar1:FunkinSprite = new FunkinSprite(0, -560).makeGraphic(1600 * 2, 560, 0xFF000000);
var bar2:FunkinSprite = new FunkinSprite(0, 720).makeGraphic(1600 * 2, 560, 0xFF000000);
function create()
{
	for(i in [bar1, bar2]) {
		insert(0, i);

		i.cameras = [camHUD];
		i.zoomFactor = 0;
	}
}

function onEvent(_) {
	if (_.event.name == 'Bars') {
		var sizeNeeded = _.event.params[0];
		var timeNeeded = _.event.params[1];
		var easingType = (_.event.params[2] == "In" ? FlxEase.circIn : 
			(_.event.params[2] == "Out" ? FlxEase.circOut : boyfriend.FlxEase.circInOut)
		);

		FlxTween.tween(bar1, {y: -560 + (10 * Std.int(sizeNeeded))}, Conductor.crochet / 1000 * timeNeeded, {ease: easingType});
		FlxTween.tween(bar2, {y: 720 + -(10 * Std.int(sizeNeeded))}, Conductor.crochet / 1000 * timeNeeded, {ease: easingType});
	}
}