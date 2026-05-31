extends Area2D
@export var mensagem_boa:Area2D
var BPM = 80
var cond = 0
var dentro = false

signal yipe
func _ready() -> void:
	var mensagem_boa = get_node("../mensagem_boa")
	yipe.connect(mensagem_boa.on_yipe)



func _physics_process(delta: float) -> void:
	position.y += BPM*delta
	if dentro:
		if Input.is_action_just_pressed("cima1"):
			yipe.emit()
			position.y = 1
			dentro = false


func _on_teclado_amarelo_area_entered(area: Area2D) -> void:
	dentro = true
	
func _on_teclado_amarelo_area_exited(area: Area2D) -> void:
	dentro = false
	position.y = 1
	pass # Replace with function body.
