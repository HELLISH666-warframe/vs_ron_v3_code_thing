//yes_theres_two_i_have_to_or_else_on_healthdrain_doesnt_work_for_some_reaon
var healthLoss:Float = 1;
healthLoss = health -= 0.02;
if (!FlxG.save.data.pussy) {
    override function beatHit(){
        if (((dad.curCharacter == 'hellron-drippin') || (dad.curCharacter == 'bloodshedron')) && (curBeat % 2 == 0))
        {
            var multiplier:Float = 1;
            if (health >= 1)
                multiplier = 1;
            else
                multiplier = multiplier + ((1 - health));
            FlxG.camera.shake(0.025 * multiplier / 4, 0.1);
            camHUD.shake(0.0055 * multiplier / 4, 0.15);
            if (health > 0.5*healthLoss)
                health -= 0.5*healthLoss;
            else
                health = 0.03*healthLoss;

            iconP2.angle = 0;
            FlxTween.cancelTweensOf(iconP2);
            FlxTween.tween(iconP2, {angle: 359.99}, Conductor.crochet / 1200 * 2, {ease: FlxEase.circOut});
            iconP2.alpha = (2-(health)-0.25)/2+0.2;
            iconP1.alpha = (health-0.25)/2+0.2;
            
        }}
    {if ((dad.curCharacter == 'hellron') || (dad.curCharacter == 'classichellron') || (dad.curCharacter == 'bloodshedron') ||  (dad.curCharacter == "guitarhellron"))
            {{
                var multiplier:Float = 1;
                if (health >= 1)
                    multiplier = 1;
                else
                    multiplier = multiplier + ((1 - health));
    
                camHUD.shake((0.0055 * multiplier / 4) / 2, 0.15);
                FlxG.camera.shake(0.025 * multiplier / 4, 0.1);
                if (health > 0.05*healthLoss+.01)
                    health -= 0.05*healthLoss;
                else
                    health = 0.05*healthLoss;
            }        function onDadHit(e)
                if (health > 0.2) {health -= 0.024;}}
    	if (((dad.curCharacter == 'bloodbathnew')) && (curBeat % 2 == 0))
            {{
                var multiplier:Float = 1;
                if (health >= 1)
                    multiplier = 1;
                else
                    multiplier = multiplier + ((1 - health));
                FlxG.camera.shake(0.025 * multiplier / 4, 0.1);
                camHUD.shake(0.0055 * multiplier / 4, 0.15);
                
            }
        function onDadHit(e)
            if (health > 0.2) {health -= 0.024;}}}}