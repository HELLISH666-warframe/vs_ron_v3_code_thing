
var explode:FlxSound;
explode = FlxG.sound.load(Paths.sound("hellexplode"));

function postCreate() {
	sky.visible = false;
	city.visible = false;
	mountains.visible = false;
    street.visible = false;
	escape_fire.visible = false;
	lava.visible = false;
	bloodshed_lamp.visible = false;
	space.visible = false;
	earth.visible = false;
    freindly.visible = false;
}
function stepHit(curStep)
    {
        switch (curStep)
        {
            case 128:
                sky.visible = true;
                city.visible = true;
                mountains.visible = true;
                mountains.y -= 60;
                street.visible = true;
                FlxG.camera.flash(FlxColor.WHITE, 1);
                //FlxTween.angle(satan, 0, 359.99, 0.75, { type: FlxTweenType.LOOPING } );
                cameraSpeed = 2;
            case 320:
                FlxTween.tween(satan, {y: satan.y - 700, angle: 359.99}, 3, {ease: FlxEase.circInOut});
            case 368:
                defaultCamZoom = 1;
            case 376:
                FlxG.camera.shake(0.03, 1);
            //case 382:
               // exploders.animation.play('explosion');
            case 384:
                cameramove = true;
                lava.visible = true;
                escape_fire.visible = true;
                defaultCamZoom = 0.7;
                cameraSpeed = 8;
                FlxG.sound.play(Paths.sound('hellexplode'), 0.7);
                FlxG.camera.flash(FlxColor.WHITE, 1);
                camFollow.y -= 10400;
                boyfriend.y -= 10400;
                dad.y -= 10400;
                islands.y = boyfriend.y + 4700;
                FlxTween.tween(boyfriend, {x: boyfriend.x + 300}, 0.5, {ease: FlxEase.circOut});
                FlxTween.tween(dad, {x: dad.x - 300}, 0.5, {ease: FlxEase.circOut});
                FlxTween.tween(dad, {y: dad.y + 5600}, 23, {ease: FlxEase.circIn});
                FlxTween.tween(boyfriend, {y: boyfriend.y + 5600}, 23, {ease: FlxEase.circIn});
                FlxTween.tween(boyfriend, {angle: 359.99 * 4}, 23);
            case 512:
                defaultCamZoom = 0.75;
                cameraSpeed = 2.5;
            case 576:
                islands.visible = true;
                Estatic2.visible = true;
                FlxTween.tween(dad, {y: dad.y + 5600}, 5.4, {ease: FlxEase.quadIn});
                FlxTween.tween(boyfriend, {y: boyfriend.y + 5600}, 5.4, {ease: FlxEase.quadIn});
                defaultCamZoom = 0.85;
                cameraSpeed = 2;
            case 632:
                defaultCamZoom = 1.1;
            case 640:
                cameraSpeed = 1.5;
                cameramove = false;
                defaultCamZoom = 0.7;
                FlxTween.tween(camGame, {angle: 0}, 1, {ease: FlxEase.circOut});
                FlxTween.tween(camHUD, {angle: 0}, 1, {ease: FlxEase.circOut});
                FlxG.camera.flash(FlxColor.WHITE, 1);
            case 896: 
                cameramove = true;
                islands.visible = false;
                FlxG.camera.flash(FlxColor.WHITE, 1);	
                FlxG.sound.play(Paths.sound('hellexplode'), 0.7);
                dad.y -= 5400;
                boyfriend.y -= 5400;
                FlxTween.tween(boyfriend, {angle: 359.99 * 8}, 23);
            case 1016:
                satan.y = boyfriend.y + 2000;
                FlxTween.tween(satan, {y: boyfriend.y - 2000}, 4);
            case 1136:
                cameramove = false;
                FlxTween.tween(dad, {y: dad.y - 1000}, 1, {ease: FlxEase.quadIn});
                FlxTween.tween(boyfriend, {y: boyfriend.y - 1000}, 1, {ease: FlxEase.quadIn});
                camGame.fade(0xFFFFFFFF, (Conductor.stepCrochet/1000)*14);
                FlxTween.tween(camGame, {angle: 0}, 0.3, {ease: FlxEase.circOut});
                FlxTween.tween(camHUD, {angle: 0}, 0.3, {ease: FlxEase.circOut});
            case 1151: 
                defaultCamZoom = 0.7;
                FlxG.camera.flash(FlxColor.WHITE, 1);	
                //FlxTween.angle(boyfriend, 0, boyfriend.angle + 359.99, 3, { type: FlxTweenType.LOOPING } );
                //FlxTween.angle(freindly, 0, 5, 3, { type: FlxTweenType.PINGPONG } );
                camGame.fade(0xFFFFFFFF, 0.1, true);
                intensecameramove = true;
                space.visible = true;
                earth.visible = true;
                freindly.visible = true;
                defaultCamZoom -= 0.1;
                dad.y += 9400;
                boyfriend.y = dad.y+650;
        }
    }