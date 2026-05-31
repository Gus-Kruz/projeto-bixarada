extends Panel

var TRANSICAO = preload('res://menu/transicao.tscn')

func _ready() -> void:
	var transicao = TRANSICAO.instantiate()
	add_child(transicao)
	var fade = transicao.get_node('fade')
	fade.play_backwards('fade')
	await fade.animation_finished
	get_node("transicao").queue_free()

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file('res://menu/menu_principal.tscn')
