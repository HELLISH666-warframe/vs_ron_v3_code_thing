import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
function resetTrail() {
	remove(bloodshedTrail);
	bloodshedTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
	insert(members.indexOf(dad)-1, bloodshedTrail);
}
function postCreate() {}
function stepHit(curStep) {
	switch(curStep) {
		case 248 | 760:
			FlxG.sound.play(Paths.sound('vine'));
		case 288:
			defaultCamZoom = 0.65;
			evilTrail.color = FlxColor.RED;
			insert(members.indexOf(dad)-1, evilTrail);
			case 256:
				var xx = dad.x;
				var yy = dad.y;
				//dad.x = xx-80;
				//dad.y = yy-200;
				resetTrail();
				defaultCamZoom += 0.1;
				SCREWYOU = true;
				botplayTxt.visible = true;
				botplayTxt.y = scoreTxt.y - 100;
				if (!ClientPrefs.gameplaySettings['botplay'])
				{
					botplayTxt.text = "UNFORGIVING INPUT ENABLED!";
					botplayTxt.screenCenter();
				}
	}
}
