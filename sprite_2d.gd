extends Sprite2D
var ataquefraco = preload("res://cena_jogador/ataque_fraco.tscn")
var ataqueforte = preload("res://cena_jogador/ataque_forte.tscn")
var pos = [540,540]
var bpm = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position = Vector2(pos[0], pos[1])
	
func ataque_fraco(player_x, player_y):
	var fraco = ataquefraco.instantiate()
	fraco.position = Vector2(player_x+180, player_y+60)
	get_parent().add_child(fraco)
	await get_tree().create_timer(bpm).timeout
	fraco.queue_free()

func ataque_forte(player_x, player_y):
	var forte = ataqueforte.instantiate()
	forte.position = Vector2(player_x+180, player_y-60)
	get_parent().add_child(forte)
	await get_tree().create_timer(bpm).timeout
	forte.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("cima1"):
		pos[1] -= 120
		await get_tree().create_timer(bpm).timeout
		pos[1] += 120
	if Input.is_action_just_pressed("esquerda1"):
		pos[0] -= 120
	if Input.is_action_just_pressed("direita1"):
		pos[0] += 120
	if Input.is_action_just_pressed("fraco1"):
		ataque_fraco(pos[0], pos[1])
	if Input.is_action_just_pressed("forte1"):
		ataque_forte(pos[0], pos[1])
	self.position = Vector2(pos[0], pos[1])
