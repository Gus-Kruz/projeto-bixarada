extends CanvasLayer
const TRANSICAO =  preload("res://menu/transicao.tscn")

func _on_player_1_morte_1() -> void:
	get_node("Player1").text = 'Player 1 PERDEU!'
	get_node("Player2").text = 'VENCEU! PLAYER 2'
	morte_transicao()

func _on_player_2_morte_2() -> void:
	get_node("Player2").text = 'PERDEU! PLAYER 2'
	get_node("Player1").text = 'PLAYER 1 VENCEU!'
	morte_transicao()
	
func morte_transicao():
	var transicao = TRANSICAO.instantiate()
	add_child(transicao)
	var fade = transicao.get_node("fade")
	fade.play('fade')
	get_tree().change_scene_to_file("res://menu/menu_principal.tscn")
