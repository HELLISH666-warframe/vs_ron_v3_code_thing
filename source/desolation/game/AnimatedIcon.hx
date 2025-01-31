import flixel.ui.FlxBar;
import Xml;
import haxe.Exception;

class AnimatedIcon extends Alphabet {
	public var forceX:Float = Math.NEGATIVE_INFINITY;
	public var isMenuItem:Bool = false;

	public var trackingSpr:FlxSprite;
	public var autoOffset:Bool = true;

	override function update(elapsed:Float) {
		{
			if (trackingSpr != null) {
				trackingSpr.setPosition(forceX - (25 + trackingSpr.width), y + (height / 2) - (trackingSpr.height / 2));
			}
			if(forceX != Math.NEGATIVE_INFINITY) 
				x = forceX;
			var it:Int = 0;
			if (autoOffset)
				for (i in this.members) {
					if (it != 0 && i != null) i.offset.x = ((1 - i.scale.x) * 50) * it;
					it++;
				}
			if (isMenuItem)
			{
				var scaledY = FlxMath.remapToRange(targetY, 0, 1, 0, 1.3);
	
				var lerpVal:Float = CoolUtil.boundTo(elapsed * 8., 0, 1);
				y = FlxMath.lerp(y, (scaledY * yMult) + (FlxG.height * 0.48) + yAdd, lerpVal);
				if(forceX == Math.NEGATIVE_INFINITY) {
					x = FlxMath.lerp(x, (targetY * 20) + 90 + xAdd, lerpVal);
				}
			}
		}
		super.update(elapsed);
	}}