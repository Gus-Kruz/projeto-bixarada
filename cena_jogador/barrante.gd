extends Node2D
@onready var sprite = get_node("Sprite2D")
@onready var timer = get_node("../Timer")
var crescendo = "neutro"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	await get_tree().create_timer(0.20).timeout
	crescendo = "crescendo"
	await get_tree().create_timer(0.15).timeout
	crescendo = "diminuindo"
	await get_tree().create_timer(0.15).timeout
	crescendo = "neutro"
var scaling = 4
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if crescendo == "crescendo":
		scaling += 0.15
	elif crescendo == "diminuindo":
		scaling -= 0.15
	sprite.scale = Vector2(scaling, scaling)
		


func _on_timer_timeout() -> void:
	timer.start()
	await get_tree().create_timer(0.20).timeout
	crescendo = "crescendo"
	await get_tree().create_timer(0.15).timeout
	crescendo = "diminuindo"
	await get_tree().create_timer(0.15).timeout
	crescendo = "neutro"
	
