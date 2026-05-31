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
			pos[1] -= 120
			await get_tree().create_timer(bpm).timeout
			pos[1] += 120
	if Input.is_action_just_pressed("esquerda1"):
		inputTimes.append(Time.get_ticks_usec())
		if Ritmo.in_time(timerTimes[-1], inputTimes[-1]):
			pos[0] -= 120
	if Input.is_action_just_pressed("direita1"):
		inputTimes.append(Time.get_ticks_usec())
		if Ritmo.in_time(timerTimes[-1], inputTimes[-1]):
			pos[0] += 120
	if Input.is_action_just_pressed("fraco1"):
		inputTimes.append(Time.get_ticks_usec())
		if Ritmo.in_time(timerTimes[-1], inputTimes[-1]):
			ataque_fraco(pos[0], pos[1])
	if Input.is_action_just_pressed("forte1"):
		inputTimes.append(Time.get_ticks_usec())
		if Ritmo.in_time(timerTimes[-1], inputTimes[-1]):
			ataque_forte(pos[0], pos[1])
	self.position = Vector2(pos[0], pos[1])


func _on_hurtbox_2d_1_area_entered(area: Area2D) -> void:
	if area.get_name() == "fraco":
		print("fraco")
		vida -= 10
		print("player 1 " + str(vida))
	elif area.get_name() == "forte":
		print("forte")
		vida -= 20
		print("player 1 " + str(vida))

func show_block() -> void:
	sprite.visible = true;
	await get_tree().create_timer(0.2).timeout;
	sprite.visible = false;

func _on_timer_timeout() -> void:
	show_block()
	timerTimes.append(Time.get_ticks_usec())
	timer.start()
	
	
