extends Node2D

@export var player_id = 1
var perdas
var notas
var teclados
var BPM = 200
var acoes = ["cima", "baixo","esquerda","direita"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	notas = $notas.get_children()
	teclados = $teclados.get_children()
	perdas = 0
	pass # Replace with function body.
func _process(delta: float) -> void:
	for c in range(0,len(notas)):
		if notas[c].visible:
			notas[c].position.y += BPM*delta
			BPM += 0.03
		if teclados[c].dentro:
			if Input.is_action_just_pressed(acoes[c] + str(player_id)):
				notas[c].position.y = 1
				teclados[c].dentro = false
				
		if notas[c].position.y >= 800:
			notas[c].position.y = 1
			perdas += 1
			teclados[c].dentro = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
