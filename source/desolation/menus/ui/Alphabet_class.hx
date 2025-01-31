import flixel.ui.FlxBar;
import Xml;
import haxe.Exception;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxTimer;

class Alphabet_class extends FlxSprite {
	public var forceX:Float = Math.NEGATIVE_INFINITY;
	public var trackingSpr:FlxSprite;
	public var autoOffset:Bool = true;
	public function new(x:Float, y:Float, text:String = "", ?bold:Bool = false, typed:Bool = false, ?typingSpeed:Float = 0.05, ?textSize:Float = 1) { // it also has to start with the same arguments as the super class, (limitation for now)
		super(x, y, graphic); // this does nothing currently, its purely visual for now, but it will be used in the future
		forceX = Math.NEGATIVE_INFINITY;
		this.textSize = textSize;
		//other code stuff
	}
	
	override function update(elapsed:Float)	{
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

		super.update(elapsed);
	}
	public function new(x:Float, y:Float, textSize:Float)
		{
			super(x, y);
			var tex = Paths.getSparrowAtlas('alphabet');
			frames = tex;
	
			setGraphicSize(Std.int(width * textSize));
			updateHitbox();
			this.textSize = textSize;
			antialiasing = ClientPrefs.globalAntialiasing;
		}
}