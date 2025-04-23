var time:Float = 0;
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var glitch:CustomShader  = new CustomShader("glitchsmh");
override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
	glitch.data.iTime.value = [0.005*Math.sin(time)];
}
function beatHit(curBeat){
	if (curBeat == 64)
	{
		camGame.flash(FlxColor.WHITE, 0.2);
		if (FlxG.save.data.chrom) {
		FlxG.camera.addShader(chrom);
		chrom.data.rOffset.value = [chromeOffset/2];
		chrom.data.bOffset.value = [chromeOffset * -1];
		}
		if (FlxG.save.data.glitch) {FlxG.camera.addShader(glitch);
		glitch.data.on.value = [1.];
		}
	}
}