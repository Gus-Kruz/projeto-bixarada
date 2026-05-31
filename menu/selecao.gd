extends Node2D
var player1 = ''
var player2 = ''
var cor = false
var TRANSICAO = preload('res://menu/transicao.tscn')

var carlos_escolhido = preload("res://imagens/personagens/carlos/carlos-escolhido.png")
var lorena_escolhido = preload("res://imagens/personagens/lorena/lorena-escolhido.png")
var rogerio_escolhido = preload("res://imagens/personagens/rogerio/rogerio-escolhido.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
	var transicao = TRANSICAO.instantiate()
	add_child(transicao)
	var fade = transicao.get_node('fade')
	fade.play_backwards('fade')
	await fade.animation_finished
	get_node("transicao").queue_free()

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
		var figura = ' '
		player1 = personagem
		PersonagemDado.player1 = personagem
		muda_texto('>> '+personagem,'/player1/nome1')
		muda_cor(true,'/player1/player1-label')
		if personagem == 'carlos':
			figura = carlos_escolhido
		elif personagem == 'lorena':
			figura = lorena_escolhido
		elif personagem == 'rogerio':
			figura = rogerio_escolhido
		get_node("selecao-margin/players/personagens/"+personagem).set_texture_normal(figura)
	elif player2 =='' and player1 != personagem:
		player2 = personagem
		PersonagemDado.player2 = personagem
		var figura = ' '
		muda_texto(personagem + ' <<','/player2/nome2')
		muda_cor(true,'/player2/player2-label')
		if personagem == 'carlos':
			figura = carlos_escolhido
		elif personagem == 'lorena':
			figura = lorena_escolhido
		elif personagem == 'rogerio':
			figura = rogerio_escolhido
		get_node("selecao-margin/players/personagens/"+personagem).set_texture_normal(figura)
		

func _on_timer_timeout() -> void:
	if player1 == '':
		cor = muda_cor(cor,'/player1/player1-label')
	elif player2 == '':
		cor = muda_cor(cor,'/player2/player2-label')
	
func _on_lorena_pressed() -> void:
	muda_nome_player('lorena')

func _on_carlos_pressed() -> void:
	muda_nome_player('carlos')

func _on_rogerio_pressed() -> void:
	muda_nome_player('rogerio')
