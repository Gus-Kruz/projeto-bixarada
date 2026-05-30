extends Sprite2D
@onready var ataque = preload("res://ataque.tscn")
var pos = [540,540]
var bpm = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position = Vector2(pos[0], pos[1])
func ataque_fraco(pos):
	var ataque_fraco = ataque.instantiate()
	add_child(ataque_fraco)

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
		ataque_fraco(pos)
	self.position = Vector2(pos[0], pos[1])
