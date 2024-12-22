
var rainbowscreen:FlxBackdrop;
import funkin.options.OptionsMenu;
import funkin.menus.ModSwitchMenu;
import funkin.menus.credits.CreditsMain;
import flixel.addons.display.FlxBackdrop;
import flixel.ui.FlxButton;
var icons:Map<String, Dynamic> = [
	"discord" => "https://discord.gg/ron-874366610918473748",
	"settings" => new OptionsMenu(),
	"freeplay" => new FreeplayState(),
];
var camText:FlxCamera;
public var leftState:Bool = false;
public var curClicked:String = "";
var clickAmounts:Int = 0;
var buttons:Array<FlxButton> = [];
var clicked:Bool = false;
var time:Float = 0;
var transitioningToIdiotism:Bool = false;
var window:FlxSprite;
var ywindow:Float = FlxG.height/2-203;
var tweening:Bool = false;
function create() {
	if (FlxG.save.data.rtx == null) FlxG.save.data.rtx = false;
	CoolUtil.playMenuSong();
	var iconI:Int = 0;
	var iconFrames = Paths.getFrames("menus/freeplay/freeplay select/menuIcons");
	var sanstitre = new FlxBackdrop(Paths.image('menus/desktop/sanstitre'), FlxAxes.XY, 0, 0);
	rainbowscreen = new FlxBackdrop(Paths.image('menus/desktop/rainbowpcBg'), FlxAxes.XY, 0, 0);
	var rainbTmr = new FlxTimer().start(0.005, function(tmr:FlxTimer)
	{
		rainbowscreen.x += (Math.sin(time)/5)+2;
		rainbowscreen.y += (Math.cos(time)/5)+1;
		sanstitre.setPosition(rainbowscreen.x,rainbowscreen.y);
		tmr.reset(0.005);
	});
	add(sanstitre);
	add(rainbowscreen);
	add(new FlxSprite().loadGraphic(Paths.image("menus/desktop/pcBg")));
	
	window = new FlxSprite(FlxG.width/1.3-405,ywindow);
	window.frames = Paths.getSparrowAtlas('menus/desktop/menuCarNew');
	window.animation.addByPrefix('window', 'window', 24, true);
	window.animation.play('window');
	window.angle = 3;
	FlxTween.tween(window, {y: ywindow + 10, angle: -3}, 1, {ease: FlxEase.circInOut, type: 4});
	window.scale.set(1.5,1.5);
	add(window);
				
	for (i in icons.keys()) {
		var button:FlxButton;
		button = new FlxButton((iconI > 2 ? 180 : 20), 20 + (150 * (iconI > 2 ? iconI - 3:iconI)), "", function() {
			if (curClicked != i) {
				clickAmounts = 0;
				curClicked = i;
				for (i in buttons)
					i.color = 0xffffff;
			}
			if (curClicked == i) {
				clickAmounts++;
				button.color = 0xFF485EC2;
				if (clickAmounts == 2) {
					if (icons[i] == "story mode is idiot") {
						if (transitioningStory) {return;}
						transitioningStory = true;
						//StoryMenuState.musicTime = FlxG.sound.music.time;
						//new StoryMenuState();
						//transitioningToIdiotism = true;
						//rainbTmr.cancel();
						//new FlxTimer().start(1.5, function(tmr:FlxTimer){
						//	FlxG.camera.fade(0x88FFFFFF, 0.6, false);
						//	new FlxTimer().start(2, function(tmr:FlxTimer){ FlxG.switchState(new StoryMenuState()); FlxG.camera.fade(0x88FFFFFF, 0, true);});
						//});
						var video:misc.MP4Handler = new misc.MP4Handler();
						openSubState(new misc.CustomFadeTransition(.8, false));
						new FlxTimer().start(.5, function(tmr:FlxTimer)
						{
							trace("hi");
						});
					}
					else if (icons[i].length != 0)
						CoolUtil.openURL(icons[i]);
					else
						FlxG.switchState(icons[i]);
				}
					
			}
			clicked = true;
		});
		button.frames = iconFrames;
		button.animation.addByPrefix("normal", i);
		button.animation.addByPrefix("highlight", i);
		button.animation.addByPrefix("pressed", i);
		button.allowSwiping = false;
		add(button);
		buttons.push(button);
		iconI++;
	}
}
function update(elapsed:Float) {
	if (FlxG.sound.music.volume < 0.8)
		FlxG.sound.music.volume += 0.5 * elapsed;
	if (FlxG.keys.justPressed.SEVEN) {
		persistentUpdate = false;
		persistentDraw = true;
		import funkin.editors.EditorPicker;
		openSubState(new EditorPicker());
	}

	if (controls.SWITCHMOD) {
		openSubState(new ModSwitchMenu());
		persistentUpdate = false;
		persistentDraw = true;
	}

	FlxG.mouse.visible = true;
	if (FlxG.keys.pressed.CONTROL && FlxG.keys.justPressed.R) add(new RunTab());
}
import flixel.group.FlxSpriteGroup;
import flixel.addons.ui.FlxInputText;
class RunTab extends flixel.FlxBasic {
	public var rtx = new CustomShader("NVIDIA RTX Architecture");
	public var runGroup:FlxSpriteGroup;
	public var tab:FlxSprite;
	public var ok:FlxButton;
	public var cancel:FlxButton;
	public var exit:FlxButton;
	public var help:FlxButton;
	public var field:FlxInputText;
	public var tabBar:FlxButton;
	var t = Paths.getSparrowAtlas("menus/desktop/windowsUi/run tab");
	public var movingTab = false;
	public function new() {
		super();
		field = new FlxInputText(58, 643, 270, "", 18);
		field.font = Paths.font("w95.otf");
		field.callback = function(text, action) {
			if (action == "input") FlxG.sound.keysAllowed = false;
			if (action == "enter") {
				triggerRunEvent(field.text);
				destroy();
			}
		}
		runGroup = new FlxSpriteGroup();
		runGroup.add(field);
		FlxG.state.add(runGroup);
		tab = new FlxSprite(0, 560);
		tab.frames = t;
		tab.animation.addByPrefix("d", "tab");
		tab.animation.play("d");
		runGroup.add(tab); //270 text field length
		ok = new FlxButton(177, 685, "", function() {
			triggerRunEvent(field.text);
			runGroup.destroy();
		});
		cancel = new FlxButton(258, 685, "", function() {
			FlxG.sound.keysAllowed = true;
			runGroup.destroy();
		});
		help = new FlxButton(308, 566, "", function() {
			CoolUtil.openURL("www.facebook.com");
		});
		exit = new FlxButton(327, 566, "", cancel.onUp.callback);
		for (i=>button in [ok, cancel, help, exit]) {
			button.frames = t;
			var animIndex = ["ok", "cancel", "help", "exit"];
			button.animation.addByPrefix("normal", animIndex[i] + " neutral");
			button.animation.addByPrefix("highlight", animIndex[i] + " neutral");
			button.animation.addByPrefix("pressed", animIndex[i] + " pressed");
			button.updateHitbox();
			runGroup.add(button);
		}
		help.setSize(15,13);
		exit.setSize(15,13);
		tabBar = new FlxButton(0, 560, "");
		tabBar.width = 347;
		tabBar.height = 20;
		tabBar.alpha = 0;
		tabBar.allowSwiping = true;
		runGroup.add(tabBar);
	}
	public override function update(elapsed) {
		super.update(elapsed);
		if (tabBar.status == 2)
			if (FlxG.mouse.justPressed) movingTab = true;
		if (movingTab) {
			runGroup.x += FlxG.mouse.deltaX;
			runGroup.y += FlxG.mouse.deltaY;
			if (FlxG.mouse.justReleased) movingTab = false;
		}
	}
	public function triggerRunEvent(runText) {
		FlxG.sound.keysAllowed = true;
		switch (runText) {
			case "teevee": CoolUtil.browserLoad("https://youtu.be/X9hIJDzo9m0");
			case "full" | "full version" | "2.5" | "3.0" | "demo 3" | "next demo": CoolUtil.openURL("https://youtu.be/pNzGTCEmf3U");
			case "2012": 
				rainbowscreen.visible = false;
				FlxG.sound.play(Paths.sound('vine'));
			case "winver": FlxG.state.add(new Winver());
			case "passionatedevs": FlxG.game.addShader(rtx);
			default: if (runText.contains("www") || runText.contains("http") || runText.contains("com")) CoolUtil.openURL(runText);
		}
	}
}

class Winver extends flixel.FlxBasic {
	public var runGroup:FlxSpriteGroup;
	public var tab = new FlxSprite(55, 55).loadGraphic(Paths.image("menus/desktop/windowsUi/winver"));
	public var ok:FlxButton;
	public var exit:FlxButton;
	public var tabBar:FlxButton;
	public function new() {
		super();
		runGroup = new FlxSpriteGroup();
		FlxG.state.add(runGroup);
		runGroup.add(tab);
		ok = new FlxButton(175, 238, "", function() {
			runGroup.destroy();
		});
		exit = new FlxButton(340, 60, "", ok.onUp.callback);
		for (i=>button in [ok,exit]) {
			button.frames = Paths.getSparrowAtlas("menus/desktop/windowsUi/run tab");
			var animIndex = ["ok", "exit"];
			button.animation.addByPrefix("normal", animIndex[i] + " neutral");
			button.animation.addByPrefix("highlight", animIndex[i] + " neutral");
			button.animation.addByPrefix("pressed", animIndex[i] + " pressed");
			button.updateHitbox();
			runGroup.add(button);
		}
		tabBar = new FlxButton(55, 55, "");
		tabBar.width = 305;
		tabBar.height = 20;
		tabBar.alpha = 0;
		tabBar.allowSwiping = true;
		runGroup.add(tabBar);
	}
	var movingTab = false;
	override function update(elapsed) {
		super.update(elapsed);
		if (tabBar.status == 2)
			if (FlxG.mouse.justPressed) movingTab = true;
		if (movingTab) {
			runGroup.x += FlxG.mouse.deltaX;
			runGroup.y += FlxG.mouse.deltaY;
			if (FlxG.mouse.justReleased) movingTab = false;
		}
	}
}