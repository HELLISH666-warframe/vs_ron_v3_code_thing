function postCreate() {
	bg.visible = true;
    gf.visible = false;
    nothing.visible = false;
}
function stepHit(curStep)
{
    switch (curStep)
    {
        case 984:
            bg.visible = false;
//            insert(members.indexOf(bg), wbg); 
            nothing.visible = true;
            gf.visible = false;
        case 1112:
            bg.visible = true;
            nothing.visible = false;
            gf.visible = true;
    }
}