import funkin.menus.FreeplayState;

var image:FlxSprite;
var vimage:FlxSprite;
var intendedColor:Int;
var colorTween:FlxTween;
var extraImage:FlxSprite;
var classicImage:FlxSprite;
static var curSelectedMaster:Int = 0;
var cooltext:FlxText;
var cameraWhat:FlxCamera = new FlxCamera();
var cameraText:FlxCamera = new FlxCamera();
var time:Float = 0;
var loBg:FlxSprite = new FlxSprite(0, 0).makeGraphic(433, 999, 0xFF000000);
var loBgt:FlxSprite = new FlxSprite(0, 0).makeGraphic(866, 999, 0xFF000000);
var crt:CustomShader  = new CustomShader("fake CRT");
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var chromeOffset = (FlxG.save.data.chromeOffset/350);
function create()
{
	cameraText.bgColor = 0;
	FlxG.cameras.reset(cameraWhat);
	FlxG.cameras.add(cameraText);
	FlxCamera.defaultCameras = [cameraWhat];
	if (FlxG.save.data.crt)FlxG.camera.addShader(crt);
	if (FlxG.save.data.chrom) {cameraText.addShader(chrom);
		chrom.data.rOffset.value = [chromeOffset/2];
		chrom.data.bOffset.value = [chromeOffset * -1];}

	bg = CoolUtil.loadAnimatedGraphic(new FlxSprite(), Paths.image('menus/freeplay/mainbgAnimate'));
	bg.scale.set(2,2);
	insert(1,bg);

	vimage = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/freeplay select/ground'), false, 1, 1);
	vimage.camera = cameraText;
	insert(1,vimage);

	for(i in [loBg,loBgt]){
		i.alpha = 0.5;
		insert(2,i);
		i.camera = cameraText;
	}

	image = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/freeplay select/ron'), false, 1, 1);
	image.camera = cameraText;
	add(image);

	classicImage = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/freeplay select/evilron'), false, 1, 1);
	classicImage.scale.set(1.3,1.3);
	classicImage.screenCenter();
	classicImage.y += 100;
	classicImage.camera = cameraText;
	add(classicImage);

	extraImage = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/freeplay select/doyne'), false, 1, 1);
	extraImage.camera = cameraText;
	add(extraImage);
	changeSelection(0);

	for(i in [image,bg,vimage,extraImage]){
		i.screenCenter();
	}

	cooltext = new FlxText(0, 5, 0, "", 96);
	cooltext.setFormat(Paths.font("vcr.ttf"), 96, FlxColor.WHITE);
	cooltext.camera = cameraText;
	add(cooltext);
	cooltext.y = 125;
}
function update(elapsed:Float)
{
	time += elapsed;
    vimage.color = bg.color;
	chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
    cooltext.y += Math.sin(time*4)/2;
	switch(curSelectedMaster) {
		case 0:
			cooltext.text = "MAIN";
		case 1:
			cooltext.text = "CLASSIC";
		case 2:
			cooltext.text = "EXTRAS";
	}
	cooltext.screenCenter(FlxAxes.X);
	if(controls.RIGHT_P)
	{
		CoolUtil.playMenuSFX(0, 0.7);
		changeSelection(1);
	}
	if(controls.LEFT_P)
	{
		CoolUtil.playMenuSFX(0, 0.7);
		changeSelection(-1);
	}
	if(controls.ACCEPT)
	{
		FlxG.switchState(new FreeplayState());
		FlxG.save.data.freeplaything = curSelectedMaster;
	}
	if(controls.BACK)
	{
		FlxG.switchState(new MainMenuState());
	}
}
function changeSelection(p)
{
	curSelectedMaster += p;
	if (curSelectedMaster < 0)
		curSelectedMaster = 2;
	if (curSelectedMaster >= 3)
		curSelectedMaster = 0;
	for(i in [image,classicImage,extraImage]){
		FlxTween.globalManager.cancelTweensOf(i);
		i.color = FlxColor.GRAY;
	}

	var newColor = 0xFF8C81D9;
	switch (curSelectedMaster)
	{
		case 0:
			loBgt.x = 866;
			loBg.x = 433;
			image.color = FlxColor.WHITE;
		case 1:
			loBgt.x = 866;
			loBg.x = 0;
			newColor = 0xFFC63C3f;
			classicImage.color = FlxColor.WHITE;
		case 2:
			loBgt.x = 0;
			loBg.x = 433;
			newColor = 0xFFDCF5F4;
			extraImage.color = FlxColor.WHITE;
	}
	if(newColor != intendedColor) {
		if(colorTween != null) {
			colorTween.cancel();
		}
		intendedColor = newColor;
		colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
			onComplete: function(twn:FlxTween) {
				colorTween = null;
			}
		});
	}
}