extends Node2D

@export var file: JSON

func _ready():
	var json = JSON.new()
	var json_text = JSON.stringify(file.get_as_text())
	file.close()

	var error = json.parse(json_text)
	if error == OK:
		var data_received = json.data
		if typeof(data_received) == TYPE_ARRAY:
			# process code here
			pass
