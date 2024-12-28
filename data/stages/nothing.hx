var baro:FlxSprite;
var bart:FlxSprite;
var blackeffect:FlxSprite;


baro = new FlxSprite().makeGraphic(150, FlxG.height*3, FlxColor.BLACK);
bart = new FlxSprite().makeGraphic(150, FlxG.height*3, FlxColor.BLACK);
add(baro);
add(bart);
    
blackeffect = new FlxSprite();
blackeffect.loadGraphic(Paths.image('stages/nothing/scanlines'));
blackeffect.antialiasing = false;
blackeffect.active = false;
blackeffect.scrollFactor.set();
blackeffect.screenCenter();
blackeffect.scale.set(4,4);
FlxTween.tween(blackeffect, {alpha: 0.5}, 0.5, {ease: FlxEase.circInOut, type: FlxTween.PINGPONG});

baro.x = 0;
baro.scrollFactor.set();
baro.cameras = [camHUD];
            
bart.x = FlxG.width-150;
bart.scrollFactor.set();
bart.cameras = [camHUD];

baro.visible = false;
bart.visible = false;
function postCreate() {
    graadienter.color = FlxColor.BLACK;
    wbg.color = FlxColor.BLACK;
}
function stepHit(step)
{
    switch (step)
    {
        case 250:
            defaultCamZoom += 0.2;
        case 256:
		graadienter.color = FlxColor.WHITE;
		wbg.color = FlxColor.WHITE;
        case 768:
            insert(members.indexOf(graadienter), blackeffect); 
            baro.visible = true;
            bart.visible = true;
            graadienter.color = FlxColor.fromRGB(224,224,224);
            wbg.color = FlxColor.fromRGB(224,224,224);
        case 1280:
            remove(blackeffect);
            baro.visible = false;
            bart.visible = false;
            graadienter.color = FlxColor.fromRGB(255,255,255);
            wbg.color = FlxColor.fromRGB(255,255,255);
    }
}