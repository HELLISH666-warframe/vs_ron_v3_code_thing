function postCreate() {
    wbg = new FlxSprite().makeGraphic(FlxG.width*3, FlxG.height*3, FlxColor.BLACK);
    wbg.scale.set(5,5);
    wbg.updateHitbox();
    wbg.screenCenter();
    wbg.scrollFactor.set();
    wbg.alpha = 0.35;

    fx = new FlxSprite().loadGraphic(Paths.image('stages/effect'));
    fx.setGraphicSize(Std.int(2560 * 0.75));
    fx.updateHitbox();
    fx.antialiasing = true;
    fx.screenCenter();
    fx.scrollFactor.set(0, 0);
    fx.alpha = 0.5;	
	
	darkbackground.visible = false;
	background.visible = true;
}
function stepHit(step)
{
    switch (step)
    {
        case 256:
            background.visible = false;
            darkbackground.visible = true;
            add(fx);
			add(wbg);
    }
}