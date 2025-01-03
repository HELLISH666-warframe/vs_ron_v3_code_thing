import hxvlc.flixel.FlxVideo;
import Sys;
import funkin.editors.ui.UIState;
import funkin.options.OptionsMenu;
import funkin.menus.ModSwitchMenu;
import funkin.editors.EditorPicker;
import lime.app.Application;
skipTransition = false;
whiteTransition = false;

importScript("data/scripts/progressionHandler");

var options:FlxTypedGroup<FunkinSprite>;
var timeBomb:FlxTimer = new FlxTimer();
var pixel:CustomShader = new CustomShader("pixel");
var corr:CustomShader = new CustomShader("corruption");
var iconType:String;

function create() {
	FlxG.mouse.visible = true;
	//FlxG.mouseControls = true;
	FlxG.mouse.useSystemCursor = true;
	FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursor')));
	//FlxG.sound.music.play();
	CoolUtil.playMenuSong();
	//if (FlxG.save.data.daweegeeCursedMenu) CoolUtil.playMusic(Paths.music('freakyMenuGrasp'));
}

var background:FunkinSprite;
var monitor:FunkinSprite;
var bliss:FunkinSprite;
var vignette:FunkinSprite;

var menuInput = false;
var cameraMouse = true;
var menuselectInQuestion = 0;


function postCreate() {
	options = new FlxTypedGroup();
	FlxG.camera.followLerp = 0.01;

	camFront = new FlxCamera(0, 0, 960, 720);
	camFront.bgColor = 0;
	FlxG.cameras.add(camFront, false);
	pixel.data.pixelSize.value = [0.1];

	background = new FunkinSprite(-300, -25).loadGraphic(_img("bgmenu"));
    background.scrollFactor.set(0.85, 0.85);
	desk = new FunkinSprite(-300, 460).loadGraphic(_img("deskmenu"));
	monitor = new FunkinSprite(-76, -219).loadGraphic(_img("monitor"));
	bliss = new FunkinSprite(228, 90).loadGraphic(_img("desktop"));
	
	bliss2 = new FunkinSprite(228, 90).loadGraphic("images/ironidie.png");
	bliss2.scale.set(3, 2);
	bliss2.updateHitbox();

	vignette = new FunkinSprite(0, 0).loadGraphic(_img("vignette"));
	vignette.scrollFactor.set(0, 0);
	vignette.blend = 9;
	vignette.alpha = 0.6;
    
	pokeball = new FunkinSprite(208, 510).loadGraphic(_img("pokeball"));
	pokeball.alpha = 0.001;

	nes = new FunkinSprite(-82, 410);
	nes.frames = Paths.getSparrowAtlas("menus/mainmenu/nes");
	nes.animation.addByPrefix("idle","nes", 0, false);
	nes.animation.addByPrefix("selected","nesselect", 24, false);
	nes.animation.play("idle");
    
	dsi = new FunkinSprite(842, 370);
	dsi.frames = Paths.getSparrowAtlas("menus/mainmenu/ds");
	dsi.animation.addByPrefix("idle","ds", 0, false);
	dsi.animation.addByPrefix("selected","dsselect", 24, false);
	dsi.animation.play("idle");
    
	plush = new FunkinSprite(628, 150);
	plush.frames = Paths.getSparrowAtlas("menus/mainmenu/plush");
	plush.animation.addByPrefix("idle","zerty", 0, false);
	plush.animation.addByPrefix("selected","zertyscream", 24, false);
	plush.animation.play("idle");

	for (a in [background, desk, bliss, monitor, plush, nes, dsi, pokeball]) {
		a.scale.set(.9, .9);
		a.updateHitbox();
	}

	//THE ICONS
	selectionSprite = new FunkinSprite(410, 120).loadGraphic(_img("selectionSprite"));
	selectionSprite.scale.set(.7, .7);
	selectionSprite.updateHitbox();
	selectionSprite.alpha = 0.7;
	selectionSprite.visible = false;
	selectionSprite.offset.set(23, 26);
	
	if (FlxG.save.data.daweegeeCursedMenu) iconType = "Cursed-Icons"; else iconType = "Desktop-Icons";

	storyIcon = new FunkinSprite(278, 120);
	storyIcon.frames = Paths.getSparrowAtlas("menus/mainmenu/"+iconType);
	storyIcon.animation.addByPrefix("story","Desktop-Icons story", 24, true);
	storyIcon.animation.play("story");

	freeIcon = new FunkinSprite(278, 210);
	freeIcon.frames = Paths.getSparrowAtlas("menus/mainmenu/"+iconType);
	freeIcon.animation.addByPrefix("free","Desktop-Icons freeplay", 24, true);
	freeIcon.animation.play("free");

	creditIcon = new FunkinSprite(358, 300);
	creditIcon.frames = Paths.getSparrowAtlas("menus/mainmenu/"+iconType);
	creditIcon.animation.addByPrefix("cred","Desktop-Icons credits", 24, true);
	creditIcon.animation.play("cred");

	searchIcon = new FunkinSprite(278, 300);
	searchIcon.frames = Paths.getSparrowAtlas("menus/mainmenu/"+iconType);
	searchIcon.animation.addByPrefix("search","Desktop-Icons search", 24, true);
	searchIcon.animation.play("search");

	optIcon = new FunkinSprite(600, 120);
	optIcon.frames = Paths.getSparrowAtlas("menus/mainmenu/"+iconType);
	optIcon.animation.addByPrefix("option","Desktop-Icons settings", 24, true);
	optIcon.animation.play("option");
    
	folderIcon = new FunkinSprite(600, 300);
	folderIcon.frames = Paths.getSparrowAtlas("menus/mainmenu/"+iconType);
	folderIcon.animation.addByPrefix("folder","Desktop-Icons folder", 24, true);
	folderIcon.animation.play("folder");

    //THE TEXTS
	storyIconText = new FunkinSprite(storyIcon.x-6, storyIcon.y+65);
	storyIconText.frames = Paths.getSparrowAtlas("menus/mainmenu/texts");
	storyIconText.animation.addByPrefix("story","texts story", 24, true);
	storyIconText.animation.play("story");

	freeIconText = new FunkinSprite(freeIcon.x-6, freeIcon.y+65);
	freeIconText.frames = Paths.getSparrowAtlas("menus/mainmenu/texts");
	freeIconText.animation.addByPrefix("free","texts freeplay", 24, true);
	freeIconText.animation.play("free");

	creditIconText = new FunkinSprite(creditIcon.x-6, creditIcon.y+65);
	creditIconText.frames = Paths.getSparrowAtlas("menus/mainmenu/texts");
	creditIconText.animation.addByPrefix("cred","texts credits", 24, true);
	creditIconText.animation.play("cred");

	searchIconText = new FunkinSprite(searchIcon.x-6, searchIcon.y+65);
	searchIconText.frames = Paths.getSparrowAtlas("menus/mainmenu/texts");
	searchIconText.animation.addByPrefix("search","texts search", 24, true);
	searchIconText.animation.play("search");

	optIconText = new FunkinSprite(optIcon.x-6, optIcon.y+65);
	optIconText.frames = Paths.getSparrowAtlas("menus/mainmenu/texts");
	optIconText.animation.addByPrefix("option","texts settings", 24, true);
	optIconText.animation.play("option");
    
	folderIconText = new FunkinSprite(folderIcon.x-6, folderIcon.y+65);
	folderIconText.frames = Paths.getSparrowAtlas("menus/mainmenu/texts");
	folderIconText.animation.addByPrefix("folder","texts folder", 24, true);
	folderIconText.animation.play("folder");

	FlxG.camera.zoom = 1;

	// add shits

	add(background);
	add(desk);
	theironikChance = FlxG.random.int(1, 300);
	if (theironikChance == 1 && !FlxG.save.data.daweegeeCursedMenu) add(bliss2); else add(bliss);
	add(selectionSprite);
	for (i in [storyIcon, freeIcon, creditIcon, searchIcon, optIcon, folderIcon, storyIconText, freeIconText, creditIconText, searchIconText, optIconText, folderIconText]) {
		i.scale.set(.7, .7);
		i.updateHitbox();
		add(i);
		
		//epic global Trigger s
		if(i == folderIcon && !FlxG.save.data.unlockedFolder) i.visible = false;
		if(i == searchIcon && !FlxG.save.data.unlockedFolder) i.visible = false;
		if(i == creditIcon && !FlxG.save.data.graspDone) i.visible = false;
		
		//if(i == creditIcon && FlxG.save.data.daweegeeCursedMenu) i.visible = false;
		//if(i == optIcon && FlxG.save.data.daweegeeCursedMenu) i.visible = false;
		//if(i == storyIcon && FlxG.save.data.daweegeeCursedMenu) i.visible = false;
		//if(i == searchIcon && FlxG.save.data.daweegeeCursedMenu) i.visible = false;
		//if(i == folderIcon && FlxG.save.data.daweegeeCursedMenu) i.visible = false;
	}
    storyIconText.visible = storyIcon.visible; 
	freeIconText.visible = freeIcon.visible; 
	creditIconText.visible = creditIcon.visible; 
	searchIconText.visible = searchIcon.visible; 
	optIconText.visible = optIcon.visible; 
	folderIconText.visible = folderIcon.visible; 

	monitorScreen = new FlxSprite(monitor.x+330, monitor.y+325).makeGraphic(431, 286);
	monitorScreen.alpha = 0.1;
	monitorScreen.blend = 0;

	add(monitorScreen);
	add(monitor);
	
	add(plush);
	thezertChance = FlxG.random.int(1, 8);
	if (thezertChance == 1 && !FlxG.save.data.daweegeeCursedMenu) plush.visible = true; else plush.visible = false;
	trace("zerty!! "+thezertChance);
	
	if (FlxG.save.data.daweegeeCursedMenu) nes.visible = false;
	add(nes);
	if(FlxG.save.data.unlockedDS && !FlxG.save.data.daweegeeCursedMenu) dsi.visible = true;
	else dsi.visible = false;
	
	add(dsi);
	add(pokeball);
    add(vignette);
	
	twitterIcon = new FunkinSprite(6, 655).loadGraphic(_img("twitter"));
	twitterIcon.scrollFactor.set(0, 0);
	twitterIcon.cameras = [camFront];
	twitterIcon.scale.set(0.8, 0.8);
	twitterIcon.updateHitbox();
	add(twitterIcon);

	for (i in [background, desk, bliss, monitor, plush, nes, dsi, pokeball, storyIconText, freeIconText, creditIconText, searchIconText, optIconText, folderIconText, twitterIcon])
	i.antialiasing = true;

	plushHitbox = new FlxSprite(plush.x+90, plush.y+65).makeGraphic(85, 270);
	dsiHitbox = new FlxSprite(dsi.x+20, dsi.y+7).makeGraphic(170, 160);
	nesHitbox = new FlxSprite(nes.x, nes.y+5).makeGraphic(210, 115);
	keyHitbox = new FlxSprite(162, 557).makeGraphic(559, 83);
	mouseHitbox = new FlxSprite(770, 540).makeGraphic(80, 50);
	//add(mouseHitbox);

	// TODO: add actual version str. via global script or somethin'...
	versionShit = new FunkinText(5, FlxG.height - 2, 0, 'FNF: YTP Invasion '+'3.1');
	versionShit.cameras = [camFront];
	versionShit.y -= versionShit.height;
	versionShit.scrollFactor.set();
	add(versionShit);

	//Daweegeethin'
	if (FlxG.save.data.daweegeeCursedMenu) {
		background.visible = false;
		monitorScreen.visible = false;
		bliss.visible = false;
		desk.color = 0xFF75695f;
		monitor.color = 0xFF6c6c6c;
		twitterIcon.visible = false;
		versionShit.visible = false;
		freeIcon.shader = corr;
		corr.strength = 0.5;
		freeIcon.x = 442;
	    freeIconText.x = freeIcon.x-6;
		for (i in [freeIcon, freeIconText]) {
			i.y += 5;
			FlxTween.tween(i, {y: i.y -10}, 2, {ease: FlxEase.sineInOut, type:FlxTween.PINGPONG});
		}
	}
	
	if (!FlxG.save.data.daweegeeCursedMenu) timeBomb.start(171, () -> pokeballAppears());
	delay = new FlxTimer().start(0.5, () -> {
		if (FlxG.save.data.graspDone && !FlxG.save.data.tyPopupHappen) tyPopup();
		menuInput = true;
	});
	trace(FlxG.save.data.tyPopupHappen);
}

function tyPopup() {
    FlxG.save.data.popupName = "thanks";
    FlxG.save.data.tyPopupHappen = true;
	openSubState(new ModSubState("customStates/PopupSubstate"));
	persistentUpdate = false;
	persistentDraw = true;
}

var lightFlicker = false;
function beatHit(beat)
{	
	lightChance = FlxG.random.int(1, 5);
	if (lightChance == 5) lightFlicker = true;
	if (lightChance == 1) lightFlicker = false;
}

function pokeballAppears () {
	menuInput = false;
	FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursor')));
	selectionSprite.visible = false;
	FlxG.sound.music.stop();
	trace("You will DIE.");
	FlxTween.tween(pokeball, {alpha: 1}, 1.8, {
	onComplete: function() explode()});
}
function explode () {
    wtfBOOM.play(true);
    crash = new FlxTimer().start(5, () -> return Sys.exit(0));
	video = new FlxTimer().start(1.8, () ->
	{
		wtfBOOMVideo = new FlxVideo();
		var path = Paths.file("videos/boom.mp4");
		wtfBOOMVideo.load(Assets.getPath(path));
		wtfBOOMVideo.play(Assets.getPath(path));
	});

}

function iconClick() {
	if (menuselectInQuestion == 0) return;
	menuInput = false;
	FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursor')));
	timeBomb.cancel();
	for (i in [twitterIcon, versionShit]) FlxTween.tween(i, {alpha: 0.001}, 0.1);
	
	cameraMouse = false;
	FlxG.camera.follow(monitor);
	FlxG.camera.targetOffset.set(10, -130);
	
	selectionSprite.alpha = 1;
	select.play(true);
	cameraTweensTime = new FlxTimer().start(0.4, () -> cameraTweens());
	skipTransition = true;
	whiteTransition = true;
    switch (menuselectInQuestion) {
		case 1: FlxTween.tween(storyIcon.scale, {x: 0.8, y: 0.8}, 0.2, {ease: FlxEase.backOut});
		case 2: 
			if (FlxG.save.data.daweegeeCursedMenu) for (i in [freeIcon, freeIconText]) FlxTween.cancelTweensOf(i);
			FlxTween.tween(freeIcon.scale, {x: 0.8, y: 0.8}, 0.2, {ease: FlxEase.backOut});
		case 3: FlxTween.tween(optIcon.scale, {x: 0.8, y: 0.8}, 0.2, {ease: FlxEase.backOut});
	    case 4: FlxTween.tween(searchIcon.scale, {x: 0.8, y: 0.8}, 0.2, {ease: FlxEase.backOut});
		case 5: FlxTween.tween(folderIcon.scale, {x: 0.8, y: 0.8}, 0.2, {ease: FlxEase.backOut});
		case 6: FlxTween.tween(creditIcon.scale, {x: 0.8, y: 0.8}, 0.2, {ease: FlxEase.backOut});
	}
	new FlxTimer().start(1.5, () ->
	{
	   switch (menuselectInQuestion) {
		case 1: FlxG.switchState(new StoryMenuState());
		case 2: if(!FlxG.save.data.daweegeeCursedMenu) FlxG.switchState(new FreeplayState()); else FlxG.switchState(new ModState("customStates/DaweegeeRealmState"));
		case 3: FlxG.switchState(new OptionsMenu());
	    case 4: FlxG.switchState(new UIState(true, "customStates/SearchMenuState"));
		case 5: FlxG.switchState(new ModState("customStates/CodesVideo"));
		case 6: FlxG.switchState(new ModState("customStates/CreditsVideo"));
	   }     
	});
}
// 1 is story, 2 is freeplay, 3 is options, 4 is search, 5 is folder and 6 is credits :3
function cameraTweens () {
	zoom.play(true);
	FlxTween.tween(FlxG.camera, {zoom: 5}, 1, {ease: FlxEase.quintIn});
	FlxTween.tween(FlxG.camera.targetOffset, {x: 10, y: -250}, 1, {ease: FlxEase.quintIn});
	cameraWhiteTime = new FlxTimer().start(0.8, () ->
	{
		trace(cameraMouse);
		camFront.fade(FlxColor.WHITE, 0.2, false);
	});
}

function nesClick () {
	menuInput = false;
	timeBomb.cancel();
	FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursor')));
	cameraMouse = false;
	for (i in [twitterIcon, versionShit]) FlxTween.tween(i, {alpha: 0.001}, 0.1);
	FlxG.camera.follow(monitor);
	FlxG.camera.targetOffset.set(-90, -130);
	
	nes.animation.play("selected");
	FlxG.sound.music.stop();
	selectnes.play(true);
	skipTransition = true;
	pixelTime = new FlxTimer().start(0.6, () ->
	{
		FlxG.camera.addShader(pixel);
		FlxTween.num(0.1, 100, 1.2, {}, (val:Float) -> {pixel.data.pixelSize.value = [val];});
		FlxG.camera.fade(FlxColor.BLACK, 1.2, false);
	});
	
	new FlxTimer().start(2, () ->
	{
	  trace("plswork");
	  PlayState.loadSong('plummeting assault', 'normal');
	  FlxG.switchState(new PlayState());
	});
}

function dsClick () {
	//if (!unlockedDS) continue;
	FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursor')));
	menuInput = false;
	timeBomb.cancel();
	for (i in [twitterIcon, versionShit]) FlxTween.tween(i, {alpha: 0.001}, 0.1);
	cameraMouse = false;
	FlxG.camera.follow(monitor);
	FlxG.camera.targetOffset.set(110, -130);

	dsi.animation.play("selected");
	FlxG.sound.music.stop();
	selectds.play(true);
	new FlxTimer().start(0.7, () -> camFront.fade(FlxColor.WHITE, 0.4, false));
	
	skipTransition = true;
	whiteTransition = true;
	new FlxTimer().start(2, () ->
	{
	  trace("plswork");
	  PlayState.loadSong('hatena', 'normal');
	  FlxG.switchState(new PlayState());
	});
}
function plushClick () {
	if (!plush.animation.finished ) return;
	if (!dsi.animation.finished ) return;
	plush.animation.play("selected");
	scream.play(true);
	FlxG.camera.shake(0.003, 0.5, null, true);
}

var time:Float = 0;
function update(elapsed) {
    if (cameraMouse) {
      FlxG.camera.scroll.x = FlxMath.lerp(FlxG.camera.scroll.x, (FlxG.mouse.screenX-(FlxG.width/2)) * 0.12, (1/30)*100*elapsed);
	  FlxG.camera.scroll.y = FlxMath.lerp(FlxG.camera.scroll.y, (FlxG.mouse.screenY-6-(FlxG.height/2)) * 0.03, (1/30)*100*elapsed);
	  if (FlxG.mouse.overlaps(monitorScreen)) FlxG.camera.zoom = FlxMath.lerp(FlxG.camera.zoom, 1.1, 0.04); 
	  else FlxG.camera.zoom = FlxMath.lerp(FlxG.camera.zoom, 1, 0.04);
	}
	if (lightFlicker) monitorScreen.alpha = FlxMath.lerp(monitorScreen.alpha, FlxG.random.float(0.01, 0.2), 0.2);

	if (menuInput) {
	  //hover actions
	  if (FlxG.mouse.overlaps(storyIcon) && storyIcon.visible && !FlxG.save.data.daweegeeCursedMenu) {
		selectionSprite.visible = true;
		selectionSprite.x = storyIcon.x; selectionSprite.y = storyIcon.y;
		FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursorHover')));
	  } else if (FlxG.mouse.overlaps(freeIcon) && freeIcon.visible) {
		selectionSprite.visible = true;
        selectionSprite.x = freeIcon.x; selectionSprite.y = freeIcon.y;
		FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursorHover')));
	  } else if (FlxG.mouse.overlaps(optIcon) && optIcon.visible) {
		selectionSprite.visible = true;
		selectionSprite.x = optIcon.x; selectionSprite.y = optIcon.y;
		FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursorHover')));
	  } else if (FlxG.mouse.overlaps(creditIcon) && creditIcon.visible && !FlxG.save.data.daweegeeCursedMenu) {
		selectionSprite.visible = true;
		selectionSprite.x = creditIcon.x; selectionSprite.y = creditIcon.y;
		FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursorHover')));
	  } else if (FlxG.mouse.overlaps(folderIcon) && folderIcon.visible && !FlxG.save.data.daweegeeCursedMenu) {
		selectionSprite.visible = true;
		selectionSprite.x = folderIcon.x; selectionSprite.y = folderIcon.y;
		FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursorHover')));
	  } else if (FlxG.mouse.overlaps(searchIcon) && searchIcon.visible && !FlxG.save.data.daweegeeCursedMenu) {
		selectionSprite.visible = true;
		selectionSprite.x = searchIcon.x; selectionSprite.y = searchIcon.y;
		FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursorHover')));
	  } else if (FlxG.mouse.overlaps(twitterIcon) && twitterIcon.visible) {
		FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursorHover')));
	  } 
	  else if (FlxG.mouse.overlaps(dsiHitbox) && dsi.visible) FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursorHover')));
	  else if (FlxG.mouse.overlaps(nesHitbox) && nes.visible) FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursorHover')));
	  else if (FlxG.mouse.overlaps(plushHitbox) && plush.visible) FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursorHover')));
	  else {
		selectionSprite.visible = false;
		FlxG.mouse.load(Assets.getBitmapData(Paths.image('game/cursor')));
	  }
	  	
	  //clicking actions
	  if (FlxG.mouse.overlaps(storyIcon) && (FlxG.mouse.justPressed) && storyIcon.visible && !FlxG.save.data.daweegeeCursedMenu) {
	    menuselectInQuestion = 1;
		iconClick();
	  }
	  if (FlxG.mouse.overlaps(freeIcon) && (FlxG.mouse.justPressed) && freeIcon.visible) {
		menuselectInQuestion = 2;
		iconClick();
	  }
	  if (FlxG.mouse.overlaps(optIcon) && (FlxG.mouse.justPressed) && optIcon.visible) {
		menuselectInQuestion = 3;
		iconClick();
	  }
	  if (FlxG.mouse.overlaps(searchIcon) && (FlxG.mouse.justPressed) && searchIcon.visible && !FlxG.save.data.daweegeeCursedMenu) {
		menuselectInQuestion = 4;
		iconClick();
	  }
	  if (FlxG.mouse.overlaps(folderIcon) && (FlxG.mouse.justPressed) && folderIcon.visible && !FlxG.save.data.daweegeeCursedMenu) {
	    menuselectInQuestion = 5;
	    iconClick();
	  }
	  if (FlxG.mouse.overlaps(creditIcon) && (FlxG.mouse.justPressed) && creditIcon.visible && !FlxG.save.data.daweegeeCursedMenu) {
	    menuselectInQuestion = 6;
	    iconClick();
	  }
	  if (FlxG.mouse.overlaps(twitterIcon) && (FlxG.mouse.justPressed) && twitterIcon.visible) {
		select.play(true);
		FlxG.openURL('https://twitter.com/YtpInvasion');
	  }
	  if (FlxG.mouse.overlaps(nesHitbox) && nes.visible && (FlxG.mouse.justPressed)) nesClick();
	  if (FlxG.mouse.overlaps(dsiHitbox) && dsi.visible && (FlxG.mouse.justPressed)) dsClick();
	  if (FlxG.mouse.overlaps(plushHitbox) && plush.visible && (FlxG.mouse.justPressed)) plushClick();
	  if (FlxG.mouse.overlaps(keyHitbox) && (FlxG.mouse.justPressed)) keyClick.play(true);
	  if (FlxG.mouse.overlaps(mouseHitbox) && (FlxG.mouse.justPressed)) mouseClick.play(true);
	}
	corr.iTime = time;
	time += elapsed*2;
	
	/* DEV OPTIONS
	if (controls.SWITCHMOD) {
		openSubState(new ModSwitchMenu());
		persistentUpdate = false;
		persistentDraw = true;
	}
    if (FlxG.keys.justPressed.SEVEN){
		persistentUpdate = !(persistentDraw = true);
		openSubState(new EditorPicker());
	}
		*/
	
}

// shortcuts \\
function _img(Path:String) // image
	return Paths.image('menus/mainmenu/' + Path);

function _sa(Path:String) // sparrow atlas
	return Paths.getSparrowAtlas('menus/mainmenu/' + Path);

function _debugPositioning(Item:FunkinSprite) {
	Item.setPosition(FlxG.mouse.x, FlxG.mouse.y);
    if (FlxG.mouse.justPressed) Logs.trace("Position is: " + Item.x + ", " + Item.y, 4);
}