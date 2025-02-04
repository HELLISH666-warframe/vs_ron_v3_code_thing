var time:Float = 0;
public var windowmovebath:Bool = false;
public var cameramovebath:Bool = false;
public var cameramoveshed:Bool = false;
public var intensecameramoveshed:Bool = false;
public var cameramovebleed:Bool = false;
public var intensecameramovebleed:Bool = false;
public var fx:FlxSprite;
fx = new FlxSprite().loadGraphic(Paths.image('stages/effect'));
fx.setGraphicSize(Std.int(2560 * 1)); // i dont know why but this gets smol if i make it the same size as the kade ver
fx.updateHitbox();
fx.antialiasing = true;
fx.screenCenter();
fx.scrollFactor.set(0, 0);
fx.alpha = 0.3;
public var Estatic:FlxSprite;
Estatic = new FlxSprite().loadGraphic(Paths.image('stages/deadly'));
Estatic.scrollFactor.set();
Estatic.screenCenter();
Estatic.alpha = 0;
var chrom:CustomShader  = new CustomShader("chromatic aberration");
public var chromeOffset = (FlxG.save.data.chromeOffset/350);
public var chromeOffset2 = (((2 - health)*Math.sin(curStep/10))*FlxG.save.data.chromeOffset/350)/5;
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
if (windowmovebath)
	window.move(Math.round(24 * Math.sin((time/0.5) * Math.PI) + 327), Math.round(24 * Math.sin((time/0.5) * 3) + 160));
if (cameramovebath)
	{
	camHUD.angle = 11 * Math.sin((time/3) * Math.PI);
	camera.angle = 2 * Math.sin((time/3) * Math.PI);
	}
if (cameramoveshed)
	{
	camHUD.angle = 11 * Math.sin((time/2) * Math.PI);
	FlxG.camera.angle = 2 * Math.sin((time/2) * Math.PI);
	}
if (intensecameramoveshed)
	{
	camHUD.angle = 11 * Math.sin((time/1) * Math.PI);
	FlxG.camera.angle = 4 * Math.sin((time/1) * Math.PI);
	}
if (cameramovebleed)
	{
	camHUD.angle = 22 * Math.sin((time/1) * Math.PI);
	FlxG.camera.angle = 4 * Math.sin((time/1) * Math.PI);
	}
if (intensecameramovebleed)
	{
	camHUD.angle = 45 * Math.sin((time/0.5) * Math.PI);
	FlxG.camera.angle = 9 * Math.sin((time/0.5) * Math.PI);
	}
}
override function create()
{if (curSong == 'bloodshed' && dad.curCharacter == 'bloodshedron' || curSong == 'bleeding' || curSong == 'bleeding-classic' || curSong == 'bloodshed-classic' || curSong == 'bloodbath')
if (FlxG.save.data.chrom) {FlxG.camera.addShader(chrom);camHUD.addShader(chrom);
	chrom.data.rOffset.value = [chromeOffset];
	chrom.data.gOffset.value = [0.0];
	chrom.data.bOffset.value = [chromeOffset * -1];}
	add(fx);
	add(Estatic);
	FlxTween.tween(Estatic, {"scale.x":1.2,"scale.y":1.2}, Conductor.crochet / 1000, {ease: FlxEase.quadInOut, type: FlxEase.PINGPONG});
}