import funkin.backend.utils.DiscordUtil;

function onGameOver() {
	DiscordUtil.changePresence('Game Over', PlayState.SONG.meta.displayName + " (" + PlayState.difficulty + ")");
}
var image:String = 'uhhhh';

function onDiscordPresenceUpdate(e) {
	var data = e.presence;

	if(data.button1Label == null)
		data.button1Label = "Codename Engine Discord";
	if(data.button1Url == null)
		data.button1Url = "https://discord.gg/2NTCdsQvx4";
}

function onPlayStateUpdate() {
	DiscordUtil.changeSongPresence(
		PlayState.instance.detailsText,
		(PlayState.instance.paused ? "Paused - " : "") + PlayState.SONG.meta.displayName + " (" + PlayState.difficulty + ")",
		PlayState.instance.inst,
		PlayState.instance.SONG.meta.icon
	);
}

function onMenuLoaded(name:String) {
	// Name is either "Main Menu", "Freeplay", "Title Screen", "Options Menu", "Credits Menu", "Beta Warning", "Update Available Screen", "Update Screen"
	DiscordUtil.changePresenceSince("In the Menus", null);
}

function onEditorTreeLoaded(name:String) {
	switch(name) {
		case "Character Editor":
	//		DiscordUtil.changePresenceSince("Choosing a Character", null,"ruhoh");
	}
}