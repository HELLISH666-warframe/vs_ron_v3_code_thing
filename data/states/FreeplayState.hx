import Alphabetthing;
import flixel.graphics.FlxGraphic;
import funkin.backend.chart.Chart;
import flixel.effects.particles.FlxParticle;
import flixel.effects.particles.FlxTypedEmitter;

var time:Float = 0;
var crt:CustomShader = new CustomShader("fake CRT");
var chrom:CustomShader = new CustomShader("chromatic aberration");
var fish:CustomShader = new CustomShader("fisheye");
var glitch:CustomShader = new CustomShader("glitchsmh");
var grey:CustomShader = new CustomShader("grayscale");
var vhs:CustomShader = new CustomShader("vhs");

//thank_you_seezee
songs = [];
songRealList = [["ron","wasted","ayo","bloodshed","trojan-virus"],
	["ron-classic","wasted-classic","ayo-classic","bloodshed-classic","trojan-virus-classic","bleeding-classic"],
	["Tutorial","bloodbath","official-debate","gron","difficult-powers","bijuu","holy-shit-dave-fnf","slammed","ron-dsides","lights-down-remix","pretty-wacky","certified-champion","rong-aisle","bloodshed-legacy-redux","clusterfunk","awesome-ron","oh-my-god-hes-ballin","fardventure","bleeding"]];
modelist = ["MAIN","CLASSIC","EXTRAS"];
rsongsFound = songRealList[FlxG.save.data.freeplaything];
modelistt = modelist[FlxG.save.data.freeplaything];

for(s in rsongsFound)
	songs.push(Chart.loadChartMeta(s, "hard", true));
var camText:FlxCamera = new FlxCamera();
camText.bgColor = null;
var portrait:FlxSprite = new FlxSprite();
var portraitOverlay:FlxSprite = new FlxSprite();
var preload = [];
var grpSongs2:FlxTypedGroup<Alphabet> = new FlxTypedGroup();
var iconArray2:Array<HealthIcon> = [];
var modeText:FlxText = new FlxText(0,0,0,modelistt,0).setFormat(Paths.font("w95.otf"),48,FlxColor.WHITE);
var chromeOffset = (FlxG.save.data.chromeOffset/350);
function postUpdate(elapsed:Float){time += elapsed;
	if(controls.BACK)FlxG.switchState(new ModState('MasterFreeplayState'));
	chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
	glitch.data.iTime.value = [time];
	vhs.data.iTime.value = [time];

	for (i in 0...songs.length)
		grpSongs2.members[i].y += (Math.sin(i+time)/2);
	for (item in grpSongs2.members)
		item.forceX = FlxMath.lerp(item.x, 125 + (65 * (item.ID - curSelected)),lerpFix(0.1));
	portraitOverlay.y = portrait.y;
	portraitOverlay.angle = portrait.angle;
}
function create(){
	add(grpSongs2);
	for (i in 0...songs.length)
	{
		var songText:Alphabetthing = new Alphabetthing(0, (70 * i) + 30, songs[i].displayName, true, false);
		songText.isMenuItem = true;
		songText.targetY = i;
		songText.ID = i;
		songText.camera = camText;
		grpSongs2.add(songText);
		var icon:HealthIcon = new HealthIcon(songs[i].icon);
		icon.sprTracker = songText;
		iconArray2.push(icon);
		add(icon);
	}
	for (i in 0...iconArray2.length) remove(iconArray2[i]);
	if(curSelected >= songs.length) curSelected = 0;
	insert(2,modeText);

	portrait.updateHitbox();
	insert(2,portrait);
}
function shadering(){
	var cursong = songs[curSelected].displayName;
    switch(cursong)
    {
		case"gron":if(FlxG.save.data.grey)FlxG.camera.addShader(grey);camText.addShader(grey);
		case"trojan-virus":glitch.data.on.value = [1.];
		case"Bleeding":diffText.color=0xE00020;glitch.data.on.value = [1.];
		default:FlxG.camera.removeShader(grey);camText.removeShader(grey);
		glitch.data.on.value = [0];diffText.color=0xFFFFFFFF;
    }
	if ((cursong == 'slammed')||(cursong == 'oh-my-god-hes-ballin'))
	{
		portraitOverlay.loadGraphic(Paths.image('menus/freeplay/portraits/'+cursong+'-over'));
		portraitOverlay.updateHitbox();
		portraitOverlay.screenCenter();
		oh_hi = new FlxTimer().start(0.2, function(tmr:FlxTimer)
		portraitOverlay.visible = true);
	}
	else
		NO_FUCK_OFF = new FlxTimer().start(0.16, function(tmr:FlxTimer)
		portraitOverlay.visible = false);
}
function postCreate(){
	FlxG.cameras.add(camText, false);
	remove(grpSongs);
	for(i in iconArray) remove(i);

	bg.frames = Paths.getSparrowAtlas('menus/freeplay/mainbgAnimate');
	if(FlxG.save.data.freeplaything == 1){
		bg.frames = Paths.getSparrowAtlas('menus/freeplay/classicbgAnimate');
		FlxG.camera.addShader(vhs);
	}
	bg.animation.addByPrefix('animate', 'animate', 24, true);
	bg.animation.play('animate');
	bg.scale.set(2,2);
	bg.screenCenter();

	var bar:FlxSprite = CoolUtil.loadAnimatedGraphic(new FlxSprite(490,-20),Paths.image('menus/freeplay/bar'));
	add(bar);

	for (i in [scoreText,scoreBG,diffText,portraitOverlay])
	insert(5,i);
	scoreBG.alpha = 0.3;
	
	for (i in 0...iconArray2.length) add(iconArray2[i]);
	for (i in songs){
		var graphic = FlxGraphic.fromAssetKey(Paths.image('menus/freeplay/portraits/' + i.name));
		graphic.persist = true;
		preload.push(graphic);
	}
	changeSelection(0, true);
	if (FlxG.save.data.glitch)FlxG.camera.addShader(glitch);
	if (FlxG.save.data.crt)FlxG.camera.addShader(crt);
	if (FlxG.save.data.chrom)FlxG.camera.addShader(chrom);
	camText.addShader(fish);
	fish.data.MAX_POWER.value = [0.2];
	var coolemitter:FlxTypedEmitter = new FlxTypedEmitter();
	coolemitter.velocity.set(0, -5, 0, -10);
	coolemitter.y = FlxG.height;

	var coolzemitter:FlxTypedEmitter = new FlxTypedEmitter();
	coolzemitter.velocity.set(0, 5, 0, 10);

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
	for(i in [coolzemitter,coolemitter]){
		i.width = FlxG.width*1.5;
		i.angularVelocity.set(-10, 10);
		i.lifespan.set(5);
		add(i);
		i.start(false, 0.05);
	}
}
function onChangeSelection(event){
	if (event.change == 0) event.playMenuSFX = false;
	FlxTween.globalManager.completeTweensOf(portrait);
	var val = event.value;
	//I_know_this_is_dumb_but_dont_know_how_to_do_it_in_a_NON-dumb_way
	trace("Fuck.");
	FlxTween.tween(scoreText,{y: scoreText.y + 0},0.00000000000000001,{onComplete:function(twn:FlxTween){		
		var bullShit:Int = 0;
		for (i in grpSongs2){
				i.targetY = bullShit - curSelected;
				bullShit++;
				i.alpha = 0.6;
				if (i.targetY == 0) i.alpha = 1;
			}
		for (i in 0...iconArray2.length) iconArray2[i].alpha = 0.6;
	    iconArray2[curSelected].alpha = 1;
			shadering();}});
	FlxTween.tween(portrait,{y: portrait.y + 45,angle: 5},0.2,{ease:FlxEase.quintIn, onComplete:function(twn:FlxTween){
		portrait.loadGraphic(preload[val]);
		portrait.screenCenter();
		var mfwY = portrait.y;
		portrait.y -= 20;
		portrait.angle = -5;
		FlxTween.tween(portrait, {y: mfwY, angle: 0}, 0.4, {ease: FlxEase.elasticOut});
	}});
}
public static function lerpFix(value:Float){
	return value / (60 / 60);
}