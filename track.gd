extends Node2D

@export var player_id = 1
var perdas = 0
var notas
var teclados
var BPM = 200
var acoes = ["cima", "baixo","esquerda","direita"]
var perdeu: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	notas = $notas.get_children()
	teclados = $teclados.get_children()
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
				
		if notas[c].position.y >= 1145:
			notas[c].position.y = 1
			perdas += 1
			teclados[c].dentro = false
		if perdas >= 10:	
			perder()
func perder():
	if perdeu: return
	perdeu = true
	get_tree().change_scene_to_file('res://menu/menu_principal.tscn')
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
