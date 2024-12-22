var wig:CustomShader  = new CustomShader("glitchsmh");
var chrom:CustomShader  = new CustomShader("chromatic aberration");
var time:Float = 0;

override function update(elapsed:Float){time += elapsed;
	chrom.data.rOffset.value = [0.005*Math.sin(time)];
	chrom.data.bOffset.value = [-0.005*Math.sin(time)];
	wig.data.iTime.value = [0.005*Math.sin(time)];}
function postCreate() {
}
				FlxG.camera.shake(0.00625, 0.1);

			camHUD.shake(0.00125, 0.15);
function stepHit(step)
{
	switch (step)
	{
	case 384:
		FlxG.camera.addShader(chrom);
		camHUD.addShader(chrom);
		chrom.data.rOffset.value = [1/2];
		chrom.data.gOffset.value = [0.0];
		chrom.data.bOffset.value = [1 * -1];
		FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
		FlxG.camera.addShader(wig);
		camHUD.addShader(wig);
		wig.data.on.value = [1.];
		camHUD.shake(0.002);
		defaultCamZoom = 0.8;
		case 1432:
			FlxTween.tween(camHUD, {alpha: 0}, 2, {ease: FlxEase.circInOut});
		case 1490:
			defaultCamZoom = 1;
			//stupid
			dad.playAnim('hey',true);
		dad.specialAnim = true;
		dad.heyTimer = 9999;
	}
	if ((curStep >= 384) && (curStep <= 640))
		FlxG.camera.shake(0.00625, 0.1);
	
	camHUD.shake(0.00125, 0.15);
}