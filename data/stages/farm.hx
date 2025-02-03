function postCreate() {
    var cornBagrare:FlxSprite = new FlxSprite(1100,500).loadGraphic(Paths.image('stages/farm/popeye'));
	if (FlxG.random.int(1, 2) == 1)
        insert(13, cornBagrare);

}