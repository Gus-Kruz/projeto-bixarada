extends Node2D

var track = preload("res://track.tscn")
var notas
var teclados
var BPM = 200
func _ready() -> void:
	notas = $track/notas.get_children()
	teclados = $track/teclados.get_children()


func _physics_process(delta: float) -> void:
	pass
