extends Sprite2D
var pos = [1500,540]
var vida = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position = Vector2(pos[0], pos[1])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if vida <= 0:
		print("morreu")
	else:
		print(vida)


func _on_hurtbox_2d_2_area_entered(area: Area2D) -> void:
	if area.get_name() == "fraco":
		print("fraco")
		vida -= 10
	elif area.get_name() == "forte":
		print("forte")
		vida -= 20
