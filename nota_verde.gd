extends Area2D


const BPM = 80.0
var dentro = false

func _physics_process(delta: float) -> void:
	position.y += BPM*delta
	if dentro:
		if Input.is_action_pressed('direita1'):
			position.y = 1
			dentro = false

func _on_teclado_verde_area_entered(area: Area2D) -> void:
	dentro = true
	pass # Replace with function body.


func _on_teclado_verde_area_exited(area: Area2D) -> void:
	position.y = 1
	dentro = false
	pass # Replace with function body.
