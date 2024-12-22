import flixel.text.FlxTextBorderStyle;

var resumeSpr:FlxSprite;
var restartSpr:FlxSprite;
var controlsSpr:FlxSprite;
var optionsSpr:FlxSprite;
var exitToMenu:FlxSprite;
function postCreate(){
    for (i=>sprite in members)
        sprite.visible = sprite.active = false;

    var bar:FlxSprite = new FlxSprite(-300, -180).loadGraphic(Paths.image('game/pause/pauseSongBar'));
	bar.scale.set(0.7, 0.7);
	bar.antialiasing = true;
	add(bar);

    var bg:FlxSprite = new FlxSprite(-300, -180).loadGraphic(Paths.image('game/pause/pauseMenuLeft'));
	bg.scale.set(0.7, 0.7);
    //garfield.scrollFactor.set(0,0);
	//garfield.updateHitbox();
	bg.antialiasing = true;
	add(bg);

    for(i=>option  in [resumeSpr,restartSpr,controlsSpr,optionsSpr,exitToMenu]){
        var yeye = new FlxSprite(0, 1 * i * 15).loadGraphic(Paths.image(switch(i){
            case 0:
                'game/pause/RESUME';
            case 1:
                'game/pause/RESTART';
            case 2:
                'game/pause/controls';
            case 3:
                'game/pause/OPTIONS';
            case 4:
                'game/pause/EXIT';
        }));
        yeye.scrollFactor.set();
        yeye.ID = i;
        yeye.scale.set(0.7, 0.7);
        yeye.x = -300;
        yeye.y = -150;
        add(yeye);

        switch(i){
            case 0:
                resumeSpr = yeye;
            case 1:
                restartSpr = yeye;
            case 2:
                controlsSpr = yeye;
            case 3:
                optionsSpr = yeye;
            case 4:
                exitToMenu = yeye;
        }
    }

    var levelInfo:FlxText = new FlxText(40, 15, 0, PlayState.SONG.meta.displayName, 32);
	var multiplayerText:FlxText = new FlxText(20, 15, 0, PlayState.opponentMode ? 'OPPONENT MODE' : (PlayState.coopMode ? 'CO-OP MODE' : ''), 32);

    for(k=>label in [levelInfo, multiplayerText]) {
        label.scrollFactor.set();
        label.setFormat(Paths.font('w95.otf'), 25, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.fromRGB(10, 16, 19));
        label.borderSize = 3;
        label.updateHitbox();
        label.alpha = 0;
        label.x = FlxG.width - 439 - (label.width + 20);
        label.y = 688 + (32 * k);
        FlxTween.tween(label, {alpha: 1, y: label.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.3 * (k+1)});
        add(label);
    }

    }
function update(elapsed){
    if (pauseMusic.volume < 0.5)
        pauseMusic.volume += 0.1 * elapsed;

    if(exitToMenu == null) return;

    resumeSpr.alpha = (curSelected == 0) ? 1 : 0.5;
    restartSpr.alpha = (curSelected == 1) ? 1 : 0.5;
    controlsSpr.alpha = (curSelected == 2) ? 1 : 0.5;
    optionsSpr.alpha = (curSelected == 3) ? 1 : 0.5;
    exitToMenu.alpha = (curSelected == 4) ? 1 : 0.5;
}