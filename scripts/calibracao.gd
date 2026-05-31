extends Node

var timerTimes: Array;
var downTimes: Array;
var diffTimes: Array;

var timer;
var audio;
var sprite;
var text;
func _ready() -> void:
	timer = $Timer;
	audio = $AudioStreamPlayer;
	sprite = $Sprite2D;
	text = $TextEdit;
	
func update() -> void:
	var sum = float(diffTimes.reduce(func(accum, num): return accum+num));
	var mean = sum/len(diffTimes);
	Ritmo.mean = mean;
	
	var stdDev = (diffTimes.reduce(func(accum, num): return accum+(num-mean)**2))/len(diffTimes);
	stdDev = sqrt(stdDev);
	Ritmo.stdDev = stdDev;

	
	
	text.set_line(0, 'Offset: {0}ms\nStdDev: {1}ms'.format([snapped(mean/1000, 0.01), snapped(stdDev/1000, 0.01)]));

var i = 0;
# Flag para restringir atualizações de diffTimes
var updateFlag: bool = false;
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("cima2"): downTimes.append(Time.get_ticks_usec());
	
	if len(timerTimes) == len(downTimes) and updateFlag and i<10:
		diffTimes.append(downTimes[-1]-timerTimes[-1]);
		updateFlag = false;
		
		update();
		i+=1;
		

func show_block() -> void:
	sprite.visible = true;
	await get_tree().create_timer(0.2).timeout;
	sprite.visible = false;

func _on_pressed() -> void:
	timer.start();
	audio.play();

func _on_audio_stream_player_finished() -> void:
	timer.start();
	audio.play();

func _on_timer_timeout() -> void:
	show_block();
	timerTimes.append(Time.get_ticks_usec());
	updateFlag = true;
