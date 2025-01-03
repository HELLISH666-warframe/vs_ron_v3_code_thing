var fxtwo:FlxSprite;
var funnyDSidesSpin:Bool = false;
public var camOverlay:FlxCamera;
function create(){
	camOverlay = new FlxCamera();
	camOverlay.alpha = 0;

	FlxG.cameras.add(camOverlay);
}
function postCreate(){
	if (FlxG.random.int(1, 100) == 69)
		iconP2.setIcon('peak-dsides');
}

override function update(elapsed:Float)
{		
if (funnyDSidesSpin) {iconP2.angle += 180*elapsed;}
}
function onDadHit(e){		
	if (funnyDSidesSpin) {
	dad.angle = FlxG.random.int(0,359);
}}
function stepHit(Step){
	switch(curStep){
		case 768:
		funnyDSidesSpin = true;
		case 1037:
		funnyDSidesSpin = false;
		FlxTween.tween(dad, {angle: Math.floor(dad.angle/360)*360}, 0.8, {ease: FlxEase.expoOut});
		FlxTween.tween(iconP2, {angle: Math.floor(iconP2.angle/360)*360}, 0.8, {ease: FlxEase.expoOut});
		case 1315:
		defaultCamZoom += 0.1;
		fxtwo = new FlxSprite().loadGraphic(Paths.image('stages/effect'));
		fxtwo.scale.set(0.75, 0.75);
		fxtwo.updateHitbox();
		fxtwo.antialiasing = true;
		fxtwo.screenCenter();
		fxtwo.alpha = 0.2;
		fxtwo.scrollFactor.set(0, 0);
		add(fxtwo);
		fxtwo.cameras = [camOverlay];
		FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
	}
}