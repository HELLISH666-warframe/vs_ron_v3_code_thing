import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.FlxG;
import haxe.Json;
import openfl.Assets;
import gameassets.Alphabet;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.math.FlxRandom;
import flixel.text.FlxText;
import openfl.display.BitmapData;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
   var done = false;
   var	bg:FlxSprite;

override function create(){
    var bg:FlxSprite = CoolUtil.loadAnimatedGraphic(new FlxSprite(), Paths.image('menus/freeplay/classicbgAnimate'));
    bg.animation.addByPrefix('animate', 'animate', 24, true);
	bg.color = FlxColor.RED;
	bg.scale.set(2,2);
	bg.updateHitbox();
	bg.screenCenter();
	add(bg);
}
