function onEvent(_) {
    if (_.event.name == 'bitto') {
        var value1:String = _.event.params[0];
        var value2:String = _.event.params[1];
        var value3:String = _.event.params[1];
        var eventEase = switch(_.event.params[2]) {
			case 'backin': FlxEase.backIn;
			case 'expoout': FlxEase.expoOut;
			case 'linear': FlxEase.linear;
            case 'backInOut': FlxEase.backInOut;
            case 'circinout': FlxEase.circInOut;
            case 'backout': FlxEase.backOut;
        }
        if (value1 != "regular" && value1 != "custom" && value1 != "") {
            // bloodshed legacy redux zooms. they r fucked up for some reason
            value2 = value1.split(",")[1] + "," + value1.split(",")[2] + "," + value2;
            value1 = "custom";
        }
        defaultCamZoom = Std.parseFloat(value2);
        FlxTween.tween(FlxG.camera, {zoom: Std.parseFloat(value2.split(',')[0])}, Std.parseFloat(value2.split(',')[1]), {ease: eventEase});}
        trace(defaultCamZoom);
    }