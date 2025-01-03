
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

public var healthBardisabled:Bool = false;
if ((curSong == 'ron') || (curSong == 'wasted') || (curSong == 'ayo') || (curSong == 'trojan-virus') || (curSong == 'official-debate') || (curSong == 'gron') || (curSong == 'difficult-powers') || (curSong == 'bijuu')|| (curSong == 'holy-shit-dave-fnf') || (curSong == 'slammed') || (curSong == 'ron-dsides') || (curSong == 'lights-down-remix')  || (curSong == 'pretty-wacky')|| (curSong == 'certified-champion')|| (curSong == 'rong-aisle')|| (curSong == 'bloodshed-legacy-redux') || (curSong == 'clusterfunk') || (curSong == 'awesome-ron') || (curSong == 'oh-my-god-hes-ballin') || (curSong == 'fardventure'))
function create(){
    importScript('data/scripts/coolRectBar');

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
            barPos[0] += 100;
            barPos[1] -= -80;
    }
}
