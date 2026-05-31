extends Node2D

var ataquefraco = preload("res://cena_jogador/ataque_fraco.tscn")
var ataqueforte = preload("res://cena_jogador/ataque_forte.tscn")
var pos = [1500,540]
var vida = 100
var bpm = 0.5
var orientacao = "direita"
var timerTimes = [0]
var inputTimes = [0]
@onready var player2 = PersonagemDado.player2
@export var player1 : Node2D
@onready var timer = get_node("../Timer")
@onready var sprite = get_node("../Sprite2D")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play(player2+"_normal")
	self.position = Vector2(pos[0], pos[1])
	timer.start()
	
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
signal morte2
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if self.position.x > player1.position.x:
		orientacao = "esquerda"
		$AnimatedSprite2D.flip_h = false
	else:
		orientacao = "direita"
		$AnimatedSprite2D.flip_h = true
	if morreu or player1.morreu:
		return
	if vida <= 0:
		print("morreu")
		morreu = true
		morte2.emit()
	if Input.is_action_just_pressed("cima2"):
		inputTimes.append(Time.get_ticks_usec())
		if Ritmo.in_time(timerTimes[-1], inputTimes[-1]):
			input = "cima"
	if Input.is_action_just_pressed("esquerda2"):
		inputTimes.append(Time.get_ticks_usec())
		if Ritmo.in_time(timerTimes[-1], inputTimes[-1]):
			input = "esquerda"
	if Input.is_action_just_pressed("direita2"):
		inputTimes.append(Time.get_ticks_usec())
		if Ritmo.in_time(timerTimes[-1], inputTimes[-1]):
			input = "direita"
	if Input.is_action_just_pressed("fraco2"):
		inputTimes.append(Time.get_ticks_usec())
		if Ritmo.in_time(timerTimes[-1], inputTimes[-1]):
			input = "fraco"
	if Input.is_action_just_pressed("forte2"):
		inputTimes.append(Time.get_ticks_usec())
		if Ritmo.in_time(timerTimes[-1], inputTimes[-1]):
			input = "forte"
	self.position = Vector2(pos[0], pos[1])

signal fraco
signal forte
func _on_hurtbox_2d_2_area_entered(area: Area2D) -> void:
	if area.get_name() == "fraco":
		print("fraco")
		vida -= 10
		print("player 2 " + str(vida))
		fraco.emit()
	elif area.get_name() == "forte":
		print("forte")
		vida -= 20
		print("player 2 " + str(vida))
		forte.emit()
		
func _on_timer_timeout() -> void:
	timerTimes.append(Time.get_ticks_usec())
	timer.start()
	await get_tree().create_timer(0.07).timeout
	if input == player1.input and input == "fraco":
		return
	elif input == player1.input and input == "forte":
		return
	elif input == "cima":
		$AnimatedSprite2D.play(player2+"_normal")
		pos[1] -= 120
		await get_tree().create_timer(bpm).timeout
		pos[1] += 120
	elif input == "esquerda" and self.position.x > 60:
		$AnimatedSprite2D.play(player2+"_normal")
		if player1.position.x == self.position.x - 120 and player1.input != "esquerda":
			pos[0] -= 240
		elif player1.position.x == self.position.x - 240 and player1.input == "direita":
			pos[0] -= 240
		else:
			pos[0] -= 120
	elif input == "direita" and self.position.x < 1860:
		$AnimatedSprite2D.play(player2+"_normal")
		if player1.position.x == self.position.x + 120 and player1.input != "direita":
			pos[0] += 240
		elif player1.position.x == self.position.x + 240 and player1.input == "esquerda":
			pos[0] += 240
		else:
			pos[0] += 120
	elif input == "fraco" and player1.input != "forte":
		$AnimatedSprite2D.play(player2+"_fraco")
		ataque_fraco(pos[0], pos[1])
	elif input == "forte":
		$AnimatedSprite2D.play(player2+"_forte")
		ataque_forte(pos[0], pos[1])
	input = "nada"
