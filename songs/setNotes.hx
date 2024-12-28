//stolen_from_internet_oddities_pending_removal
var daStrumID:Int = 0;
var noteName:FunkinText = new FunkinText(145, 687, 0, 'notes', 15, false);

function create(){
    switch(PlayState.SONG.meta.displayName){
        case 'ron':{
            noteName.text = 'RON_NOTES';
        }
        case 'wasted':{
            noteName.text = 'RON_NOTES';
        }
        case 'ayo':{
            noteName.text = 'RON_NOTES';
        }
        case 'Bloodshed':{
            noteName.text = 'RON_NOTES';
        }
        case 'trojan-virus':{
            noteName.text = 'RON_NOTES';
        }
        case 'ron-classic':{
            noteName.text = 'RON_NOTES';
        }
        case 'wasted-classic':{
            noteName.text = 'RON_NOTES';
        }
        case 'Ayo-classic':{
            noteName.text = 'RON_NOTES';
        }
        case 'Bloodshed-classic':{
            noteName.text = 'ronhell';
        }
        case 'trojan-virus-classic':{
            noteName.text = 'RON_NOTES';
        }
        case 'Bleeding-classic':{
            noteName.text = 'ronhell';
        }
        case 'Bloodbath':{
            noteName.text = 'demon';
        }
        case 'gron':{
            noteName.text = 'RON_NOTES';
        }
        case 'Bijuu':{
            noteName.text = 'RON_NOTES';
        }
        case 'ron-dsides':{
            noteName.text = 'conall';
        }
        case 'lights-down-remix':{
            noteName.text = 'RON_NOTES';
        }
        case 'certified-champion':{
            noteName.text = 'RON_NOTES';
        }
        case 'rong-aisle':{
            noteName.text = 'RON_NOTES';
        }
        case 'Bloodshed-legacy-redux':{
            noteName.text = 'demon';
        }
        case 'cluster-funk':{
            noteName.text = 'RON_NOTES';
        }
        case 'oh-my-god-hes-ballin':{
            noteName.text = 'RON_NOTES';
        }
        case 'awesome-ron':{
            noteName.text = 'RON_NOTES';
        }
        case 'Bleeding':{
            noteName.text = 'ronhell';
        }
    }
    trace(noteName.text, PlayState.SONG.meta.displayName);
}

function onNoteCreation(e) if (e.strumLineID == daStrumID) if (curSong != 'nyan') e.noteSprite = "game/notes/" + noteName.text;

function onStrumCreation(e) if (e.player == daStrumID) if (curSong != 'nyan') e.sprite = "game/notes/" + noteName.text;