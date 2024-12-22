import flixel.util.FlxColor;
import flixel.text.FlxText.FlxTextFormat;
import flixel.addons.display.FlxBackdrop;
import flixel.math.FlxRect;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import StringTools;
var didCancel = false;
if (Assets.exists(Paths.file("songs/" + curSong + "/dialogue.json")) && state.isStoryMode) {
	function onStartCountdown(event) {
		event.cancel();
	}
	var spriteGroup = new FlxSpriteGroup();
	public var dialogueWorks:Bool = true;
	var music:FlxSound = new FlxSound().loadEmbedded(Paths.music("talking-in-a-cool-way"));
	public var finishCallback:Void->Void;
	var dialogueJSON:Array = Json.parse(Assets.getText(Paths.file("songs/" + curSong + "/dialogue.json")));
	var preloadPortraits = ["bruh" => new FlxSprite()];
	var curDialogue:Int = 0;
	var backdropThingy:Dynamic;
	var targetGoer = 1;
	var goer:Float = 1;
	var tempPortrait:Array = [];
	var preloadBoxes = ["bruh" => new FlxSprite()];
	var dialoguebox:FlxSprite;
	var bg:FlxSprite;
	var STOP:Bool = false;
	var dialogText:FlxTypeText;
	var dialogHand:FlxSprite = new FlxSprite(1075, 625).loadGraphic(Paths.image('dialogue assets/hand'));
	var aliases:Array = [];
	var retroes:Array = [];
	function postCreate() {
		finishCallback = startCountdown;
		FlxG.sound.list.add(music);
		backdropThingy = new FlxBackdrop(Paths.image("dialogue assets/barsLoopable"), FlxAxes.X);
		bg = new FlxSprite().loadGraphic(Paths.image("dialogue assets/bg"));
		add(spriteGroup);
		spriteGroup.camera = camHUD;
		spriteGroup.add(bg);
		spriteGroup.add(backdropThingy);
		var portraiter = [];
		var alieasesesae = [];
		//portrait loading
		for (i=>a in dialogueJSON){
			if (a.textColor != null && !alieasesesae.contains(a.alias)) {
				aliases.push([a.alias, a.textColor == "#FFFF00" ? "#FFC800" : a.textColor, ["%","#","^","*"][aliases.length]]); // yellow is unreadable on a white background
				alieasesesae.push(a.alias);
			}
			if (a.character != null && !portraiter.contains(a.character)) {
				tempPortrait.push([a.character, a.isLeftSide]);
				portraiter.push(a.character);
			}
			if (a.retroes != null) {
				var retroer = new FlxSprite(104 + 147 * i, 668);
				retroer.frames = Paths.getFrames('dialogue assets/retroIcons');
				retroer.animation.addByPrefix("idle", a.retroes + "0", 24, true);
				retroer.animation.play("idle");
				retroer.updateHitbox();
				retroer.y -= retroer.height;
				retroes.push(retroer);
			}
		}
		for (character in tempPortrait)
		{
			var char:FlxSprite = new FlxSprite().loadGraphic(Paths.image('dialogue assets/' + character[0]));
			spriteGroup.add(char);
			char.alpha = 0.5;
			char.updateHitbox();
			char.x = character[1] ? 100 : FlxG.width - 40 - char.width;
			char.y = 517 - char.height;
			char.scale.set(0.9,0.9);
			char.origin.set(char.width / 2, char.height);
			preloadPortraits[character[0]] = char;
		}
		//box loading
		dialoguebox = new FlxSprite().loadGraphic(Paths.image('dialogue assets/window'));
		preloadBoxes['speech_bubble'] = Paths.image('dialogue assets/window');
		dialoguebox.scrollFactor.set();
		dialoguebox.visible = false;
		spriteGroup.add(dialoguebox);
		for (a in dialogueJSON)
			if (a.dialogueBox != null && preloadBoxes[a.dialogueBox] == null)
				preloadBoxes[a.dialogueBox] = Paths.image('dialogue assets/' + a.dialogueBox);
		bg.alpha = 0;
		var blackBox = new FlxSprite().makeGraphic(1280, 720, 0xFF000000);
		FlxTween.tween(bg, {alpha: 0.8}, 1, {startDelay: 1, ease: FlxEase.quintOut, onComplete: function(twn:FlxTween) {nextDialogue(0);		music.play();
			music.fadeIn(0.5);
			FlxTween.tween(blackBox, {alpha:0}, 1, {ease: FlxEase.quartOut});
			music.looped = true;}});
		var textRect = new FlxRect(0, 0, 816, 119);
		dialogText = new FlxTypeText(385, 543, 810, "", 14);
		dialogText.font = Paths.font("w95.otf");
		dialogText.sounds = [new FlxSound().loadEmbedded(Paths.sound('Metronome_Tick'))];
		dialogText.font = 'Pixel Arial 11 Bold';
		dialogText.clipRect = textRect;
		dialogText.clipRect = dialogText.clipRect;
		dialogText.start(0.05);
		curTextDelay = 0.05;
		dialogText.color = 0xFF000000;
		spriteGroup.add(dialogText);
		spriteGroup.add(dialogHand);
		dialogHand.visible = false;
		for (i in retroes) spriteGroup.add(i);
	
		spriteGroup.add(blackBox);
	}
	var time:Float = 0;
	override function update(elapsed:Float) {
		if (STOP) return;
		if (FlxG.keys.justPressed.ANY) 
			if (!finishedTyping) dialogText.skip() else nextDialogue(1);
		time += elapsed;
		dialogHand.x = 1075 + (Math.abs(Math.sin(3.5 * time)) * 10);
		if (dialogText.height + 14 > 129) {
			dialogText.y = 664 - dialogText.height;
			dialogText.clipRect.y = dialogText.height - 119;
			dialogText.clipRect = dialogText.clipRect;
		}
		goer = lerp(goer,targetGoer, 0.01);
		backdropThingy.velocity.x = goer * 15;
	}
	var expression:String = '';
	var curPortrait:Dynamic = "";
	var curText:String;
	var curTextDelay:Float;
	var finishedTyping:Bool = false;
	var aliasColor:FlxColor;
	function nextDialogue(e:Int) {
		dialoguebox.visible = true;
		dialogHand.visible = false;
		curDialogue += e;
		if (curDialogue == dialogueJSON.length) {
			STOP = true;
			music.fadeOut(2,0,function(twn:FlxTween) {
				music.destroy();
				finishCallback();
				remove(spriteGroup);
				spriteGroup.destroy();
			});
			for (d=>i in retroes) FlxTween.tween(i, {alpha:0}, 1, {ease: FlxEase.quintOut});
			for (d=>i in preloadPortraits) FlxTween.tween(i, {alpha:0}, 1, {ease: FlxEase.quintOut});
			for (a in [bg, curPortrait, dialoguebox, dialogText, dialogHand, backdropThingy])
				FlxTween.tween(a, {alpha: 0}, 1, {ease: FlxEase.quintOut});
			return;
		}
		var d = dialogueJSON[curDialogue];
	
		if (d.text != null) curText = d.text;
		if (d.clickSound != null) {
			dialogText.sounds = [];
			if (d.clickSound[0] != null)
			{
				for (i in 0...d.clickSound.length)
					dialogText.sounds.push(new FlxSound().loadEmbedded(Paths.sound(d.clickSound[i])));
			}
			else
				dialogText.sounds = [new FlxSound().loadEmbedded(Paths.sound(d.clickSound))];
		}
		if (!Math.isNaN(d.textDelay)) dialogText.delay = d.textDelay;
		if (d.textColor != null) aliasColor = FlxColor.fromString(d.textColor);
	
		if (d.expression != null) expression = d.expression;
	
		if (preloadBoxes[d.dialogueBox] != null) {
			dialoguebox.loadGraphic(preloadBoxes[d.dialogueBox]);
		}
		targetGoer = d.isLeftSide ? -1 : 1;
		if (d.character != null && curPortrait != preloadPortraits[d.character]) {
			curPortrait = preloadPortraits[d.character];
			FlxTween.completeTweensOf(curPortrait);
			FlxTween.tween(curPortrait.scale, {x: 1, y: 1}, 0.4, {ease: FlxEase.circOut});
			FlxTween.tween(curPortrait, {alpha: 1}, 0.3, {ease: FlxEase.circOut});
		}
		
		for (d=>c in tempPortrait) {
			if (preloadPortraits[c[0]] != curPortrait){
				FlxTween.completeTweensOf(preloadPortraits[c[0]]);
				FlxTween.tween(preloadPortraits[c[0]].scale, {x: 0.9, y: 0.9}, 0.5, {ease: FlxEase.circOut});
				FlxTween.tween(preloadPortraits[c[0]], {alpha: 0.5}, 0.5, {ease: FlxEase.circOut});
			}
		}
	
		if (d.events != null)
			for (i in 0...d.events.length)
				scripts.call(d.events[i][0], d.events[i][1]);
		finishedTyping = false;
		dialogText._finalText += d.alias+':\n';
		for (i in aliases) dialogText._finalText = StringTools.replace(dialogText._finalText, i[0], i[2] + i[0] + i[2]);
		dialogText.applyMarkup(dialogText._finalText, [for (i in aliases) new FlxTextFormatMarkerPair(
			new FlxTextFormat(FlxColor.fromString(i[1]), true, true), i[2]
		)]);
		dialogText.start(curTextDelay);
		dialogText.skip();
		dialogText._finalText += curText + '\n';
		dialogText.start(curTextDelay);
		dialogText.completeCallback = function() {finishedTyping = true;dialogHand.visible = true;}
	}
	function cameraFlash(color:String, duration:Float) {
		PlayState.instance.camHUD.flash(Std.parseInt(color), duration, null, true);
	}
	function playSound(sound:String) {
		FlxG.sound.play(Paths.sound(sound));
	}
}