extends CharacterBody2D


const SPEED = 300.0
const BPM = 80.0

func _physics_process(delta: float) -> void:
	position.y += BPM*delta

	move_and_slide()
