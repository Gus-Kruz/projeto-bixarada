extends MarginContainer


func _on_jogar_pressed() -> void:
	pass
	# get_tree().change_scene_to_file("res://caminho_para_tela_selecao")

func _on_configurações_pressed() -> void:
	pass
	# get_tree().change_scene_to_file("res://caminho_para_tela_configuração")

func _on_créditos_pressed() -> void:
	print("lá ele da silva")
	# get_tree().change_scene_to_file("res://caminho_para_tela_creditos")


func _on_sair_pressed() -> void:
	get_tree().quit()
