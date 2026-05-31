extends Node2D
@onready var player1 = PersonagemDado.player1

var ataquefraco = preload("res://cena_jogador/ataque_fraco.tscn")
var ataqueforte = preload("res://cena_jogador/ataque_forte.tscn")
var pos = [540,540]
var bpm = 0.5
var vida = 100
var orientacao = "direita"
var timerTime
var inputTime
var tempo
var personagem

@export var player2 : Node2D
@onready var timer = get_node("../Timer")
@onready var musica = get_node("../Timer2")
@onready var sprite = get_node("../Sprite2D")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play(player1+"_normal")
	self.position = Vector2(pos[0], pos[1])
	tempo = 1
	timer.start()
	musica.play()
	print(player1)
	
func ataque_fraco(player_x, player_y):
	var fraco = ataquefraco.instantiate()
	if orientacao == "direita":
		fraco.position = Vector2(player_x+120, player_y+60)
	else:
		fraco.position = Vector2(player_x-120, player_y+60)
	get_parent().add_child(fraco)
	await get_tree().create_timer(bpm).timeout
	fraco.queue_free()

func ataque_forte(player_x, player_y):
	var forte = ataqueforte.instantiate()
	if orientacao == "direita":
		forte.position = Vector2(player_x+120, player_y-60)
	else:
		forte.position = Vector2(player_x-120, player_y-60)
	get_parent().add_child(forte)
	await get_tree().create_timer(bpm).timeout
	forte.queue_free()
var morreu = false
var input = "nada"
signal morte1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.position.x > player2.position.x:
		orientacao = "esquerda"
		$AnimatedSprite2D.flip_h = false
	else:
		orientacao = "direita"
		$AnimatedSprite2D.flip_h = true
	if morreu or player2.morreu:
		return
	if vida <= 0:
		print("morreu")
		morte1.emit()
		morreu = true
	if Input.is_action_just_pressed("cima1"):
		inputTime = Time.get_ticks_usec()
		if Ritmo.in_time(timerTime, inputTime):
			input = "cima"
	if Input.is_action_just_pressed("esquerda1"):
		inputTime = Time.get_ticks_usec()
		if Ritmo.in_time(timerTime, inputTime):
			input = "esquerda"
	if Input.is_action_just_pressed("direita1"):
		inputTime = Time.get_ticks_usec()
		if Ritmo.in_time(timerTime, inputTime):
			input = "direita"
	if Input.is_action_just_pressed("fraco1"):
		inputTime = Time.get_ticks_usec()
		if Ritmo.in_time(timerTime, inputTime):
			input = "fraco"
	if Input.is_action_just_pressed("forte1"):
		inputTime = Time.get_ticks_usec()
		if Ritmo.in_time(timerTime, inputTime):
			input = "forte"
	self.position = Vector2(pos[0], pos[1])

signal fraco
signal forte
func _on_hurtbox_2d_1_area_entered(area: Area2D) -> void:
	if area.get_name() == "fraco":
		print("fraco")
		vida -= 10
		print("player 1 " + str(vida))
		fraco.emit()
	elif area.get_name() == "forte":
		print("forte")
		vida -= 20
		print("player 1 " + str(vida))
		forte.emit()

func _on_timer_timeout() -> void:
	timerTime = Time.get_ticks_usec()
	timer.start()
	await get_tree().create_timer(0.07).timeout
	tempo += 1 
	if input == player2.input and input == "fraco":
		return
	elif input == player2.input and input == "forte":
		return
	elif input == "cima":
		$AnimatedSprite2D.play(player1+"_normal")
		pos[1] -= 120
		await get_tree().create_timer(bpm).timeout
		pos[1] += 120
	elif input == "esquerda" and self.position.x > 60:
		$AnimatedSprite2D.play(player1+"_normal")
		if player2.position.x == self.position.x - 120 and player2.input != "esquerda":
			pos[0] -= 240
		elif player2.position.x == self.position.x - 240 and player2.input == "direita":
			pos[0] -= 240
		else:
			pos[0] -= 120
	elif input == "direita" and self.position.x < 1860:
		$AnimatedSprite2D.play(player1+"_normal")
		if player2.position.x == self.position.x + 120 and player2.input != "direita":
			pos[0] += 240
		elif player2.position.x == self.position.x + 240 and player2.input == "esquerda":
			pos[0] += 240
		else:
			pos[0] += 120
	elif input == "fraco" and player2.input != "forte":
		$AnimatedSprite2D.play(player1+"_fraco")
		ataque_fraco(pos[0], pos[1])
	elif input == "forte":
		$AnimatedSprite2D.play(player1+"_forte")
		print("forte")
		ataque_forte(pos[0], pos[1])
	input = "nada"
	
