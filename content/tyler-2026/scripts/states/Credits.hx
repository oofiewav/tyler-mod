import funkin.states.MainMenuState;

var creditslol:FlxSprite;

function onLoad() {

    var bg = new FlxSprite().makeGraphic(FlxG.width * 1.5, FlxG.height * 1.5, FlxColor.WHITE);
    bg.scrollFactor.set();
    bg.screenCenter();
    add(bg);

    creditslol = new FlxSprite().loadGraphic(Paths.image('credits'));
    creditslol.screenCenter();
    add(creditslol);
}

function onUpdate(elapsed) {
    if (FlxG.keys.justPressed.BACKSPACE || FlxG.keys.justPressed.ESCAPE)
    {
        FlxG.sound.play(Paths.sound('cancelMenu'));
        FlxG.switchState(new MainMenuState());
    }
}