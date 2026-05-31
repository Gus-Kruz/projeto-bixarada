extends Node2D

var threshold = 670
var is_six: bool = true
var easter = 0
var TRANSICAO = preload('res://menu/transicao.tscn')

func transicao(caminho: String):
	var transicao = TRANSICAO.instantiate()
	add_child(transicao)
	var fade = transicao.get_node("fade")
	fade.play('fade')
	await fade.animation_finished
	get_tree().change_scene_to_file(caminho)
	
func _on_jogar_pressed() -> void:
	transicao('res://menu/selecao.tscn')

func _on_configurações_pressed() -> void:
	transicao('res://menu/Config.tscn')

func _on_créditos_pressed() -> void:
	transicao('res://menu/creditos.tscn')

func _on_sair_pressed() -> void:
	var transicao = TRANSICAO.instantiate()
	add_child(transicao)
	var fade = transicao.get_node("fade")
	fade.play('fade')
	await fade.animation_finished
	get_tree().quit()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed('six') and is_six == true:
		is_six = false
		easter += 67
	if Input.is_action_just_pressed('seven') and is_six == false:
		is_six = true
		easter += 67
	if easter >= threshold:
		get_tree().quit()
	easter -= 5
	
