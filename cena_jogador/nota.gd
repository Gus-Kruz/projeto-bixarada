extends Node2D

@onready var timer = get_node("../Timer")
@onready var nota = preload("res://cena_jogador/nota.tscn")
var pos = [2000, 1000]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pos[0] -= 36.67
	self.position = Vector2(pos[0], pos[1])

func disable_node(node):
	node.set_process(false)
	node.set_process_input(false)
	node.set_process_internal(false)
	node.set_process_unhandled_input(false)
	node.set_process_unhandled_key_input(false)
	node.set_physics_process(false)
	node.set_physics_process_internal(false)

func _on_timer_timeout() -> void:
	var notas = nota.instantiate()
	get_parent().add_child(notas)
	timer.start()


func _on_area_2d_area_entered(area: Area2D) -> void:
	self.visible = false
	disable_node(self)
