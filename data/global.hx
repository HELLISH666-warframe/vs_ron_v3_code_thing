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
function new()
    {   
        //SAVE DATA VARIABLES
        //accolades
        if (FlxG.save.data.seenAccolades == null) FlxG.save.data.seenAccolades = false;
        //planets themselves
        if (FlxG.save.data.songsBeaten == null) FlxG.save.data.songsBeaten = [];    
    

        if (FlxG.save.data.glitch == null) FlxG.save.data.glitch = true;
        if (FlxG.save.data.chrom == null) FlxG.save.data.chrom = true;
        if (FlxG.save.data.mosaic == null) FlxG.save.data.mosaic = true;
        if (FlxG.save.data.crt == null) FlxG.save.data.crt = true;
        if (FlxG.save.data.staticy == null) FlxG.save.data.staticy = true;
        //if (FlxG.save.data.saturation == null) FlxG.save.data.saturation = true;
        //if (FlxG.save.data.drunk == null) FlxG.save.data.drunk = true;
        if (FlxG.save.data.vhs == null) FlxG.save.data.vhs = true;
        if (FlxG.save.data.rain == null) FlxG.save.data.rain = true;
    
        if (FlxG.save.data.pussy == null) FlxG.save.data.pussy = true;
        if (FlxG.save.data.warning == null) FlxG.save.data.warning = true;
        if (FlxG.save.data.flashing == null) FlxG.save.data.flashing = true;
    
    }
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