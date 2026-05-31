extends Area2D
@export var nota_amarela:Area2D
@onready var timer: Timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	pass # Replace with function body.

func _on_timeout():
	pass

func on_yipe():
	self.visible = true
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
