function postCreate() {
	bg.visible = true;
	nothing.visible = false;
    gf.visible = false;
}
function stepHit(step)
{
    switch (step)
    {
        case 984:
            bg.visible = false;
            nothing.visible = true;
        case 1112:
            bg.visible = true;
            nothing.visible = false;
            gf.visible = true;
    }
}