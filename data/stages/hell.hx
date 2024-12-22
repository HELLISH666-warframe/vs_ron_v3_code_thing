import flixel.math.FlxRect;

public var leftBar:FlxSprite;
var rightBar:FlxSprite;
var hpBorder:FlxSprite;
var middleBar:FlxSprite;

public var barPos:Array<Float> = [FlxG.width * 0.184,FlxG.height * 0.75];
public var borderOffset:Array<Float> = [0,0];
public var hpScale:Float = 1;
public var cam = null;

//toofar stuff
public var far:Bool = false;
public var tfTails:Bool = false;

function create() {
    //BARS
    insert(0,rightBar = new FlxSprite().loadGraphic(Paths.image('game/healthbar/' +'/blood_bar')));
    rightBar.color = (boyfriend.iconColor != null ? boyfriend.iconColor : 0xFF00FF00);

    insert(1,leftBar = new FlxSprite().loadGraphic(Paths.image('game/healthbar/' + '/blood_bar')));
    leftBar.color = (dad.iconColor != null ? dad.iconColor : 0xFFFF0000);
    
    for (both in [rightBar,leftBar]){
        both.setGraphicSize(Std.int(both.width * hpScale));
        both.updateHitbox();
    }
    //BORDER
    insert(2,hpBorder = new FlxSprite().loadGraphic(Paths.image('game/healthbar/' + '/blood_border')));
    hpBorder.setGraphicSize(Std.int(hpBorder.width * hpScale));
    hpBorder.updateHitbox();
    //CAMErA
    for (all in [rightBar,leftBar,hpBorder]){
        all.camera = (cam != null ? cam : camHUD);
    }

    //ALL FOLLOWS LEFTBAR

    for (both in [hpBorder,rightBar]){
        both.onDraw = function(spr:FlxSprite) {
            spr.setPosition(leftBar.x + borderOffset[0], leftBar.y + borderOffset[1]);
            spr.draw();
        }
    }
}

public function hideHbar(thingB:Bool = false) {
    for (item in [rightBar,leftBar,hpBorder]) item.visible = !(thingB);

    if (far) middleBar.visible = !(thingB);
}

function postCreate(){//here let me do it for you
    for (uselessBar in [healthBar,healthBarBG]) uselessBar.visible = false;
    
    if (far){
        rightBar.color = (toofarTails.iconColor != null ? toofarTails.iconColor : 0xFF0000FF);

        insert(0,middleBar = new FlxSprite().loadGraphic(Paths.image('game/healthbar/'  + '/blood_bar')));
        middleBar.camera = (cam != null ? cam : camHUD);

        middleBar.setGraphicSize(Std.int(middleBar.width * hpScale));
        middleBar.updateHitbox();

        middleBar.color = (boyfriend.iconColor != null ? boyfriend.iconColor : 0xFF00FF00);
        middleBar.onDraw = function(spr:FlxSprite) {
            spr.setPosition(leftBar.x + borderOffset[0], leftBar.y + borderOffset[1]);
            spr.draw();
        }
    }
}

function update(){
    leftBar.setPosition(barPos[0],barPos[1]);

    if (rightBar != null && far){
        rightBar.setPosition(barPos[0],barPos[1]);
    }
}

var healthTarget:Float = 1;
var tailshealthTarget:Float = 1;
function postUpdate(elapsed:Float){

    healthTarget = lerp(healthTarget, health, elapsed / 0.32);
    if (far){
        tailshealthTarget = lerp(tailshealthTarget, obj.tailsFhp, elapsed / 0.5);
        if (rightBar != null) rightBar.clipRect = new FlxRect(leftBar.frameWidth * (tailshealthTarget / maxHealth), 0, rightBar.frameWidth, rightBar.frameHeight);
        
    }
    if (leftBar != null) leftBar.clipRect = new FlxRect(0, 0, (leftBar.frameWidth * (tfTails ? 0.5 : 1)) * (1 - (healthTarget / maxHealth)), leftBar.frameHeight);
    
    if (curSong == '60'){
        if (leftBar != null) 
            switch(curCameraTarget){
                case 0:
                    leftBar.color = (dad.iconColor != null ? dad.iconColor : 0xFFFF0000);
                case 2:
                    leftBar.color = (gf.iconColor != null ? gf.iconColor : 0xFF0000FF);
            }
    }
}