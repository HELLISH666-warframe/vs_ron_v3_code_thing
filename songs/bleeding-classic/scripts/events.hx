import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
var bloodshedTrail = null;
function resetTrail() {
	remove(bloodshedTrail);
	bloodshedTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
	bloodshedTrail.color = FlxColor.RED;
	insert(members.indexOf(dad)-1, bloodshedTrail);
}
override function update(elapsed:Float){
	iconP2.alpha = (2-(health)-0.15)/1+0.2;
	iconP1.alpha = (health-0.15)/1+0.2;
}
function stepHit(curStep) {
	switch(curStep) {
		case 1:
			FlxTween.tween(healthBar, {alpha: 0}, 0.3, {ease: FlxEase.circOut});
			FlxTween.tween(healthBarBG, {alpha: 0}, 0.3, {ease: FlxEase.circOut});
		case 248 | 760:
			FlxG.sound.play(Paths.sound('vine'));
		case 1:
			resetTrail();
		case 256:
			//dad.x = xx-80;
			//dad.y = yy-200;
			remove(bloodshedTrail);
			defaultCamZoom += 0.1;
		case 257:
			bloodshedTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
			bloodshedTrail.color = FlxColor.RED;
			insert(members.indexOf(dad)-1, bloodshedTrail);
        case 384:
			defaultCamZoom += 0.15;
		case 512:
			remove(bloodshedTrail);
        var xx = dad.x;
        var yy = dad.y;
//			triggerEventNote('Change Character', 'dad', 'hellron');
        //remove();
        dad.x = xx+80;
        dad.y = yy+200;
        defaultCamZoom -= 0.25;
		case 513:
			bloodshedTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
			bloodshedTrail.color = FlxColor.RED;
			insert(members.indexOf(dad)-1, bloodshedTrail);
		case 664:
			defaultCamZoom += 0.3;
		case 672:
			defaultCamZoom -= 0.3;
		case 768:
			remove(bloodshedTrail);
			var xx = dad.x;
			var yy = dad.y;
			//resetTrail();
			dad.x = xx-80;
			dad.y = yy-200;
			defaultCamZoom += 0.1;
		case 769:
			bloodshedTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069); //nice
			bloodshedTrail.color = FlxColor.RED;
			insert(members.indexOf(dad)-1, bloodshedTrail);
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
