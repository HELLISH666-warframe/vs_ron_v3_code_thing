import flixel.addons.display.FlxBackdrop;
import flixel.addons.transition.FlxTransitionableState;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import FreeplayState;
import sys.FileSystem;
import funkin.backend.MusicBeatState;
import flixel.group.FlxSpriteGroup;
import funkin.backend.scripting.Script;
import Xml;

	var image:FlxSprite;
	var vimage:FlxSprite;
	var intendedColor:Int;
	var colorTween:FlxTween;
	var extraImage:FlxSprite;
	var classicImage:FlxSprite;
	static var curSelectedMaster:Int = 0;
	var cooltext:FlxText;
	var cameraWhat:FlxCamera;
	var cameraText:FlxCamera;
	var time:Float = 0;
	var loBg:FlxSprite;
	var loBgt:FlxSprite;
	var crt:CustomShader  = new CustomShader("fake CRT");
	var chrom:CustomShader  = new CustomShader("chromatic aberration");
	var weekOrder:Array<String> = [];
	var weeks:Map<String, Array<String>> = [];


	var time:Float = 0;
	function create()
	{

		for (i in Paths.getFolderContent('data/weeks')) {
			if (!StringTools.endsWith(i, '.xml')) continue;
			try {
				var xml:Xml = Xml.parse(Assets.getText('data/weeks/' + i)).firstElement();
				if (xml == null) {
					throw 'hey you fucked up yo shit bruh! (' + i + ')';
					continue;
				}
	
				weekOrder[Std.parseInt(xml.get('index'))] = StringTools.replace(i, '.xml', '');
			} catch(e:Exception) {
				trace(e);
				continue;
			}
		}

		for (weekName in weekOrder) {
			weeks[weekName] = [];
	
			var xml:Xml = Xml.parse(Assets.getText('data/weeks/' + weekName + '.xml')).firstElement();
			for (node in xml.elements())
				weeks[weekName].push(node.get('name'));
		}
		persistentUpdate = true;
		cameraText = new FlxCamera();
		cameraText.bgColor = 0;
		cameraWhat = new FlxCamera();
		FlxG.cameras.reset(cameraWhat);
		FlxG.cameras.add(cameraText);
		FlxCamera.defaultCameras = [cameraWhat];
			if (FlxG.save.data.crt){FlxG.camera.addShader(crt);}
//		FlxG.camera.addShader(chrom);
if (FlxG.save.data.chrom) {cameraText.addShader(chrom);
		chrom.data.rOffset.value = [1/2];
		chrom.data.gOffset.value = [0.0];
		chrom.data.bOffset.value = [1 * -1];}

		bg = new FlxSprite();
		bg.frames = Paths.getSparrowAtlas('menus/freeplay/mainbgAnimate');
		bg.animation.addByPrefix('animate', 'animate', 24, true);
		bg.animation.play('animate');
		bg.scale.set(2,2);
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);

		vimage = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/freeplay select/ground'), false, 1, 1);
		vimage.scale.set(0.5,0.5);
		vimage.scrollFactor.set();
		vimage.screenCenter();
		vimage.cameras = [cameraText];
		add(vimage);

		image = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/freeplay select/ron'), false, 1, 1);
		image.scale.set(0.5,0.5);
		image.scrollFactor.set();
		image.screenCenter();
		image.ID = 0;
		image.cameras = [cameraText];
		add(image);

		loBg = new FlxSprite(0, 0).makeGraphic(433, 999, 0xFF000000);
		loBg.alpha = 0.5;
		loBg.scrollFactor.set();
		add(loBg);

		loBgt = new FlxSprite(0, 0).makeGraphic(866, 999, 0xFF000000);
		loBgt.alpha = 0.5;
		loBgt.scrollFactor.set();
		add(loBgt);

		loBgt.cameras = [cameraText];
		loBg.cameras = [cameraText];

		image = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/freeplay select/ron'), false, 1, 1);
		image.scale.set(0.5,0.5);
		image.scrollFactor.set();
		image.screenCenter();
		image.ID = 0;
		image.cameras = [cameraText];
		add(image);

		classicImage = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/freeplay select/evilron'), false, 1, 1);
		classicImage.scale.set(0.65,0.65);
		classicImage.scrollFactor.set();
		classicImage.screenCenter();
		classicImage.ID = 1;
		classicImage.y += 100;
		classicImage.cameras = [cameraText];
		add(classicImage);

		extraImage = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/freeplay select/doyne'), false, 1, 1);
		extraImage.scale.set(0.5,0.5);
		extraImage.scrollFactor.set();
		extraImage.screenCenter();
		extraImage.ID = 2;
		extraImage.cameras = [cameraText];
		add(extraImage);
		changeSelection(0);

		cooltext = new FlxText(0, 5, 0, "", 96);
		cooltext.setFormat(Paths.font("vcr.ttf"), 96, FlxColor.WHITE);
		cooltext.scrollFactor.set(0,0);
		cooltext.screenCenter();
		cooltext.cameras = [cameraText];
		add(cooltext);
		cooltext.y = 125;
        cooltext.x = 550;

	}
	var accepted:Bool = false;
	override function update(elapsed:Float)
	{
		time += elapsed;
        vimage.color = bg.color;
		chrom.data.rOffset.value = [0.005*Math.sin(time)];
		chrom.data.bOffset.value = [-0.005*Math.sin(time)];
        cooltext.y += Math.sin(time*4)/2;
		switch(curSelectedMaster) {
			case 0:
				cooltext.text = "MAIN";
				FreeplayState.mode = 'main';
			case 1:
				cooltext.text = "CLASSIC";
				FreeplayState.mode = 'classic';
			case 2:
				cooltext.text = "EXTRAS";
				FreeplayState.mode = 'extras';
		}
		if(controls.RIGHT_P)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'));
			changeSelection(1);
		}

		if(controls.LEFT_P)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'));
			changeSelection(-1);
		}

		if(controls.ACCEPT)
		{
			Script.staticVariables.set('stupidFreeplayList', weeks[weekOrder[curSelectedMaster].split(' $ ')[0]]);
			new FlxTimer().start(0, function() {FlxG.switchState(new FreeplayState());});
		} else if (controls.ACCEPT) {
			MusicBeatState.skipTransIn = MusicBeatState.skipTransOut = true;
	
			Script.staticVariables.set('stupidFreeplayList', weeks[weekOrder[curSelectedMaster].split(' $ ')[0]]);
			FlxG.switchState(new FreeplayState());
		}
		if(controls.DOWN_P)
		{
		FlxG.switchState(new FreeplayState());
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
		FlxTween.globalManager.cancelTweensOf(image);
		FlxTween.globalManager.cancelTweensOf(classicImage);
		FlxTween.globalManager.cancelTweensOf(extraImage);
		image.color = FlxColor.GRAY;
		classicImage.color = FlxColor.GRAY;
		extraImage.color = FlxColor.GRAY;

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



