function postCreate() {
    for(i in [wasted_sky,wasted_bgBehind,wasted_bg,wasted_bucket])
    i.visible = false;
    conall_bg.antialiasing=true;
}
function stepHit(step){
    switch (curStep)
    {
    case 1315:
        conall_sky.destroy();
		conall_bgBehind.destroy();
		conall_bg.destroy();
        conall_bucket.destroy();
        for(i in [wasted_sky,wasted_bgBehind,wasted_bg,wasted_bucket])
            i.visible = true;
    }
}