//𝔽𝕣𝕒𝕜𝕚𝕥𝕤 made nearly all of this , i added sheders and thats it lol
import flixel.graphics.FlxGraphic;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;
import flixel.text.FlxTextAlign;
import Fucker;
import funkin.savedata.FunkinSave;
import Health_icon_thingie;
import funkin.backend.chart.Chart;

//shaders
var time:Float = 0;
var crt:CustomShader  = new CustomShader("fake CRT");
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var fish:CustomShader  = new CustomShader("fisheye");
var wig:CustomShader  = new CustomShader("glitchsmh");
var grey:CustomShader  = new CustomShader("grayscale");
var vhs:CustomShader  = new CustomShader("vhs");

//thank_you_seezee
trace(FlxG.save.data.freeplaything);

songs = [];
songRealList = [
	["ron", "wasted", "ayo", "bloodshed", "trojan-virus"],
	["ron-classic", "wasted-classic", "ayo-classic", "bloodshed-classic", "trojan-virus-classic", "bleeding-classic"],
	["Tutorial", "bloodbath", "official-debate", "gron", "difficult-powers", "bijuu", "holy-shit-dave-fnf", "slammed", "ron-dsides", "lights-down-remix", "pretty-wacky", "certified-champion", "rong-aisle", "bloodshed-legacy-redux", "clusterfunk", "awesome-ron", "oh-my-god-hes-ballin", "fardventure", "bleeding"]
];
modelist = [
	"MAIN","CLASSIC","EXTRAS"
];
rsongsFound = songRealList[FlxG.save.data.freeplaything];
modelistt = modelist[FlxG.save.data.freeplaything];

trace(rsongsFound);
for(s in rsongsFound)
	songs.push(Chart.loadChartMeta(s, "hard", true));
//cam
var camText:FlxCamera = new FlxCamera();
camText.bgColor = null;
var camWhat:FlxCamera;
camWhat = new FlxCamera();
FlxG.cameras.reset(camWhat);
FlxCamera.defaultCameras = [camWhat];
var camFUCK:FlxCamera = new FlxCamera();
FlxG.cameras.add(camFUCK);
camFUCK.x += 6000;

var portrait:FlxSprite;
var preload = [];
var particles:FlxTypedEmitter;
var grpSongs2:FlxTypedGroup<Alphabet> = [];
var iconArray2:Array<HealthIcon> = [];
var modeText:FlxText;
var chromeOffset = (FlxG.save.data.chromeOffset/350);
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
	wig.data.iTime.value = [0.005*Math.sin(time)];
	vhs.data.iTime.value = [time];

	for (i in 0...songs.length)
	{
		grpSongs2.members[i].y += (Math.sin(i+time)/2);
	}
	for (i=>item in grpSongs2.members)
	{
		{
			item.forceX = FlxMath.lerp(item.x, 125 + (65 * (item.ID - curSelected)), lerpFix(0.1));
			for (i in 0...songs.length)
				item.y += (Math.sin(i+elapsed)/2);
		}
	}
}
function postUpdate(elapsed:Float) {
if(controls.BACK)
	{
		FlxG.switchState(new ModState('MasterFreeplayState'));
	}
}
function shadering() 
{
	var curSong = songs[curSelected].displayName;
    switch(curSong)
    {
		case "gron":{ if (FlxG.save.data.grey){camWhat.addShader(grey);camText.addShader(grey);}}
		case "trojan-virus" | "Bleeding":{{wig.data.iTime.value = [2,2];wig.data.on.value = [1.];}}
		default:{camWhat.removeShader(grey);camText.removeShader(grey);
		wig.data.on.value = [0];}	
    }
	diffText.color = switch(diffText.text)
	{
		case 'COOL':0xE00020;
		default: 0xFFFFFFFF;		
	}
}
function create() {
	grpSongs2 = new FlxTypedGroup();
	add(grpSongs2);
for (i in 0...songs.length)
	{
		var songText:Fucker = new Fucker(0, (70 * i) + 30, songs[i].displayName, true, false);
		songText.isMenuItem = true;
		songText.targetY = i;
		songText.ID = i;
		songText.cameras = [camText];
		grpSongs2.add(songText);
		if (songText.width > 980)
		{

		}
		var icon:Health_icon_thingie = new Health_icon_thingie(songs[i].icon);
		icon.sprTracker = songText;
		icon.trackerOffset = -25;

		iconArray2.push(icon);
		add(icon);
	}
for (i in 0...iconArray2.length)
	{
		remove(iconArray2[i]);
	}
	if(curSelected >= songs.length) curSelected = 0;
}
function postCreate() {
	FlxG.cameras.add(camText, false);
	grpSongs2.camera = camText;
	grpSongs.camera = camFUCK;
	for (i in iconArray) i.camera = camFUCK;
	{if (FlxG.save.data.glitch)FlxG.camera.addShader(wig);}

	for (i in 0...songs.length) {
		var songCheck = songs[i].name;
		if (FunkinSave.getSongHighscore(songCheck, "normal").score == 0) {
			continue;
		}}
	bg.frames = Paths.getSparrowAtlas('menus/freeplay/mainbgAnimate');
	if(FlxG.save.data.freeplaything == 1){
		bg.frames = Paths.getSparrowAtlas('menus/freeplay/classicbgAnimate');
		camWhat.addShader(vhs);
	}
	bg.animation.addByPrefix('animate', 'animate', 24, true);
	bg.animation.play('animate');
	bg.scale.set(2,2);
	bg.screenCenter();

	portrait = new FlxSprite().loadGraphic(Paths.image('menus/freeplay/portraits/ron'));
	portrait.scale.set(0.51,0.51);
	portrait.updateHitbox();
	add(portrait);

	var bar:FlxSprite = CoolUtil.loadAnimatedGraphic(new FlxSprite(), Paths.image('menus/freeplay/bar'));
	add(bar);
	bar.screenCenter();
	bar.x += 30;

	for (i in 0...iconArray2.length)
	{
		add(iconArray2[i]);
	}

	scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
	scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, "RIGHT");

	scoreBG = new FlxSprite(scoreText.x - 6, 0).makeGraphic(1, 1, 0xFF000000);
	scoreBG.alpha = 0.3;
	add(scoreBG);

	diffText = new FlxText(scoreText.x, scoreText.y + 36, 0, "", 24);
	diffText.font = scoreText.font;
	add(diffText);
			
	modeText = new FlxText(10, 10, 0, modelistt, 48);
	modeText.setFormat(Paths.font("w95.otf"), 48, FlxColor.WHITE, 'LEFT');
	add(modeText);

	add(scoreText);
	for (i in songs) {
		var graphic = FlxGraphic.fromAssetKey(Paths.image('menus/freeplay/portraits/' + i.name));
		graphic.persist = true;
		preload.push(graphic);
	}
	changeSelection(0, true);{
	if (FlxG.save.data.crt){camWhat.addShader(crt);}
	if (FlxG.save.data.chrom) {camWhat.addShader(chrom);
		chrom.data.rOffset.value = [1/2];
		chrom.data.gOffset.value = [0.0];
		chrom.data.bOffset.value = [1 * -1];
    }
		camText.addShader(fish);
		fish.data.MAX_POWER.value = [0.2];
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
	FlxTween.tween(modeText, {y: modeText.y + 0}, 0.00000000000000001, {ease: FlxEase.quintIn, onComplete: function(twn:FlxTween) {		var bullShit:Int = 0;
		
		var max:Int = songs.length;
	
		if (curSelected < 0)
			curSelected = max - 1;
		if (curSelected >= max)
			curSelected = 0;	
		for (item in grpSongs2.members)
			{
				item.targetY = bullShit - curSelected;
				bullShit++;
	
				item.alpha = 0.6;
	
				if (item.targetY == 0)
				{
					item.alpha = 1;
				}
			}
	
		for (i in 0...iconArray2.length)
			{
				iconArray2[i].alpha = 0.6;
			}
	
			iconArray2[curSelected].alpha = 1;}});
	FlxTween.tween(portrait, {y: portrait.y + 45, angle: 5}, 0.2, {ease: FlxEase.quintIn, onComplete: function(twn:FlxTween) {
		portrait.loadGraphic(preload[val]);
		portrait.updateHitbox();
		portrait.screenCenter();
		var mfwY = portrait.y;
		portrait.y -= 20;
		portrait.angle = -5;
		FlxTween.tween(portrait, {y: mfwY, angle: 0}, 0.4, {ease: FlxEase.elasticOut});
		shadering();
	}});
}
public static function lerpFix(value:Float) {
	return value / (60 / 60);
}