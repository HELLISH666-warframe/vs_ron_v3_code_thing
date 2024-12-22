
var explode:FlxSound;
explode = FlxG.sound.load(Paths.sound("hellexplode"));

function postCreate() {
	sky.visible = false;
	city.visible = false;
	mountains.visible = false;
	penta.visible = false;
    street.visible = false;
	escape_fire.visible = false;
	lava.visible = false;
	bloodshed_lamp.visible = false;
    bloodshed_streetBroken.visible = false;
	spacebg.visible = false;
	space.visible = false;
    freindlystars.visible = false;
}
function stepHit(step)
        {
            switch (step)
            {
                case 140:
                    sky.visible = true;
                    city.visible = true;
                    mountains.visible = true;
                    mountains.y -= 60;
                    penta.visible = true;
                    street.visible = true;
                case 417:
                    sky.visible = false;
                    city.visible = false;
                    mountains.visible = false;
                    penta.visible = false;
                    street.visible = false;
                    
                    escape_fire.visible = true;
                    lava.visible = true;
                    bloodshed_lamp.visible = true;
                    bloodshed_streetBroken.visible = true;
                    explode.play(true);
                    dad.x = -100;
                    boyfriend.x = 1100;

                case 1254:
                    escape_fire.visible = false;
                    lava.visible = false;
                    bloodshed_lamp.visible = false;
                    dad.x = -100;
                    boyfriend.x = 1100;

                    spacebg.visible = true;
                    space.visible = true;
                    freindlystars.visible = true;
            }
        }