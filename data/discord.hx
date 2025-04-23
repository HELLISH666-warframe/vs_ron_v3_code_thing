import funkin.backend.utils.DiscordUtil;

function onMenuLoaded(name:String) {
	DiscordUtil.changePresenceSince("In the Menus", null);
}

function onPlayStateUpdate() {
	DiscordUtil.changePresenceAdvanced({
		if ((StringTools.startsWith(PlayState.SONG.meta.displayName, "Blood")) || (StringTools.startsWith(PlayState.SONG.meta.displayName, "Bleed"))){
		state:(PlayState.instance.paused ? "Paused - " : "") + PlayState.SONG.meta.displayName + " (" + PlayState.difficulty + ")",
        largeImageKey: "ruhoh",
		smallImageKey: "icon-" +PlayState.instance.getIconRPC()
		}
		else{		
			state:(PlayState.instance.paused ? "Paused - " : "") + PlayState.SONG.meta.displayName + " (" + PlayState.difficulty + ")",
			largeImageKey: "uhhhh",
			smallImageKey: "icon-" +PlayState.instance.getIconRPC()}
	});
}