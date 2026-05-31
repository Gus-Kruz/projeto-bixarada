extends Node2D
const TRANSICAO =  preload("res://menu/transicao.tscn")

func _ready():
	var transicao = TRANSICAO.instantiate()
	add_child(transicao)
	var fade = transicao.get_node("fade")
	fade.play_backwards('fade')
	
func _on_jogar_pressed() -> void:
	pass
	# get_tree().change_scene_to_file("res://caminho_para_tela_selecao")

func _on_configurações_pressed() -> void:
	get_tree().change_scene_to_file("res://menu/Config.tscn")

func _on_créditos_pressed() -> void:
	get_tree().change_scene_to_file("res://menu/creditos.tscn")

func _on_sair_pressed() -> void:
	get_tree().quit()
