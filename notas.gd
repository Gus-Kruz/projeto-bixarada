extends Node2D
var babys

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	babys = $".".get_children()
	for nota in babys:
		nota.visible = false
	for nota in babys:
		var x = randf_range(1.2,2.2)
		await get_tree().create_timer(x).timeout
		nota.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
