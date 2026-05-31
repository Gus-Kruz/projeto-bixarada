extends Node2D


func _on_jogar_pressed() -> void:
	pass
	# get_tree().change_scene_to_file("res://caminho_para_tela_selecao")

func _on_configurações_pressed() -> void:
	get_tree().change_scene_to_file("res://menu/Config.tscn")

func _on_créditos_pressed() -> void:
	get_tree().change_scene_to_file("res://menu/creditos.tscn")

func _on_sair_pressed() -> void:
	get_tree().quit()
