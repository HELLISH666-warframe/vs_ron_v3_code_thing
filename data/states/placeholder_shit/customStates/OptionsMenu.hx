import funkin.backend.system.framerate.Framerate;
import funkin.backend.utils.DiscordUtil;

function postCreate() {
    var bg:FlxSprite = new FlxSprite().makeSolid(FlxG.width, FlxG.height, FlxColor.fromRGB(17,5,33));
    bg.scrollFactor.set(0,0);
    //insert(1, bg); // 1 is right after bg WHICH IS NOT A VAR FOR SOME REASON!!!11


	for (option in main.members)
		if (option.desc == "Modify mod options here")
			main.members.remove(option);

	var vigentte:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menus/black_vignette"));
	vigentte.alpha = 0.25; vigentte.scrollFactor.set(0,0);
	add(vigentte);

	DiscordUtil.changePresence('Scrolling Through Menus...', "Settings");
}

function update(elapsed:Float) {
	Framerate.offset.y = pathBG.height;
}
