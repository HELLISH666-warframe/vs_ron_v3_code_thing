import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
var bloodshedTrail = null;
function resetTrail() {
	bloodshedTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
	insert(members.indexOf(dad)-1, bloodshedTrail);
}
function postCreate() {
	iconP1.setIcon('oldbf');
}
function stepHit(curStep) {
	switch(curStep) {
		case 248 | 760:
			FlxG.sound.play(Paths.sound('vine'));
		case 288:
			defaultCamZoom = 0.65;
			bloodshedTrail.color = FlxColor.RED;
			insert(members.indexOf(dad)-1, bloodshedTrail);
			case 256:
				var xx = dad.x;
				var yy = dad.y;
				//dad.x = xx-80;
				//dad.y = yy-200;
				resetTrail();
				defaultCamZoom += 0.1;
/*				SCREWYOU = true;
				botplayTxt.visible = true;
				botplayTxt.y = scoreTxt.y - 100;
				if (!ClientPrefs.gameplaySettings['botplay'])
				{
					botplayTxt.text = "UNFORGIVING INPUT ENABLED!";
					botplayTxt.screenCenter();
*/				}
        case 384:
			defaultCamZoom += 0.15;
		case 512:
/*			SCREWYOU = false;
			if (!ClientPrefs.gameplaySettings['botplay'])
*/				botplayTxt.visible = false;
        var xx = dad.x;
        var yy = dad.y;
//			triggerEventNote('Change Character', 'dad', 'hellron');
        //remove();
        dad.x = xx+80;
        dad.y = yy+200;
        defaultCamZoom -= 0.25;
		case 664:
			defaultCamZoom += 0.3;
		case 672:
			defaultCamZoom -= 0.3;
		case 768:
			var xx = dad.x;
			var yy = dad.y;
			//resetTrail();
			dad.x = xx-80;
			dad.y = yy-200;
			defaultCamZoom += 0.1;
		case 832:
			defaultCamZoom += 0.1;
		case 896:
			defaultCamZoom += 0.1;
		case 1024:
			defaultCamZoom += 0.1;
		case 1040:
			defaultCamZoom -= 0.2;
		case 1168:
			defaultCamZoom -= 0.1;
	}
}
