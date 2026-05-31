extends Node2D

var track = preload("res://track.tscn")
var track_a
func _ready() -> void:
	var audio_player = $AudioStreamPlayer
	audio_player.play()
	track_a = $track
	pass


func _physics_process(delta: float) -> void:
	pass
