import flixel.graphics.FlxGraphic;
var camText:FlxCamera = new FlxCamera();
var portrait:FlxSprite;
var preload = [];
camText.bgColor = 0;
function postCreate() {
	FlxG.cameras.add(camText, false);
	grpSongs.camera = camText;
	for (i in iconArray) i.camera = camText;

	var bg:FlxSprite = CoolUtil.loadAnimatedGraphic(new FlxSprite(), Paths.image('menus/freeplay/mainbgAnimate'));
	add(bg);
	bg.screenCenter();
	bg.scale.set(2,2);

	portrait = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/portraits/'));
	portrait.scale.set(0.51,0.51);
	portrait.updateHitbox();
	add(portrait);
	
	var bar:FlxSprite = CoolUtil.loadAnimatedGraphic(new FlxSprite(), Paths.image('menus/freeplay/bar'));
	add(bar);
	bar.screenCenter();
	bar.x += 30;
	for (i in songs) {
		var graphic = FlxGraphic.fromAssetKey(Paths.image('menus/freeplay/portraits/' + i.name));
		graphic.persist = true;
		preload.push(graphic);
	}
	changeSelection(0, true);
}
function onChangeSelection(event) {
	if (event.change == 0) event.playMenuSFX = false;
	FlxTween.globalManager.completeTweensOf(portrait);
	var val = event.value;
	FlxTween.tween(portrait, {y: portrait.y + 45, angle: 5}, 0.2, {ease: FlxEase.quintIn, onComplete: function(twn:FlxTween) {
		portrait.loadGraphic(preload[val]);
		portrait.updateHitbox();
		portrait.screenCenter();
		var mfwY = portrait.y;
		portrait.y -= 20;
		portrait.angle = -5;
		FlxTween.tween(portrait, {y: mfwY, angle: 0}, 0.4, {ease: FlxEase.elasticOut});
	}});
}