import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.util.FlxTimer;
import flixel.addons.transition.Transition;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.FlxTransitionSprite;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileCircle;
import flixel.addons.transition.FlxTransitionSprite.TransitionStatus;
import flixel.addons.transition.TransitionData;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;
import flixel.FlxSubState;
import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;
import flixel.FlxCamera;

	public static var finishCallback:Void->Void;
	var leTween:FlxTween = null;
	public static var nextCamera:FlxCamera;
	var duration:Float = 0.7;
	var isTransIn1:Bool = false;

function create() {
	trace('fuck');

	var zoom:Float = FlxMath.bound(FlxG.camera.zoom, 0.05, 1);
	var width:Int = Std.int(FlxG.width / zoom);
	var height:Int = Std.int(FlxG.height / zoom);

	var transData = new TransitionData("TILE", 0xFFFFFF, duration, new FlxPoint(0,1));
	transData.tileData = {width: 32, height: 32, asset: FlxGraphic.fromBitmapData(new GraphicTransTileCircle(0, 0, true, 0xFF000F))};
	new FlxTimer().start(0.000000000000000000010000000000000000000100000000000000000001000000000000000000010000000000000000000100000000000000000001, function(tmr:FlxTimer) {FlxG.switchState(new ModState("DesktopState"));	trace('err43trefdg');});

}
override function destroy() {
	if(leTween != null) {
		finishCallback();
		leTween.cancel();
	}
}
override function finishCallback(){
	trace('err43trefdg');
	FlxG.switchState(new ModState("DesktopState"));
}

