//stolen_from_gorefield_pending_remvel
import flixel.FlxObject;
import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextFormat;
import flixel.text.FlxTextFormatMarkerPair;
import funkin.backend.utils.DiscordUtil;
import funkin.backend.system.framerate.Framerate;
import std.Xml;

var curSelected:Int = 0;
var iconGroup:FlxTypedGroup<FlxSprite>;

var descText:FlxText;
var descText2:FlxText;
var descTextName:FlxText;

var credits:Array<{name:String,role:String,description:String,social_link:String}> = [];
var portrait:FlxSprite;

var camFollow:FlxObject;
var camFollowPos:FlxObject;
var camFollowXOffset:Float;

var iconYArray:Array<Float> = []; //intro stuff

function create() 
{
	Framerate.instance.visible = false;
	DiscordUtil.changePresence("Looking at Credits", null);


	var data:Xml = Xml.parse(Assets.getText(Paths.file("data/config/credits.xml"))).firstElement();
    for (member_data in data.elementsNamed("member")) {
        credits.push({
            name: member_data.get("name"),
            description: member_data.get("desc"),
            social_link: member_data.get("social_link"),
        });
    }

{}
	var bg:FlxSprite = CoolUtil.loadAnimatedGraphic(members[0], Paths.image ('menus/freeplay/classicbgAnimate'));
    members[0].scale.set(2,2);
    members[0].updateHitbox();
	add(bg);
    bg.y = 90;
    bg.x = 0;
	bg.color = FlxColor.RED;

	camFollow = new FlxObject(640, 342, 1, 1);
	camFollowPos = new FlxObject(640, 342, 1, 1);
	add(camFollow);
	add(camFollowPos);

	iconGroup = new FlxTypedGroup();
	add(iconGroup);

	for (i in 0...credits.length)
	{
		var icon:FlxSprite = new FlxSprite(i % 1  * 370 + 800, Std.int(i / 1) * 420);
		icon.loadGraphic(Paths.image( 'credits/' + credits[i].name));
		icon.setGraphicSize(332);
		icon.ID = i; icon.antialiasing = true;
		icon.alpha = 0.5;
		icon.updateHitbox();
		iconGroup.add(icon);
		iconYArray.push(icon.y);

		icon.y += 100;
	}

	FlxG.camera.follow(camFollowPos, null, 2);

	descText = new FlxText(780-49, 425, 490, 20);
	descText.setFormat("fonts/w95.otf", 30, FlxColor.WHITE, "center");
	descText.scrollFactor.set();
	descText.screenCenter();
	add(descText);

	descTextName = new FlxText(32, 620, FlxG.width, "", 19, true);
	descTextName.setFormat("fonts/w95.otf", 50, FlxColor.WHITE, "center");
	descTextName.scrollFactor.set();
	add(descTextName);

	descText2 = new FlxText(780-49, 425, 490, 20);
	descText2.screenCenter();
	descText2.scrollFactor.set();
	add(descText2);

	for (i in 0...iconGroup.length){
		FlxTween.tween(iconGroup.members[i], {y: iconYArray[i]}, 0.7,{ease: FlxEase.cubeOut, startDelay: 0.04 * i, onComplete: (tmr:FlxTween) -> {
			intro = false;
		}});
	}
	changeSelection(0);
}

var quitting:Bool = false;
var intro:Bool = true;

function update(elapsed:Float) {
	var lerpVal:Float = Math.max(0, Math.min(1, elapsed * 7.5));
	camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x+camFollowXOffset, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

	if (!quitting) {
		if (controls.UP_P)
			changeSelection(-1);
		if (controls.DOWN_P)
			changeSelection(1);

		if (controls.ACCEPT)
			CoolUtil.openURL(credits[curSelected].social_link);

		if (controls.BACK) {
			FlxG.switchState(new MainMenuState());
		}
	}
}

function changeSelection(change:Int)
{

	iconGroup.members[curSelected].alpha = 0.5;

	curSelected = FlxMath.wrap(curSelected + change, 0, credits.length-1);

	iconGroup.members[curSelected].alpha = 1;
	camFollow.setPosition(640, Std.int(curSelected / 1) * 420 + 230);
	if(!intro)
	{
		iconGroup.members[curSelected].y = iconYArray[curSelected] + 20;
		FlxTween.tween(iconGroup.members[curSelected],{y: iconYArray[curSelected]},0.3, {ease: FlxEase.backOut});
	}

	var member = credits[curSelected];

	camFollowXOffset = member.name == "Ne_Eo" ? 35 : 0;

	descText.text = member.role;
	descText2.text = member.description;
	if(descText2.text.length > 15){
		descText2.setFormat("fonts/w95.otf", 40, 0xFFFFFF, "center");
		descText2.y = descTextName.y + -355;
		descText2.x = descTextName.x + 490;
	}
	else{
		descText2.setFormat("fonts/w95.otf", 50, 0xFFFFFF, "center");
		descText2.y = descTextName.y + -90;
        descText2.x = descTextName.x + 190;
	}
	descTextName.text = member.name;

	descText.screenCenter(FlxAxes.X);
	descTextName.screenCenter(FlxAxes.X);
}

function destroy() {Framerate.instance.visible = true; moustacheMode = false;}