function postCreate(){
    gf.visible = nothing.visible = false;
}
function beatHit(curBeat){
    switch (curBeat)
    {
        case 246:
        bg.visible = false;
        nothing.visible = true;
        case 278:
        gf.visible =  bg.visible = true;
        nothing.visible = false;
    }
}