function onEvent(_) {
    if (_.event.name == 'bitto') {
        var time = _.event.params[1].split(':');
        var finalTime = (Conductor.stepCrochet*time[0])/1000 +
            (Conductor.songPosition*(time[1]*1))/1000 +
            (Conductor.songPosition*(time[2]*1))/1000;
        trace("hello");
        var eventEase = switch(_.event.params[2]) {
			case 'backin': FlxEase.backIn;
			case 'expoout': FlxEase.expoOut;
			case 'linear': FlxEase.linear;
        };
        
        FlxTween.cancelTweensOf(camGame, ['zoom']);
        FlxTween.tween(camGame, {zoom: _.event.params[0]}, finalTime, {ease: eventEase, onUpdate: function(value) {defaultCamZoom = camGame.zoom;}});
    }
}