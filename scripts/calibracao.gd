extends Node

var timerTime: int;
var downTime1: int;
var downTime2: int;
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
	# Time configs
	diffTimes.append(downTime1-timerTime);
	diffTimes.append(downTime2-timerTime);

	var sum = diffTimes.reduce(func(accum, num): return accum+num);
	var mean = float(sum)/len(diffTimes);
	Ritmo.mean = mean;
	
	var stdDev = (diffTimes.reduce(func(accum, num): return accum+(num-mean)**2))/len(diffTimes);
	stdDev = sqrt(stdDev);
	Ritmo.stdDev = stdDev;

	
	
	text.set_line(0, 'Offset: {0}ms\nStdDev: {1}ms'.format([snapped(mean/1000, 0.01), snapped(stdDev/1000, 0.01)]));

var i = 0;
# Flag para restringir atualizações de diffTimes
var updateFlag1: bool = false;
var updateFlag2: bool = false;
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("cima1"):
		downTime1 = Time.get_ticks_usec();
		updateFlag1 = true;
	if Input.is_action_just_pressed("cima2"):
		downTime2 = Time.get_ticks_usec();
		updateFlag2 = true;
	
	if updateFlag1 and updateFlag2 and updateFlag3 and i<10:
		update();
		updateFlag1 = false;
		updateFlag2 = false;
		updateFlag3 = false;
		i+=1;
		

func show_block() -> void:
	sprite.visible = true;
	await get_tree().create_timer(0.2).timeout;
	sprite.visible = false;

func _on_pressed() -> void:
	timer.start();
	audio.play();

func _on_audio_stream_player_finished() -> void:
	if i<10:
		timer.start();
		audio.play();
	else: timer.stop();

var updateFlag3: bool = false
func _on_timer_timeout() -> void:
	timerTime = Time.get_ticks_usec();
	updateFlag3 = true;
	show_block();
