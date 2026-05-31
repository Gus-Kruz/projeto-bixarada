extends Node2D

var ataquefraco = preload("res://cena_jogador/ataque_fraco.tscn")
var ataqueforte = preload("res://cena_jogador/ataque_forte.tscn")
var pos = [540,540]
var bpm = 0.5
var vida = 100
var orientacao = "direita"
var timerTimes = [0]
var inputTimes = [0]
@export var player2 : Node2D
@onready var timer = get_node("../Timer")
@onready var sprite = get_node("../Sprite2D")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position = Vector2(pos[0], pos[1])
	timer.start()
	
func ataque_fraco(player_x, player_y):
	var fraco = ataquefraco.instantiate()
	if orientacao == "direita":
		fraco.position = Vector2(player_x+180, player_y+60)
	else:
		fraco.position = Vector2(player_x-180, player_y+60)
	get_parent().add_child(fraco)
	await get_tree().create_timer(bpm).timeout
	fraco.queue_free()

func ataque_forte(player_x, player_y):
	var forte = ataqueforte.instantiate()
	if orientacao == "direita":
		forte.position = Vector2(player_x+180, player_y-60)
	else:
		forte.position = Vector2(player_x-180, player_y-60)
	get_parent().add_child(forte)
	await get_tree().create_timer(bpm).timeout
	forte.queue_free()
var morreu = false
var input = "nada"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.position.x > player2.position.x:
		orientacao = "esquerda"
		$Sprite2D.flip_h = true
	else:
		orientacao = "direita"
		$Sprite2D.flip_h = false
	if morreu:
		return
	if vida <= 0:
		print("morreu")
		morreu = true
	if Input.is_action_just_pressed("cima1"):
		inputTimes.append(Time.get_ticks_usec())
		if Ritmo.in_time(timerTimes[-1], inputTimes[-1]):
			input = "cima"
	if Input.is_action_just_pressed("esquerda1"):
		inputTimes.append(Time.get_ticks_usec())
		if Ritmo.in_time(timerTimes[-1], inputTimes[-1]):
			input = "esquerda"
	if Input.is_action_just_pressed("direita1"):
		inputTimes.append(Time.get_ticks_usec())
		if Ritmo.in_time(timerTimes[-1], inputTimes[-1]):
			input = "direita"
	if Input.is_action_just_pressed("fraco1"):
		inputTimes.append(Time.get_ticks_usec())
		if Ritmo.in_time(timerTimes[-1], inputTimes[-1]):
			input = "fraco"
	if Input.is_action_just_pressed("forte1"):
		inputTimes.append(Time.get_ticks_usec())
		if Ritmo.in_time(timerTimes[-1], inputTimes[-1]):
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
	timerTimes.append(Time.get_ticks_usec())
	timer.start()
	await get_tree().create_timer(0.07).timeout
	if input == "cima":
		pos[1] -= 120
		await get_tree().create_timer(bpm-0.07).timeout
		pos[1] += 120
	if input == "esquerda":
		pos[0] -= 120
	if input == "direita":
		pos[0] += 120
	if input == "fraco":
		ataque_fraco(pos[0], pos[1])
	if input == "forte":
		ataque_forte(pos[0], pos[1])
	input = "nada"
