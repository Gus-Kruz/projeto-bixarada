extends Area2D


const BPM = 100
var dentro = false

func _physics_process(delta: float) -> void:
	position.y += BPM*delta
	if dentro:
		if Input.is_action_pressed("baixo1"):
			dentro = false
			position.y = 1
		

func _on_teclado_vermelho_area_entered(area: Area2D) -> void:
	dentro = true
	pass # Replace with function body.


func _on_teclado_vermelho_area_exited(area: Area2D) -> void:
	dentro = false
	position.y = 1
	pass # Replace with function body.
