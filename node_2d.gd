extends Node2D

var notas
var teclados
var BPM = 200
var erro = 0
func _ready() -> void:
	notas = $notas.get_children()
	teclados = $teclados.get_children()



func _physics_process(delta: float) -> void:
	for c in range(0,len(notas)):
		notas[c].position.y += BPM*delta
		if teclados[c].dentro:
			if Input.is_action_just_pressed("cima1"):
				notas[0].position.y = 1
				teclados[0].dentro = false
			if Input.is_action_just_pressed("baixo1"):
				notas[1].position.y = 1
				teclados[1].dentro = false
			if Input.is_action_just_pressed("esquerda1"):
				notas[2].position.y = 1
				teclados[2].dentro = false
			if Input.is_action_just_pressed("direita1"):
				notas[3].position.y = 1
				teclados[3].dentro = false
		if notas[c].position.y >= 800:
			notas[c].position.y = 1
