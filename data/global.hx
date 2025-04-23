//almost_all_of_this_is_by_"frakits"
import funkin.backend.utils.WindowUtils;
import funkin.menus.MainMenuState;
import funkin.menus.StoryMenuState;
import lime.graphics.Image;
allowGitaroo = false;
function new()
{   
    if (FlxG.save.data.glitch == null) FlxG.save.data.glitch = true;
    if (FlxG.save.data.chrom == null) FlxG.save.data.chrom = true;
    if (FlxG.save.data.chromeOffset == null) FlxG.save.data.chromeOffset = 0.5;
    if (FlxG.save.data.mosaic == null) FlxG.save.data.mosaic = true;
    if (FlxG.save.data.crt == null) FlxG.save.data.crt = true;
    if (FlxG.save.data.colour == null) FlxG.save.data.colour = true;
    if (FlxG.save.data.grey == null) FlxG.save.data.grey = true;
    if (FlxG.save.data.vhs == null) FlxG.save.data.vhs = true;
    if (FlxG.save.data.rain == null) FlxG.save.data.rain = true;
    
    if (FlxG.save.data.pussy == null) FlxG.save.data.pussy = true;
    if (FlxG.save.data.warning == null) FlxG.save.data.warning = true;
    if (FlxG.save.data.flashing == null) FlxG.save.data.flashing = true;
    if (FlxG.save.data.dev == null) FlxG.save.data.dev = false;

    if (FlxG.save.data.effort == null) FlxG.save.data.effort = true;
}
function update() {
    FlxG.autoPause = false;
    Main.framerateSprite.codenameBuildField.text = "STINKY_AND_MESSY" + "\nCODE_BUILD";
}
WindowUtils.winTitle = "vs literally every fnf fan mod ever";
window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('icon'))));
var redirectStates:Map<FlxState, String> = [
    MainMenuState => "DesktopState", 
    StoryMenuState => "DesktopState", 
];

function preStateSwitch() {
	for (redirectState in redirectStates.keys())
		if (FlxG.game._requestedState is redirectState)
			FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}
function postUpdate(elapsed:Float) {
    if (FlxG.keys.justPressed.F12)  FlxG.fullscreen = !FlxG.fullscreen;   
}
//thank_you_frakits_i_had_NO_idea_this_was_possible
function update(elapsed:Float)
if (FlxG.keys.justPressed.F6) {
FlxG.bitmap.clearCache();
FlxG.bitmap._cache.clear();
Paths.tempFramesCache.clear();
FlxG.resetState();
}