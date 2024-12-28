//yes_i_know_how_unoptimized_this_shit_is
function postCreate() {
	underwater.visible = false;
	sky.visible = true;
	rain3.visible = true;
	city.visible = true;
    mountains.visible = true;
	hillfront.visible = true;
	rain2.visible = true;
    street.visible = true;
	rain1.visible = true;
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
		case 1103:
			sky.visible = false;
			rain3.visible = false;
			city.visible = false;
			mountains.visible = false;
			hillfront.visible = false;
			rain2.visible = false;
			street.visible = false;
			rain1.visible = false;

			underwater.visible = true;
			case 1371:
			underwater.visible = false;

			sky.visible = true;
			rain3.visible = true;
			city.visible = true;
			mountains.visible = true;
			hillfront.visible = true;
			rain2.visible = true;
			street.visible = true;
			rain1.visible = true;
	}
}
function update() 
	for (i in 1...4) __script__.get("rain" + i).shader.iTime = Conductor.songPosition / 1000;