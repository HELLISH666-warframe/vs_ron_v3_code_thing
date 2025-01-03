import funkin.backend.utils.WindowUtils;
import flixel.input.keyboard.FlxKey;
import funkin.backend.assets.ModsFolder;
import lime.app.Application;
import lime.graphics.Image;

//public static var devBuild = true;


var uncapFPS = false;

var init = false;
function postStateSwitch()
{	
    if (!init)
    {
        init = true;

		//set window icon
		var icon:Image = Paths.assetsTree.getAsset("assets/images/_icon.png", "IMAGE");
		Application.current.window.setIcon(icon);

		
    }
	WindowUtils.winTitle = "Versus literally every engine port ever";

	if (uncapFPS)
		FlxG.drawFramerate = FlxG.updateFramerate = 1000;
}
function destroy()
{
	//set stuff back
    WindowUtils.winTitle = "Versus Ron Resurrection ' - VS Ron Resurrection";
    init = false;
}

function postUpdate(elapsed)
{
	if(uncapFPS && FlxG.stage != null)
		FlxG.stage.frameRate = FlxG.updateFramerate;
}