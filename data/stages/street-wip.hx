function postCreate() {
    for(i in [skywasted,citywasted,mountainswasted,hillfrontwasted,streetwasted])
        i.visible = false;
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

    for(i in [skywasted,citywasted,mountainswasted,hillfrontwasted,streetwasted])
        i.visible = true;
    }
}