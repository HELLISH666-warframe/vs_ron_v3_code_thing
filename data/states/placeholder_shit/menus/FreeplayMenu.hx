import funkin.savedata.FunkinSave;
import funkin.backend.chart.Chart;
import desolation.game.AnimatedIcon;

//shaders
var time:Float = 0;
var crt:CustomShader  = new CustomShader("fake CRT");
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var fish:CustomShader  = new CustomShader("fisheye");
var wig:CustomShader  = new CustomShader("glitchsmh");
var grey:CustomShader  = new CustomShader("grayscale");
//cam
var camWhat:FlxCamera;
var camText:FlxCamera = new FlxCamera();
camText.bgColor = null;
camWhat = new FlxCamera();
FlxG.cameras.reset(camWhat);
FlxCamera.defaultCameras = [camWhat];
var portrait:FlxSprite;
var preload = [];
var particles:FlxTypedEmitter;
var bullShit:Int = 0;
public var mode:String = 'main';

var songs:Array<ChartMetaData> = [];
var curSelected:Int = 0;
var curDiff:Int = 0;
var scoreText:FunkinText;
var diffText:FunkinText;
var scoreBG:FunkinSprite;
var bg:FunkinSprite;
var canSelect:Bool = true;
var grpSongs:FlxGroup;
var iconArray:Array<AnimatedIcon> = [];

var camUI:FlxCamera;

function create() {
	window.title = "Sunday's Desolation - Freeplay";

	camUI = new FlxCamera();
	camUI.bgColor = 0;
	FlxG.cameras.add(camUI, false);

	for (i in stupidFreeplayList)
		songs.push(Chart.loadChartMeta(i));

	bg = new FunkinSprite(0, 0).loadGraphic(Paths.image('menus/menuDesat'));
	bg.color = songs[curSelected].parsedColor;
	bg.antialiasing = true;
	bg.scrollFactor.set();
	bg.zoomFactor = 0;
	add(bg);

	grpSongs = new FlxGroup();

	for (i in 0...songs.length) {
		var songText:Alphabet = new Alphabet(0, (70 * i) + 30, songs[i].displayName, true, false);
		songText.isMenuItem = true;
		songText.targetY = i;
		songText.alpha = i == curSelected ? 1 : 0.5;

		var icon:AnimatedIcon = new AnimatedIcon(songs[i].icon);
		icon.sprTracker = songText;
		icon.alpha = i == curSelected ? 1 : 0.5;
		icon.scrollFactor.set(1, 1);

		iconArray.push(icon);
		add(icon);
		grpSongs.add(songText);
	}

	add(grpSongs);

	scoreText = new FunkinText(FlxG.width * 0.7, 5, 0, "", 32);
	scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, 'right');

	scoreBG = new FunkinSprite(scoreText.x - 6, 0).makeGraphic(1, 1, 0xFF000000);
	scoreBG.alpha = 0.6;
	add(scoreBG);

	diffText = new FunkinText(scoreText.x, scoreText.y + 40, scoreBG.width, "", 24);
	diffText.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, 'center');
	diffText.font = scoreText.font;
	diffText.updateHitbox();
	add(diffText);
	add(scoreText);

	for (i in [scoreText, scoreBG, diffText])
		i.cameras = [camUI];

	if (!FlxG.save.data.sundaySHAKE) {
		FlxG.camera.shake(0.001, 99999999999);
		camUI.shake(0.001, 99999999999);
	}

	changeItem(0);
}

function changeDiff(value:Int) {
	if (!canSelect) return;

	curDiff = value;
	if (songs[curSelected].difficulties.length > 1) diffText.text = '< ' + songs[curSelected].difficulties[curDiff] + ' >';
	else diffText.text = songs[curSelected].difficulties[curDiff];

	diffText.color = switch(diffText.text) {
		default: 0xFFFFFFFF;
		case 'D-SIDE': 0xFF9100C5;
		case 'LAPSUS': 0xFFFF00FF;
		case 'HARD': 0xFF3E5230;
		case 'COOL': 0xFF5158B5;
	};
}

var nextSelected:Int = 0;
function changeItem(value:Int) {
	if (!canSelect) return;
	
	nextSelected = value;
	CoolUtil.playMenuSFX(0, 0.7);

	var newColor:FlxColor = FlxColor.fromString(songs[nextSelected].color);
	if (bg.color != newColor) {
		FlxTween.cancelTweensOf(bg);
		FlxTween.color(bg, 0.5, bg.color, newColor, {ease: FlxEase.quantOut});
	}

	scoreText.text = "PERSONAL BEST: " + FunkinSave.getSongHighscore(songs[nextSelected].name, songs[nextSelected].difficulties[0], null).score;
	diffText.fieldWidth = scoreText.width;

	scoreBG.scale.set(scoreText.width + 20, 86);
	scoreBG.updateHitbox();
	scoreBG.x = FlxG.width - scoreBG.width;
	scoreText.x = diffText.x = scoreBG.x + 10;
	scoreText.y = scoreBG.y + 10;
	diffText.y = scoreText.y + 40;

	for (item in grpSongs.members) {
		if (grpSongs.members.indexOf(item) == nextSelected && item.alpha != 1) {
			FlxTween.tween(item, {alpha: 1}, 0.1, {ease: FlxEase.quantOut});
			FlxTween.tween(iconArray[grpSongs.members.indexOf(item)], {alpha: 1}, 0.1, {ease: FlxEase.quantOut});
		} else if (grpSongs.members.indexOf(item) != nextSelected && item.alpha != 0.5) {
			FlxTween.tween(item, {alpha: 0.5}, 0.1, {ease: FlxEase.quantOut});
			FlxTween.tween(iconArray[grpSongs.members.indexOf(item)], {alpha: 0.5}, 0.1, {ease: FlxEase.quantOut});
		}
		item.targetY = grpSongs.members.indexOf(item) - nextSelected;
	}

	if (grpSongs.members[nextSelected].text.length > 17 && FlxG.camera.zoom != 0.9) {
		FlxTween.cancelTweensOf(FlxG.camera);
		FlxTween.tween(FlxG.camera, {zoom: 0.9, 'scroll.x': 50}, 1, {ease: FlxEase.quartOut});
	} else if (FlxG.camera.zoom != 1) {
		FlxTween.cancelTweensOf(FlxG.camera);
		FlxTween.tween(FlxG.camera, {zoom: 1, 'scroll.x': 0}, 1, {ease: FlxEase.quartOut});
	}

	curSelected = nextSelected;

	if (!songs[nextSelected].difficulties.contains(diffText.text))
		changeDiff(0);
}

function update(elapsed) {
	if (controls.BACK || FlxG.mouse.justPressedRight) {
		CoolUtil.playMenuSFX(2, 0.7);
		new FlxTimer().start(0.25, function() {FlxG.switchState(new ModState('MasterFreeplayState'));});
	}

	for (i in grpSongs.members)
		if (FlxG.mouse.overlaps(i) && FlxG.mouse.justPressed && grpSongs.members.indexOf(i) != curSelected)
			changeItem(grpSongs.members.indexOf(i));

	if (controls.LEFT_P) changeDiff(curDiff == 0 ? curDiff : curDiff - 1);
	if (controls.RIGHT_P) changeDiff(curDiff == songs[curSelected].difficulties.length-1 ? curDiff : curDiff + 1);

	if (controls.UP_P || FlxG.mouse.wheel > 0) changeItem(curSelected == 0 ? songs.length-1 : curSelected - 1);
	if (controls.DOWN_P || FlxG.mouse.wheel < 0) changeItem(curSelected == songs.length-1 ? 0 : curSelected + 1);

	if ((controls.ACCEPT || (FlxG.mouse.overlaps(grpSongs.members[curSelected]) && FlxG.mouse.justPressed)) && canSelect) {
		canSelect = false;
		CoolUtil.playMenuSFX(1, 0.7);

		if (!FlxG.save.data.sundaySHAKE) FlxG.camera.shake(0.008, 0.08);
		FlxTween.tween(FlxG.camera, {zoom: 2.1}, 2, {ease: FlxEase.expoInOut});

		PlayState.loadSong(songs[curSelected].name, diffText.text.toLowerCase());
		new FlxTimer().start(1, function() {FlxG.switchState(new PlayState());});
		time += elapsed;
	chrom.data.rOffset.value = [0.005*Math.sin(time)];
	chrom.data.bOffset.value = [-0.005*Math.sin(time)];
	wig.data.iTime.value = [0.005*Math.sin(time)];
	}
}
function postCreate() {
	FlxG.cameras.add(camText, false);

	bg = new FlxSprite();
	bg.frames = Paths.getSparrowAtlas('menus/freeplay/mainbgAnimate');
	bg.animation.addByPrefix('animate', 'animate', 24, true);
	bg.animation.play('animate');
	bg.scale.set(2,2);
	bg.updateHitbox();
	bg.screenCenter();
	insert(1, bg);
	add(bg);

	portrait = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/portraits/ron'));
	portrait.scale.set(0.51,0.51);
	portrait.updateHitbox();
		insert(1, bg);
	add(portrait);

	var bar:FlxSprite = CoolUtil.loadAnimatedGraphic(new FlxSprite(), Paths.image('menus/freeplay/bar'));
	add(bar);
	bar.screenCenter();
	bar.x += 30;}