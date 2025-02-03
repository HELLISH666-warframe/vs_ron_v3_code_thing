var time:Float = 0;
var iTime:Float = 0;
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var wig:CustomShader  = new CustomShader("glitchsmh");

function postCreate(){}

override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [chromeOffset*Math.sin(time)];
	chrom.data.bOffset.value = [-chromeOffset*Math.sin(time)];
	wig.data.iTime.value = [0.005*Math.sin(time)];
}

function stepHit(curStep){
{

	switch(curStep){
		case 256:
			camGame.flash(FlxColor.WHITE, 0.2);
			if (FlxG.save.data.chrom) {
			FlxG.camera.addShader(chrom);
//			camHUD.addShader(chrom);
			chrom.data.rOffset.value = [chromeOffset/2];
			chrom.data.gOffset.value = [0.0];
			chrom.data.bOffset.value = [chromeOffset * -1];
			}
			if (FlxG.save.data.glitch) {
				FlxG.camera.addShader(wig);
//			camHUD.addShader(wig);
			wig.data.iTime.value = [2,2];
			wig.data.on.value = [1.];
			}
	}
}
}
