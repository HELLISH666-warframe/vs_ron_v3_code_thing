function postCreate() {
	
    for(i in [skywasted,rain3,citywasted,mountainswasted,hillfrontwasted,rain2,streetwasted,rain1])
	i.visible = false;
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
        case 1304:
            sky.destroy();
            bigcloud.destroy();
            backcity.destroy();
            city.destroy();
            backmountain.destroy();
            mountain.destroy();
            hill.destroy();
            street.destroy();

            for(i in [skywasted,rain3,citywasted,mountainswasted,hillfrontwasted,rain2,streetwasted,rain1])
            i.visible = true;
    }
}
function update() 
for (i in 1...4) __script__.get("rain" + i).shader.iTime = Conductor.songPosition / 1000;
        