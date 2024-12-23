import openfl.Lib;
var cameramove:Bool = false;
var currentBeat:Float = (Conductor.songPosition / 1000)*(Conductor.bpm/60);
function popUpScore(note:Note = null):Void
{		var daRating:Rating = Conductor.judgeNote(note, noteDiff);
	var ratingNum:Int = 0;

	if (SCREWYOU)
	{
		switch(daRating.name)
		{
			// i should nerf unforgiving input its too hard
			// skill issue
			case 'shit':
				health -= 0.15*healthLoss;
			case 'bad':
				health -= 0.045*healthLoss;
			case 'good' | 'sick':
				health += 0.05*healthLoss;
		}
	}}
function postCreate(){	
	if (cameramove)
		{
			camHUD.angle = 81 * Math.sin((currentBeat/6) * Math.PI);
			FlxG.camera.angle = 2 * Math.sin((currentBeat/6) * Math.PI);
		}	
}
function stepHit(curStep){
	switch(curStep){
		case 1:
			cameramove = true;
}}
