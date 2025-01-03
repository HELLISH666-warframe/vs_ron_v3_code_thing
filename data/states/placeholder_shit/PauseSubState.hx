import flixel.text.FlxTextBorderStyle;
import flixel.FlxCamera;
import flixel.util.FlxStringUtil;
{
var optionArray = ["resume song", "restart song", "log offq", "log off", "shut down"];
var optionButtons = [];
var curSelected = 0;
override function create() {
    var startMenu = new FlxSprite(0, 720).loadGraphic(Paths.image("windowsUi/start menu"));
    startMenu.y -= startMenu.height;
    add(startMenu);
    for (i in 0...optionArray.length) {
        var button = new FlxSprite(25, (723 - startMenu.height) + (34 * i) + (i > 1 ? 270 : 0));
        button.frames = Paths.getSparrowAtlas("windowsUi/win98buttons");
        button.animation.addByPrefix("unselect", optionArray[i] + " unselect");
        button.animation.addByPrefix("select", optionArray[i] + " select");
        button.ID = i;
        add(button);
        button.animation.play("unselect");
        optionButtons.push(button);
    }
        cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
        trace(cameras);
 }
    override function update(elapsed:Float) {
		for (i in optionButtons) {
			if (i.ID == curSelected) {i.animation.play("select");
				if (FlxG.keys.justPressed.ENTER) {
					var choice = optionArray[i.ID];
					switch (choice) {
						case "resume song": close();
						case "restart song": 		
                            parentDisabler.reset();
                            game.registerSmoothTransition();
                            FlxG.resetState();
                        case "log offq": 
                            persistentDraw = false;
                            openSubState(new KeybindsOptions());
                         case "shut down": 
                            TreeMenu.lastState = PlayState;
                            FlxG.switchState(new OptionsMenu());
						case "log off": 					
                            if (PlayState.chartingMode && Charter.undos.unsaved)
                                game.saveWarn(false);
                            else {
                                PlayState.resetSongInfos();
                                if (Charter.instance != null) Charter.instance.__clearStatics();
            
                                // prevents certain notes to disappear early when exiting  - Nex
                                game.strumLines.forEachAlive(function(grp) grp.notes.__forcedSongPos = Conductor.songPosition);
            
                                CoolUtil.playMenuSong();
                                FlxG.switchState(PlayState.isStoryMode ? new StoryMenuState() : new FreeplayState());
					}
				}
			}
        }			
        else i.animation.play("unselect");
    }
        if (controls.DOWN_P) curSelected += 1;
		if (controls.UP_P) curSelected -= 1;
		curSelected = (curSelected > optionArray.length - 1 ? 0 : (curSelected < 0 ? optionArray.length - 1 : curSelected));
		super.update(elapsed);
	}
}
