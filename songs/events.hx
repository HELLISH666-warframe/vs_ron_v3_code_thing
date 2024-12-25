import flixel.util.FlxColor;
import flixel.text.FlxText.FlxTextFormat;
import flixel.addons.display.FlxBackdrop;
import flixel.math.FlxRect;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText.FlxTextFormatMarkerPair;import StringTools;
if (Assets.exists(Paths.txt("songs/" + curSong + "/credits"))) {
	function onStartCountdown(event) {
		event.cancel();
	}
			var creditsText:String = txt.getText(Paths.file(("songs/" + curSong + "/credits")));
			var credits:FlxText = new FlxText(0, 0, 0, creditsText, 28);
			var creditsblack:FlxSprite = new FlxSprite().makeGraphic(600, FlxG.height*3, FlxColor.BLACK);
			var targety:Int = 0;
			
			credits.setFormat(Paths.font("w95.otf"), 24, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE,FlxColor.BLACK); 
			add(creditsblack);
			add(credits);
			credits.scrollFactor.set();
			credits.screenCenter();
			targety = Std.int(credits.y);
			credits.y = FlxG.camera.scroll.y+FlxG.height+40;
			
			creditsblack.scrollFactor.set();
			creditsblack.alpha = 0;
			creditsblack.screenCenter();
			
			creditsblack.cameras = [camHUD];
			credits.cameras = [camHUD];
			
			FlxTween.tween(creditsblack, {alpha: 0.5}, 0.5);
			FlxTween.tween(credits, {y: targety}, 0.5);
			
			new FlxTimer().start(5, function(tmr:FlxTimer)
			{
				FlxTween.tween(credits, {alpha: 0}, 3, {
					onComplete: function(tween:FlxTween)
					{
						credits.destroy();
					}
				});		
				FlxTween.tween(creditsblack, {alpha: 0}, 3, {
					onComplete: function(tween:FlxTween)
					{
						creditsblack.destroy();
					}
				});						
			});
		}

	function postCreate(){
		iconP1.setIcon('oldbf');
	}