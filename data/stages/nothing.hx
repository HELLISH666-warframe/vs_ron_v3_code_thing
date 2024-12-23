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
    nothing.visible = false;
    trans.visible = false;
    healthBarBG.visible = false;
    healthBar.visible = false;
    scoreTxt.visible = false;
    iconP1.visible = false;
    iconP2.visible = false;
}
function stepHit(step)
{
    switch (step)
    {
        case 250:
            defaultCamZoom += 0.2;
        case 256:
            camHUD.color = FlxColor.WHITE;
            healthBarBG.alpha = 1;
            healthBar.alpha = 1;
            scoreTxt.alpha = 1;
            iconP1.visible = true;
            iconP2.visible = true;
            trans.visible = true;
            nothing.visible = true;
        case 768:
            insert(members.indexOf(trans), blackeffect); 
            baro.visible = true;
            bart.visible = true;
            trans.color = FlxColor.fromRGB(224,224,224);
        case 1280:
            remove(blackeffect);
            baro.visible = false;
            bart.visible = false;
            trans.color = FlxColor.fromRGB(255,255,255);
    }
}