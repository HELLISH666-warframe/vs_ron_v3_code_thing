{}
function postCreate() {
	
	veryAngreRon_sky.visible = true;
	veryAngreRon_clouds.visible = true;
	veryAngreRon_ground.visible = true;

	trojan_console.visible = false;
	trojan_bg.visible = false;
	trojan_static.visible = false;
	trojan_ground.visible = false;
    glitch_lamp.visible = false;
	glitch_lamp.visible = false;
    for (i in 1...4) {
		var rainshader = new CustomShader("rain");
		rainshader.zoom = (i / 3) * 70;
		rainshader.raindropLength = 0.1 / i;
		rainshader.opacity = 0.25;
		__script__.get("rain" + i).shader = rainshader;
	}
}
function stepHit(step)
        {
            switch (step)
            {
                //stage 2
                case 387:
                    veryAngreRon_sky.visible = false;
                    veryAngreRon_clouds.visible = false;
                    veryAngreRon_ground.visible = false;
                
                    trojan_console.visible = true;
                    trojan_bg.visible = true;
                    trojan_static.visible = true;
                    trojan_ground.visible = true;
                    glitch_lamp.visible = true;
                    glitch_lamp.visible = true;
            }
        }