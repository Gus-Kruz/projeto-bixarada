extends Sprite2D

var ataquefraco = preload("res://cena_jogador/ataque_fraco.tscn")
var ataqueforte = preload("res://cena_jogador/ataque_forte.tscn")
var pos = [1500,540]
var vida = 100
var bpm = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position = Vector2(pos[0], pos[1])
	
func ataque_fraco(player_x, player_y):
	var fraco = ataquefraco.instantiate()
	fraco.position = Vector2(player_x-180, player_y+60)
	get_parent().add_child(fraco)
	await get_tree().create_timer(bpm).timeout
	fraco.queue_free()

func ataque_forte(player_x, player_y):
	var forte = ataqueforte.instantiate()
	forte.position = Vector2(player_x-180, player_y-60)
	get_parent().add_child(forte)
	await get_tree().create_timer(bpm).timeout
	forte.queue_free()
var morreu = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if morreu:
		return
	if vida <= 0:
		print("morreu")
		morreu = true
	if Input.is_action_just_pressed("cima2"):
		pos[1] -= 120
		await get_tree().create_timer(bpm).timeout
		pos[1] += 120
	if Input.is_action_just_pressed("esquerda2"):
		pos[0] -= 120
	if Input.is_action_just_pressed("direita2"):
		pos[0] += 120
	if Input.is_action_just_pressed("fraco2"):
		ataque_fraco(pos[0], pos[1])
	if Input.is_action_just_pressed("forte2"):
		ataque_forte(pos[0], pos[1])
	self.position = Vector2(pos[0], pos[1])
	print(delta)


func _on_hurtbox_2d_2_area_entered(area: Area2D) -> void:
	if area.get_name() == "fraco":
		print("fraco")
		vida -= 10
	elif area.get_name() == "forte":
		print("forte")
		vida -= 20
	print(vida)
