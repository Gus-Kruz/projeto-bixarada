extends Node

var timerTimes: Array;
var clickTimes: Array;

# Called when the node enters the scene tree for the first time.
var timer;
var sprite;
func _ready() -> void:
	timer = $Timer;
	sprite = $Sprite2D;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass;

func _on_pressed() -> void:
	timer.start();

func _on_timer_timeout() -> void:
	sprite.visible = true;
	timerTimes.append(Time.get_ticks_usec());
	print(timerTimes);
	await get_tree().create_timer(0.2).timeout;
	sprite.visible = false;
