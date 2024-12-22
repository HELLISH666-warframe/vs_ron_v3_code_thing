function create() {}
function postCreate(){}
function update(){}
function postUpdate(elapsed:Float){}
function stepHit(step)
    {
        {
            
				switch(curStep){
					case 144 | 400:
						FlxTween.cancelTweensOf(skyBLR);
						FlxTween.cancelTweensOf(camGame);
						FlxTween.tween(camGame, {angle: 180}, 3, { ease: FlxEase.backInOut} );
						FlxTween.angle(skyBLR, 0, 180, 3, { ease: FlxEase.backInOut } );
					case 272 | 656:
						FlxTween.cancelTweensOf(skyBLR);
						FlxTween.cancelTweensOf(camGame);
						FlxTween.tween(camGame, {angle: camGame.angle+180}, 3, { ease: FlxEase.backInOut} );
						FlxTween.angle(skyBLR, 0, skyBLR.angle+180, 3, { ease: FlxEase.backInOut } );
				}
		}
        }