import flixel.ui.FlxBar;
import flixel.math.FlxRect;

public var healthBarBG1:FlxSprite;
public var healthBarBG2:FlxSprite;
public var healthBar1:FlxBar;

public function evilbar() {
    healthBarBG1.loadGraphic(Paths.image("game/healthbar/healthBarintheworks2"));
    healthBarBG2.loadGraphic(Paths.image("game/healthbar/healthBarintheworks2"));
    for(i in [healthBarBG1 , healthBarBG2]){
        i.x-=100;
        i.y-=35;
    }
    iconP1.y -= 6;
    iconP2.y -= 6;
    healthBar1.setGraphicSize(800,Std.int(healthBar1.height));
    healthBar1.updateHitbox();
    healthBar1.screenCenter(FlxAxes.X);
    healthBar1.update(0);
    healthBarBG1.color = boyfriend.iconColor;
    healthBarBG2.color = dad.iconColor;
}

function create() {
    healthBarBG1 = new FlxSprite().loadGraphic(Paths.image('game/healthbar/healthBarintheworks'));
    healthBarBG2 = new FlxSprite().loadGraphic(Paths.image('game/healthbar/healthBarintheworks'));
    for(i in [healthBarBG1,healthBarBG2]){
        i.screenCenter(FlxAxes.X);
        i.y = FlxG.height * 0.87;
        i.scale.set(1,.85);
    }
    healthBar1 = new FlxBar(healthBarBG1.x + 4, healthBarBG1.y + 4, '', Std.int(healthBarBG1.width - 8), Std.int(healthBarBG1.height - 8), health, 0, 2);
}
function postUpdate(elapsed:Float) {
    healthBarBG1.clipRect = new FlxRect((2-health)/2*healthBarBG1.width,0,health/2*healthBarBG1.width,healthBarBG1.height);
    healthBarBG2.clipRect = new FlxRect(0,0,(2-health)/2*healthBarBG2.width,healthBarBG2.height);
    healthBarBG1.clipRect = healthBarBG1.clipRect;
    healthBarBG2.clipRect = healthBarBG2.clipRect; 
}
function postCreate() {
    switch(curSong)
    {
        case "ron-classic"|"wasted-classic"|"ayo-classic"|"bloodshed-classic"|"trojan-virus-classic"|"bleeding-classic":
        default:
        healthBarBG.alpha = healthBar.alpha=0.0001;
        insert(1,healthBarBG1);
        insert(1,healthBarBG2);
        healthBar1.createFilledBar(dad.iconColor,boyfriend.iconColor);
    
        healthBarBG1.color = boyfriend.iconColor;
        healthBarBG2.color = dad.iconColor;
        for(i in [healthBarBG1,healthBarBG2,healthBar1]){
            i.cameras = [camHUD];
        }
    }
}