
/**
 * ALL CREDIT GOES TO me golden freidyy har har har!
 * 
 * ok listen up
 * 
 * barPos[0] is for x offset
 * barPos[1] is for y offset
 * 
 * borderOffset[0 or 1] is for the healthBarBG only
 * 
 * hpScale is for the scale of the entire thing
 * 
 * cam is for what camera it'll be on (default is camHUD) dont mess unless yk
 * 
 * far is only temp
 */
//stolen_from_parallax-redefined

public static var healthBardisabled:Bool = false;
if ((curSong == 'bloodshed') || (curSong == 'bloodbath') || (curSong == 'bleeding'))
function create(){
    importScript('data/scripts/blood_bar');

    switch (curSong){
        case "too-far":
            far = true;
            barPos = [360,(camHUD.downscroll ? FlxG.height * 0.82 : FlxG.height * 0.82)];
            hpScale = 0.7;
            
        case "heratic":
            barPos[1] -= 10;

        case "60-pin":
            barPos[0] += 100;
        default:
            barPos[0] -= 0;
            barPos[1] -= -80;
    }
}
