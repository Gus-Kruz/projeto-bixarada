extends TextureProgressBar
var vida = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update():
	value = vida

func _on_player_2_fraco() -> void:
	print("teste")
	vida -= 10
	update()

func _on_player_2_forte() -> void:
	vida -= 20
	update()
