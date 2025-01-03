//𝔽𝕣𝕒𝕜𝕚𝕥𝕤 made nearly all of this , i added sheders and thats it lol
//import
 import flixel.util.FlxColor;
 import flixel.text.FlxText;
 import flixel.graphics.FlxGraphic;
 import flixel.effects.particles.FlxParticle;
 import flixel.effects.particles.FlxTypedEmitter;
 import flixel.text.FlxTextAlign;

//shaders
 var time:Float = 0;
 var crt:CustomShader  = new CustomShader("fake CRT");
 var chrom:CustomShader  = new CustomShader("chromatic aberration");
 var fish:CustomShader  = new CustomShader("fisheye");
 //shader shit//
//cam
 var camWhat:FlxCamera;
 var camText:FlxCamera = new FlxCamera();
 camText.bgColor = null;
 camWhat = new FlxCamera();
 FlxG.cameras.reset(camWhat);
 FlxCamera.defaultCameras = [camWhat];
 //cam shit//	
var portrait:FlxSprite;
var preload = [];
var particles:FlxTypedEmitter;
public var mode:String = 'main';
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.005*Math.sin(time)];
	chrom.data.bOffset.value = [-0.005*Math.sin(time)];
}
	
function postCreate() {
	FlxG.cameras.add(camText, false);
	grpSongs.camera = camText;
	for (i in iconArray) i.camera = camText;

	bg = new FlxSprite();
	bg.frames = Paths.getSparrowAtlas('menus/freeplay/mainbgAnimate');
	bg.animation.addByPrefix('animate', 'animate', 24, true);
	bg.animation.play('animate');
	bg.scale.set(2,2);
	bg.updateHitbox();
	bg.screenCenter();
	add(bg);

	portrait = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/portraits/ron'));
	portrait.scale.set(0.51,0.51);
	portrait.updateHitbox();
	add(portrait);

	var bar:FlxSprite = CoolUtil.loadAnimatedGraphic(new FlxSprite(), Paths.image('menus/freeplay/bar'));
	add(bar);
	bar.screenCenter();
	bar.x += 30;

	scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
	scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, "RIGHT");

	scoreBG = new FlxSprite(scoreText.x - 6, 0).makeGraphic(1, 1, 0xFF000000);
	scoreBG.alpha = 0.3;
	add(scoreBG);

	diffText = new FlxText(scoreText.x, scoreText.y + 36, 0, "", 24);
	diffText.font = scoreText.font;
	add(diffText);
	var modeText = new FlxText(10, 10, 0,"fuck", 48);
	modeText.setFormat(Paths.font("w95.otf"), 48, FlxColor.WHITE);
	add(modeText);

	add(scoreText);
	

	portraitOverlay = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/portraits/ron'));
	portraitOverlay.scale.set(0.51,0.51);
	portraitOverlay.updateHitbox();
	add(portraitOverlay);
	portraitOverlay.visible = false;
	for (i in songs) {
		var graphic = FlxGraphic.fromAssetKey(Paths.image('menus/freeplay/portraits/' + i.name));
		graphic.persist = true;
		preload.push(graphic);
	if ((i.name.toLowerCase() == 'slammed'))
	{
		FlxG.camera.zoom = 1.2;
	}
	else
		FlxG.camera.zoom = 1;
	}
	changeSelection(0, true);{
	if (FlxG.save.data.crt){FlxG.camera.addShader(crt);}
	if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);camText.addShader(chrom);
		chrom.data.rOffset.value = [1/2];
		chrom.data.gOffset.value = [0.0];
		chrom.data.bOffset.value = [1 * -1];
    }
		camText.addShader(fish);
		fish.data.MAX_POWER.value = [0.19];
	}
var coolemitter:FlxTypedEmitter = new FlxTypedEmitter();
		coolemitter.width = FlxG.width*1.5;
		coolemitter.velocity.set(0, -5, 0, -10);
		coolemitter.angularVelocity.set(-10, 10);
		coolemitter.lifespan.set(5);
		coolemitter.y = FlxG.height;

		var coolzemitter:FlxTypedEmitter = new FlxTypedEmitter();
		coolzemitter.width = FlxG.width*1.5;
		coolzemitter.velocity.set(0, 5, 0, 10);
		coolzemitter.angularVelocity.set(-10, 10);
		coolzemitter.lifespan.set(5);

		for (i in 0...150)
		{
			var p = new FlxParticle();
			var p2 = new FlxParticle();
			p.makeGraphic(6,6,FlxColor.BLACK);
			p2.makeGraphic(12,12,FlxColor.BLACK);

			coolemitter.add(p);
			coolemitter.add(p2);
			coolzemitter.add(p);
			coolzemitter.add(p2);
		}

		add(coolzemitter);
		coolzemitter.start(false, 0.05);
		add(coolemitter);
		coolemitter.start(false, 0.05);
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
 function shadering() {
	clearShader(FlxG.camera);
	for (i in songs){
	switch (i.name[curSelected].i.name.toLowerCase())
	{
		case "gron":
			//grayscale looks better unless a cooler paper shader is found
			//addShader(camWhat,"paper");
			camText.addShader(crt);
	}
}
 }