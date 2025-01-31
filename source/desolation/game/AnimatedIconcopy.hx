import flixel.ui.FlxBar;
import Xml;
import haxe.Exception;

class AnimatedIcon extends funkin.backend.FunkinSprite {
	public var curCharacter:String = 'oswald-sad';
	public var danceInterval:Int = 1;
	public var losing:Bool = false;

	public var healthBar:FlxBar = null;

	public var debug:Bool = false;

	public var xml:Xml = null;

	public var sprTracker:FlxSprite = null;

	public function new(char:String = 'oswald-sad', isPlayer:Bool = false, interval:Int = 1, health:FlxBar = null) {
		flipX = isPlayer;
		danceInterval = interval;
		healthBar = health;

		switchIcon(char);
	}

	public function switchIcon(char:String = 'oswald-sad') {
		curCharacter = char;

		try {
			if (!Assets.exists(Paths.xml('icons/' + char))) throw new Exception(curCharacter + '\'s icon xml doesnt exist');
			xml = Xml.parse(Assets.getText(Paths.xml('icons/' + char))).firstElement();

			frames = Paths.getSparrowAtlas('sd-icons/' + curCharacter);

			for (node in xml.elements()) {
				animation.addByPrefix(node.get('name'), node.get('anim'), Std.parseFloat(node.get('fps')), node.get('loop') == 'true');
				addOffset(node.get('name'), Std.parseFloat(node.get('x')), Std.parseFloat(node.get('y')));
			}

			playAnim(!losing ? 'normal' : 'losing', true);
		} catch(e:Exception) {
			trace(e);
			trace('loading placeholder icon for ' + (flipX ? 'player' : 'opponent'));
			switchIcon('oswald-sad');
		}

		antialiasing = true;
	}

	public override function addOffset(name:String, x:Float, y:Float)
		animOffsets[name] = FlxPoint.get(x, y);

	public function update(elapsed:Float) {
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);

		if (healthBar != null) {
			x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0)) - (!flipX ? width - 20 : 0));
			losing = ((healthBar.percent <= 25 && flipX) || (healthBar.percent >= 75 && !flipX));
		}
	}

	public function beatHit(curBeat:Int)
		if (curBeat % danceInterval == 0 && !debug)
			playAnim(!losing ? 'normal' : 'losing', !losing ? true : false);
}