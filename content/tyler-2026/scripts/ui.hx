import funkin.backend.FunkinShader.FunkinRuntimeShader;

var timer:FlxSprite;
var timerThing:FlxSprite;
var pieChart;

function onLoad() {
	timer = new FlxSprite(0, 50).makeGraphic(70, 70, FlxColor.WHITE);
    timer.antialiasing = ClientPrefs.globalAntialiasing;
    timer.cameras = [camHUD];
	timer.screenCenter(FlxAxes.X);
	timer.flipX = true;
	add(timer);
	
	timerThing = new FlxSprite(0, timer.y - 15).loadGraphic(Paths.image('ui/timer bg'));
	timerThing.screenCenter(FlxAxes.X);
	timerThing.cameras = [camHUD];
	add(timerThing);

    pieChart = newShader('PieChart');
	timer.shader = pieChart;
	pieChart.setBool('useGradient', false);
	pieChart.setFloat('_amount', 0);
	pieChart.setFloat('_start', 0);
	pieChart.setFloat('_end', 360);

    timer.shader = pieChart;
}

function onCreatePost(){
	for(i in [playHUD.timeBar, playHUD.timeTxt]){
        playHUD.remove(i);
    }   
}

function onUpdate(elapsed){
    var fill = 1 - (Conductor.songPosition / game.songLength);
		pieChart.setFloat('_amount', fill);
}

function stepHit() {
	switch(songName) {
        case "tyler":
			if(curStep > 514) {
				timer.color = FlxColor.ORANGE;
			}
    }
}