extends Node2D

var track = preload("res://track.tscn")
var track_a
func _ready() -> void:
	var timer_morte = Timer.new()
	track_a = $track
	add_child(timer_morte)
	pass


func _physics_process(delta: float) -> void:
	pass
