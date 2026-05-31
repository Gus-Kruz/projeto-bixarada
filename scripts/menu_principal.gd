extends Node2D

var threshold = 670
var is_six: bool = true
var easter = 0

func _on_jogar_pressed() -> void:
	pass
	# get_tree().change_scene_to_file("res://caminho_para_tela_selecao")

func _on_configurações_pressed() -> void:
	get_tree().change_scene_to_file("res://menu/Config.tscn")

func _on_créditos_pressed() -> void:
	get_tree().change_scene_to_file("res://menu/creditos.tscn")

func _on_sair_pressed() -> void:
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
	
