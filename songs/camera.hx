import flixel.math.FlxRandom;
import flixel.math.FlxVelocity;
import flixel.addons.util.FlxSimplex;
var angle:Float;
var cameraFollow:FlxSprite = new FlxSprite();
var driftAmount = 30;
var time:Float = 0;

var sit = 0.3;
var rs = 0.005;
function postCreate() {
    add({cameraFollow.setPosition(camFollow.x, camFollow.y); cameraFollow;}).visible = false;
    FlxG.camera.follow(cameraFollow);
}

var t = 0;
var speed = 0.0;
var xoffset = 0.0;
var yoffset = 0.0;
var angleoffset = 0.0;
function shake(traumatizer = 0.3, ?speedizer) {
    for(a in [["trauma", traumatizer], ["speed", speedizer], ["xoffset", FlxG.random.float(-100, 100)], ["yoffset", FlxG.random.float(-100, 100)], ["angleoffset", FlxG.random.float(-100, 100)]])
        __script__.set(a[0], a[1]);
}

var shakeFormula = 0;
var lastElapsedTime = 0;
var rotateTarget = 0;
function updatePost60(elapsed) {
    time += elapsed;
    lastElapsedTime += elapsed;
    camHUD.followLerp = FlxG.camera.followLerp * 2;

    //var animName = "";
    for (i in strumLines.members[curCameraTarget].characters) {
        camFollow.x += driftAmount * [0, 1, -1][["singRIGHT", "singLEFT"].indexOf(i=i.getAnimName())+1];
        camFollow.y += driftAmount * [0, 1, -1][["singDOWN", "singUP"].indexOf(i)+1];
        //rotateTarget += i == "singLEFT" ? 2 : i == "singRIGHT" ? -2 : 0;
    }
    //if (animName == "") rotateTarget = 0;
    //FlxG.camera.angle = FlxMath.lerp(FlxG.camera.angle, rotateTarget, 0.04);

    //credit to wizard.hx lol
    t = FlxMath.bound(t - 0.02, 0, 1);
    FlxG.camera.angle += 5 * (t * t) * FlxSimplex.simplex(t * 25.5, t * 25.5 + angleoffset);
    FlxG.camera.scroll.x += 50 * (t * t) * FlxSimplex.simplex(t * 100 + xoffset, 10);
    FlxG.camera.scroll.y += 50 * (t * t) * FlxSimplex.simplex(10, t * 100 + yoffset);

    cameraFollow.acceleration.set(((camFollow.x - cameraFollow.x) - (cameraFollow.velocity.x * sit)) / rs, ((camFollow.y - cameraFollow.y) - (cameraFollow.velocity.y * sit)) / rs); // so much smoothness
}
function setDriftAmount(value:Float) {driftAmount = value;}