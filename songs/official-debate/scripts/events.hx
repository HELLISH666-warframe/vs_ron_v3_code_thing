function postCreate(){}

function stepHit(curStep) {
	switch(curStep) {
		case 984:
			dad.color = FlxColor.BLACK;
			boyfriend.color = FlxColor.BLACK;
		case 1112:
		dad.color = FlxColor.WHITE;
		boyfriend.color = FlxColor.WHITE;
	}
}
