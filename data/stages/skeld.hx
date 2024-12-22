function postCreate() {
	
	darkbackground.visible = false;
	background.visible = true;
}
function stepHit(step)
{
    switch (step)
    {
        case 256:
            background.visible = false;
            darkbackground.visible = true;
    }
}