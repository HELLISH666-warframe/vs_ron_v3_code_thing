public static var isCameraOnForcedPos:Bool = false;
isCameraOnForcedPos = false;

function onEvent(event) {
	switch (event.event.name) {
		case 'Psych Events':
			var value1:String = event.event.params[1];
			var value2:String = event.event.params[2];
			var flValue1:Null<Float> = Std.parseFloat(value1);
			var flValue2:Null<Float> = Std.parseFloat(value2);
			if (Math.isNaN(flValue1)) flValue1 = null;
			if (Math.isNaN(flValue2)) flValue2 = null;
			
			switch (event.event.params[0]) {
				case 'Hey!':
					var value:Int = 2;
					switch (StringTools.trim(value1.toLowerCase())) {
						case 'bf' | 'boyfriend' | '0':
							value = 0;
						case 'gf' | 'girlfriend' | '1':
							value = 1;
					}

					if (flValue2 == null || flValue2 <= 0) flValue2 = 0.6;

					if (value != 0) {
						if(StringTools.startsWith(dad.curCharacter, 'gf')) { //Tutorial GF is actually Dad! The GF is an imposter!! ding ding ding ding ding ding ding, dindinding, end my suffering
							dad?.playAnim('cheer', true, 'LOCK');
							dad?.extra.set('heyTimer', new FlxTimer().start(flValue2, function() {
								if (dad?.lastAnimContext == 'LOCK') dad?.dance();
							}));
							// dad.specialAnim = true;
							// dad.heyTimer = flValue2;
						} else if (gf != null) {
							gf?.playAnim('cheer', true, 'LOCK');
							gf?.extra.set('heyTimer', new FlxTimer().start(flValue2, function() {
								if (gf?.lastAnimContext == 'LOCK') gf?.dance();
							}));
							// gf.specialAnim = true;
							// gf.heyTimer = flValue2;
						}
					}
					if (value != 1) {
						boyfriend?.playAnim('hey', true, 'LOCK');
						boyfriend?.extra.set('heyTimer', new FlxTimer().start(flValue2, function() {
							if (boyfriend?.lastAnimContext == 'LOCK') boyfriend?.dance();
						}));
						// boyfriend.specialAnim = true;
						// boyfriend.heyTimer = flValue2;
					}

				case 'Set GF Speed':
					if (flValue1 == null || flValue1 < 1) flValue1 = 1;
					gfSpeed = Math.round(flValue1);
					
				case 'Add Camera Zoom':
					if (Options.camZoomOnBeat && FlxG.camera.zoom < maxCamZoom) {
						if (flValue1 == null) flValue1 = 0.015;
						if (flValue2 == null) flValue2 = 0.03;
	
						FlxG.camera.zoom += flValue1;
						camHUD.zoom += flValue2;
					}
					
				case 'Play Animation':
					var char:Array<Character> = strumLines.members[0].characters;
					switch (StringTools.trim(value2.toLowerCase())) {
						case 'bf' | 'boyfriend':
							char = strumLines.members[1].characters;
						case 'gf' | 'girlfriend':
							char = strumLines.members[2].characters;
						default:
							if (flValue2 == null) flValue2 = 0;
							switch (Math.round(flValue2)) {
								case 1: char = strumLines.members[1].characters;
								case 2: char = strumLines.members[2].characters;
							}
					}

					for (char in char) {
						char?.playAnim(value1, true);
						// char?.specialAnim = true;
					}
					
				case 'Camera Follow Pos':
					if (camFollow != null) {
						isCameraOnForcedPos = false;
						if (flValue1 != null || flValue2 != null) {
							isCameraOnForcedPos = true;
							if (flValue1 == null) flValue1 = 0;
							if (flValue2 == null) flValue2 = 0;
							camFollow.x = flValue1;
							camFollow.y = flValue2;
						}
					}

				case 'Alt Idle Animation':
					var char:Array<Character> = strumLines.members[0].characters;
					switch (StringTools.trim(value1.toLowerCase())) {
						case 'gf' | 'girlfriend':
							char = strumLines.members[2].characters;
						case 'boyfriend' | 'bf':
							char = strumLines.members[1].characters;
						default:
							var val:Int = Std.parseInt(value1);
							if (Math.isNaN(val)) val = 0;

							switch (val) {
								case 1: char = strumLines.members[1].characters;
								case 2: char = strumLines.members[2].characters;
							}
					}

					for (char in char) {
						char?.idleSuffix = value2;
						// char?.recalculateDanceIdle();
					}
					
				case 'Screen Shake':
					var valuesArray:Array<String> = [value1, value2];
					var targetsArray:Array<FlxCamera> = [camGame, camHUD];
					for (i in 0...targetsArray.length) {
						var split:Array<String> = valuesArray[i].split(',');
						var duration:Float = 0;
						var intensity:Float = 0;
						if (split[0] != null) duration = Std.parseFloat(StringTools.trim(split[0]));
						if (split[1] != null) intensity = Std.parseFloat(StringTools.trim(split[1]));
						if (Math.isNaN(duration)) duration = 0;
						if (Math.isNaN(intensity)) intensity = 0;

						if (duration > 0 && intensity != 0) {
							targetsArray[i].shake(intensity, duration);
						}
					}
					
				case 'Change Character':
					var charType:Int = 0;
					switch(StringTools.trim(value1.toLowerCase())) {
						case 'gf' | 'girlfriend':
							charType = 2;
						case 'dad' | 'opponent':
							charType = 1;
						default:
							charType = Std.parseInt(value1);
							if (Math.isNaN(charType)) charType = 0;
					}

					switch(charType) {
						case 0:
							if (boyfriend.curCharacter != value2) {
								if (!boyfriendMap.exists(value2)) {
									addCharacterToList(value2, charType);
								}

								var lastAlpha:Float = boyfriend.alpha;
								boyfriend.alpha = 0.00001;
								boyfriend = boyfriendMap.get(value2);
								boyfriend.alpha = lastAlpha;
								iconP1.changeIcon(boyfriend.healthIcon);
							}
							setOnScripts('boyfriendName', boyfriend.curCharacter);

						case 1:
							if (dad.curCharacter != value2) {
								if (!dadMap.exists(value2)) {
									addCharacterToList(value2, charType);
								}

								var wasGf:Bool = dad.curCharacter.startsWith('gf-') || dad.curCharacter == 'gf';
								var lastAlpha:Float = dad.alpha;
								dad.alpha = 0.00001;
								dad = dadMap.get(value2);
								if (!dad.curCharacter.startsWith('gf-') && dad.curCharacter != 'gf') {
									if (wasGf && gf != null) {
										gf.visible = true;
									}
								} else if (gf != null) {
									gf.visible = false;
								}
								dad.alpha = lastAlpha;
								iconP2.changeIcon(dad.healthIcon);
							}
							setOnScripts('dadName', dad.curCharacter);

						case 2:
							if(gf != null) {
								if(gf.curCharacter != value2) {
									if (!gfMap.exists(value2)) {
										addCharacterToList(value2, charType);
									}

									var lastAlpha:Float = gf.alpha;
									gf.alpha = 0.00001;
									gf = gfMap.get(value2);
									gf.alpha = lastAlpha;
								}
								setOnScripts('gfName', gf.curCharacter);
							}
					}
					reloadHealthBarColors();
					
				case 'Change Scroll Speed':
					if (scrollSpeedTween != null) scrollSpeedTween.cancel();
					if (flValue1 == null) flValue1 = 1;
					if (flValue2 == null) flValue2 = 0;
					var newValue:Float = SONG.scrollSpeed * flValue1;
					if (flValue2 <= 0) scrollSpeed = newValue;
					else scrollSpeedTween = FlxTween.tween(this, {scrollSpeed: newValue}, flValue2, {ease: FlxEase.linear});
				case 'Set Property':
					try {
						var split:Array<String> = value1.split('.');
						if (split.length > 1) setVarInArray(getPropertyLoop(split), split[split.length-1], value2);
						else setVarInArray(this, value1, value2);
					} catch(e:Dynamic) {
						var len:Int = e.message.indexOf('\n') + 1;
						if (len <= 0) len = e.message.length;
						trace('ERROR ("Set Property" Event) - ' + e.message.substr(0, len));
					}
					
				case 'Play Sound':
					if (flValue2 == null) flValue2 = 1;
					FlxG.sound.play(Paths.sound(value1), flValue2);
			}
	}
}

function onCameraMove(event) {
	if (isCameraOnForcedPos && !event.cancelled) {
		event.position.set(camFollow.x, camFollow.y);
	}
}

// fuck FunkinLua bullshit
function setVarInArray(instance:Dynamic, variable:String, value:Dynamic, allowMaps:Bool = false):Any {
	var splitProps:Array<String> = variable.split('[');
	if (splitProps.length > 1) {
		var target:Dynamic = null;
		/* if (PlayState.instance.variables.exists(splitProps[0])) {
			var retVal:Dynamic = PlayState.instance.variables.get(splitProps[0]);
			if (retVal != null) target = retVal;
		} else */ target = Reflect.getProperty(instance, splitProps[0]);

		for (i in 1...splitProps.length) {
			var j:Dynamic = splitProps[i].substr(0, splitProps[i].length - 1);
			if (i >= splitProps.length-1) //Last array
				target[j] = value;
			else //Anything else
				target = target[j];
		}
		return target;
	}

	if (allowMaps && isMap(instance)) {
		//trace(instance);
		instance.set(variable, value);
		return value;
	}

	/* if (PlayState.instance.variables.exists(variable)) {
		PlayState.instance.variables.set(variable, value);
		return value;
	} */
	Reflect.setProperty(instance, variable, value);
	return value;
}

function getVarInArray(instance:Dynamic, variable:String, allowMaps:Bool = false):Any {
	var splitProps:Array<String> = variable.split('[');
	if (splitProps.length > 1) {
		var target:Dynamic = null;
		/* if (PlayState.instance.variables.exists(splitProps[0])) {
			var retVal:Dynamic = PlayState.instance.variables.get(splitProps[0]);
			if (retVal != null) target = retVal;
		} else */ target = Reflect.getProperty(instance, splitProps[0]);

		for (i in 1...splitProps.length) {
			var j:Dynamic = splitProps[i].substr(0, splitProps[i].length - 1);
			target = target[j];
		}
		return target;
	}
	
	if (allowMaps && isMap(instance)) {
		//trace(instance);
		return instance.get(variable);
	}

	/* if (PlayState.instance.variables.exists(variable)) {
		var retVal:Dynamic = PlayState.instance.variables.get(variable);
		if (retVal != null) return retVal;
	} */
	return Reflect.getProperty(instance, variable);
}

function getPropertyLoop(split:Array<String>, ?checkForTextsToo:Bool = true, ?getProperty:Bool=true, ?allowMaps:Bool = false):Dynamic {
	var obj:Dynamic = getObjectDirectly(split[0], checkForTextsToo);
	var end = split.length;
	if(getProperty) end = split.length-1;

	for (i in 1...end) obj = getVarInArray(obj, split[i], allowMaps);
	return obj;
}

function getObjectDirectly(objectName:String, ?checkForTextsToo:Bool = true, ?allowMaps:Bool = false):Dynamic {
	switch(objectName) {
		case 'this' | 'instance' | 'game':
			return PlayState.instance;
		
		/* default:
			var obj:Dynamic = PlayState.instance.getLuaObject(objectName, checkForTextsToo);
			if (obj == null) obj = getVarInArray(getTargetInstance(), objectName, allowMaps);
			return obj; */
	}
}

function isMap(variable:Dynamic) {
	/*switch(Type.typeof(variable)){
		case ValueType.TClass(haxe.ds.StringMap) | ValueType.TClass(haxe.ds.ObjectMap) | ValueType.TClass(haxe.ds.IntMap) | ValueType.TClass(haxe.ds.EnumValueMap):
			return true;
		default:
			return false;
	}*/

	//trace(variable);
	if (variable.exists != null && variable.keyValueIterator != null) return true;
	return false;
}