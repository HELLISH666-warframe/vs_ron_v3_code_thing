public var chromeOffset = (FlxG.save.data.chromeOffset/350);
public var bar1:FlxSprite;
public var bar2:FlxSprite;
public var camOther:HudCamera;
function postCreate() {
    FlxG.cameras.remove(camHUD, false);
    FlxG.cameras.add(camOther = new HudCamera(), false);
    camOther.bgColor = 0x00000000;
    FlxG.cameras.add(camHUD, false);
    bar1 = new FlxSprite(-2400, -560).makeGraphic(2400 * 2, 560, 0xFF000000);
    bar2 = new FlxSprite(-2400, 720).makeGraphic(2400 * 2, 560, 0xFF000000);
    bar1.cameras=[camOther];
    bar2.cameras=[camOther];
    insert(1,bar1);
    insert(1,bar2);
    bar2.y=720;
    bar1.y=-560;
}