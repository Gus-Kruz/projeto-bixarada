extends Node2D

var notas
var teclados
var BPM = 200
var yay 
func _ready() -> void:
	notas = $notas.get_children()
	teclados = $teclados.get_children()
	yay = $mensagem_boa
	yay.visible = false


func _physics_process(delta: float) -> void:
	for c in range(0,len(notas)):
		if notas[c].visible:
			notas[c].position.y += BPM*delta
			BPM += 0.05
		if teclados[c].dentro:
			if Input.is_action_just_pressed("cima1"):
				notas[0].position.y = 1
				teclados[0].dentro = false
				yay.visible = true
				await get_tree().create_timer(0.5).timeout
				yay.visible = false
			if Input.is_action_just_pressed("baixo1"):
				notas[1].position.y = 1
				teclados[1].dentro = false
				yay.visible = true
				await get_tree().create_timer(0.5).timeout
				yay.visible = false
			if Input.is_action_just_pressed("esquerda1"):
				notas[2].position.y = 1
				teclados[2].dentro = false
				yay.visible = true
				await get_tree().create_timer(0.5).timeout
				yay.visible = false
			if Input.is_action_just_pressed("direita1"):
				notas[3].position.y = 1
				teclados[3].dentro = false
				yay.visible = true
				await get_tree().create_timer(0.5).timeout
				yay.visible = false
		if notas[c].position.y >= 800:
			notas[c].position.y = 1
