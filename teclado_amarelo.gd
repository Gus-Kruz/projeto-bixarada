extends Area2D

var dentro = false



func _on_nota_amarela_area_entered(area: Area2D) -> void:
	dentro = true
	pass # Replace with function body.


func _on_nota_amarela_area_exited(area: Area2D) -> void:
	dentro = false
	pass # Replace with function body.
