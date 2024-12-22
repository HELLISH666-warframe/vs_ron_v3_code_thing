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
{
    var creditJSON:Dynamic;
	var nameGroup = [];
	var curSelected:Int = 0;
	var largePortrait:FlxSprite;
	var dividingBar:FlxSprite = new FlxSprite(775, 400).makeGraphic(400, 5);
	var descText:FlxText;
	var socialMediaText:FlxText;
	var socialMediaFavicon:FlxSprite;
	var time:Float = 0;
  var done = false;
   var	bg:FlxSprite;
   var credits:Array<{name:String,role:String,description:String,social_link:String}> = [];

override function create(){
    var bg:FlxSprite = CoolUtil.loadAnimatedGraphic(members[0], Paths.image ('menus/freeplay/classicbgAnimate'));
    members[0].scale.set(2,2);
    members[0].updateHitbox();
	add(bg);
    bg.y = 90;
    bg.x = 0;
	bg.color = FlxColor.RED;
   var data:Xml = Xml.parse(Assets.getText(Paths.file("data/config/credits.xml"))).firstElement();
}}
