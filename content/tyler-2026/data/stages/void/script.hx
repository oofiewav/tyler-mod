function onLoad(){
    var bg = new FlxSprite().makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.WHITE);
    bg.scrollFactor.set();
    bg.screenCenter();
    add(bg);
}