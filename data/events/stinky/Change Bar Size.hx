

function onEvent(_) {
	if (_.event.name == 'Change Bar Size') {
		var val1 = Std.parseFloat(_.event.params[0]);
		var val2 = Std.parseFloat(_.event.params[1]);
		FlxTween.tween(bar1, {y: -560 + (val1 * 10)}, val2, {ease: FlxEase.quintOut});
		FlxTween.tween(bar2, {y: 720 + -(val1 * 10)}, val2, {ease: FlxEase.quintOut});
	}
}