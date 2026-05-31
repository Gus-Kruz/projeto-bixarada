extends Panel

var TRANSICAO = preload('res://menu/transicao.tscn')

func _ready() -> void:
	var transicao = TRANSICAO.instantiate()
	add_child(transicao)
	var fade = transicao.get_node('fade')
	fade.play_backwards('fade')
	await fade.animation_finished
	get_node("transicao").queue_free()

func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),linear_to_db(value))

func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func transicao(caminho: String):
	var transicao = TRANSICAO.instantiate()
	add_child(transicao)
	var fade = transicao.get_node("fade")
	fade.play('fade')
	await fade.animation_finished
	get_tree().change_scene_to_file(caminho)

func _on_voltar_pressed() -> void:
	transicao('res://menu/menu_principal.tscn')

func _on_calibrar_pressed() -> void:
	transicao('res://menu/calibracao.tscn')
