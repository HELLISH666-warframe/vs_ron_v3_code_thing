function postCreate() {
	
	sky.visible = true;
	bigcloud.visible = true;
	backcity.visible = true;
	city.visible = true;
    backmountain.visible = true;
	mountain.visible = true;
	hill.visible = true;
	street.visible = true;
	skywasted.visible = false;
	rain3.visible = false;
	citywasted.visible = false;
	mountainswasted.visible = false;
    hillfrontwasted.visible = false;
	rain2.visible = false;
	streetwasted.visible = false;
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
    switch (step)
    {
        case 1304:
            sky.visible = false;
            bigcloud.visible = false;
            backcity.visible = false;
            city.visible = false;
            backmountain.visible = false;
            mountain.visible = false;
            hill.visible = false;
            street.visible = false;
            skywasted.visible = true;
            rain3.visible = true;
            citywasted.visible = true;
            mountainswasted.visible = true;
            hillfrontwasted.visible = true;
            rain2.visible = true;
            streetwasted.visible = true;
            rain1.visible = true;
            }
        }
        function update() 
            for (i in 1...4) __script__.get("rain" + i).shader.iTime = Conductor.songPosition / 1000;
        