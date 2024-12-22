import openfl.system.Capabilities;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.addons.display.FlxBackdrop;

var time:Float = 0;
var fiss = new CustomShader('vhs');

var tiltCam:Bool = true;
function create(){var majin = new FlxBackdrop(Paths.image('stages/triad/majin'), FlxAxes.XY, 0, 0);
	majinother = new FlxBackdrop(Paths.image('stages/triad/majinother'), FlxAxes.XY, 0, 0);
	var rainbTmr = new FlxTimer().start(0.005, function(tmr:FlxTimer)
	{
		majinother.x += (Math.sin(time)/5)+2;
		majinother.y += (Math.cos(time)/5)+1;
		majin.setPosition(majinother.x,majinother.y);
		tmr.reset(0.005);
	});
			FlxG.camera.addShader(fiss);
function postCreate()

function update(elapsed){


	for (i in 0...playerStrums.members.length)playerStrums.members[i].y = lerp(playerStrums.members[i].y, 40, 0.05);
	if (!tiltCam) camHUD.angle = lerp(camHUD.angle, 0, 0.05);
}

function beatHit(curBeat){
	if(tiltCam){
		if (curBeat % 2 == 0) camHUD.angle = 1 else camHUD.angle = -1;
	}}}

