extends Node2D
var player1 = ''
var player2 = ''
var cor = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if player1 != '' and player2 == '':
		#get.tree().chance_scene_to_file("res//node.2d")
	pass
	
func muda_cor(estado,path):
	estado = !estado
	if estado == true:
		get_node("selecao-margin/players/player"+ path).add_theme_color_override("font_color", Color("fe3a00"))
	else:
		get_node("selecao-margin/players/player"+ path).add_theme_color_override("font_color", Color("ffffff"))
	$Timer.start()
	return estado

func muda_texto(palavra,path):
	get_node("selecao-margin/players/player"+ path).text = palavra

func muda_nome_player(personagem):
	if player1 == '':
		player1 = personagem
		muda_texto('>> '+personagem,'/player1/nome1')
		muda_cor(true,'/player1/player1-label')
	elif player2 =='':
		player2 = personagem
		muda_texto(personagem + ' <<','/player2/nome2')
		muda_cor(true,'/player2/player2-label')

func _on_timer_timeout() -> void:
	if player1 == '':
		cor = muda_cor(cor,'/player1/player1-label')
	elif player2 == '':
		cor = muda_cor(cor,'/player2/player2-label')
	
func _on_lorena_pressed() -> void:
	muda_nome_player('Lorena')

func _on_carlos_pressed() -> void:
	muda_nome_player('Carlos')

func _on_rogerio_pressed() -> void:
	muda_nome_player('Rogerio')
