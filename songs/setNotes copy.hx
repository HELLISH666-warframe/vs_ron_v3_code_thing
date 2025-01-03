//stolen_from_internet_oddities_pending_removal
var daStrumID:Int = 1;
var noteName:FunkinText = new FunkinText(145, 687, 0, 'notes', 15, false);

function create(){
    switch(PlayState.SONG.meta.displayName){
        case 'official-debate':{
            noteName.text = 'RON_NOTES';
        }
        case 'difficult-powers':{
            noteName.text = 'demon';
        }
        case 'holy-shit-dave-fnf':{
            noteName.text = 'NOTEold_assets';
        }
        case 'slammed':{
            noteName.text = 'RON_NOTES';
        }
    }
    trace(noteName.text, PlayState.SONG.meta.displayName);
}

function onNoteCreation(e) if (e.strumLineID == daStrumID) if (curSong != 'nyan') e.noteSprite = "game/notes/" + noteName.text;

function onStrumCreation(e) if (e.player == daStrumID) if (curSong != 'nyan') e.sprite = "game/notes/" + noteName.text;