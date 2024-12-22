//almost_all_of_this_is_by_"frakits"
import funkin.editors.ui.UIState;
import funkin.backend.utils.WindowUtils;
import funkin.backend.system.Main;
import funkin.menus.MainMenuState;
import lime.app.Application;
import funkin.backend.scripting.ModState;
import flixel.graphics.FlxGraphic;
import flixel.FlxG;
import lime.graphics.Image;
import Type;
function update() {
    FlxG.autoPause = false;
    Main.framerateSprite.codenameBuildField.text = "REAL Memory Counter: " + 193759 + "TB\nThe REAL FL Studio 21.1.1.3750";
}
WindowUtils.winTitle = "versus literly every fanmade mod ever";
window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('icon'))));
var redirectStates:Map<FlxState, String> = [
    MainMenuState => "DesktopState", 
];

function preStateSwitch() {
    for (redirectState in redirectStates.keys()) 
        if (Std.isOfType(FlxG.game._requestedState, redirectState)) 
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}