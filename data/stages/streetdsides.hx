function postCreate() {
	
	conall_sky.visible = true;
	conall_bgBehind.visible = true;
	conall_bg.visible = true;
	conall_bucket.visible = true;
    conallwasted_sky.visible = false;
	rain3.visible = false;
	conallwasted_bgBehind.visible = false;
	conallwasted_bg.visible = false;
    conallwasted_bucket.visible = false;
	rain2.visible = false;
	rain1.visible = false;
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
    switch (curStep)
    {
         //stage 2
        case 1315:
            conall_sky.visible = false;
            conall_bgBehind.visible = false;
            conall_bg.visible = false;
            conall_bucket.visible = false;
            conallwasted_sky.visible = true;
            rain3.visible = true;
            conallwasted_bgBehind.visible = true;
            conallwasted_bg.visible = true;
            conallwasted_bucket.visible = true;
            rain2.visible = true;
            rain1.visible = true;
    }
}
        function update() 
            for (i in 1...4) __script__.get("rain" + i).shader.iTime = Conductor.songPosition / 1000;
        