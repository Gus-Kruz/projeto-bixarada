extends CanvasLayer

@onready var dialogue_box: Control = $DialogueBox
@onready var name_text: Label = $DialogueBox/NameText
@onready var dialogue_text: Label = $DialogueBox/DialogueText

signal acabou

var dialogue_lines = [[]]
var current_line_index: int = 0
var dialogue_active: bool = false

func _ready() -> void:
	dialogue_box.visible = false
	

func start_dialogue(lines):

	#get_tree().paused = true
	
	dialogue_lines = lines
	current_line_index = 0
	dialogue_active = true
	dialogue_box.visible = true
	name_text.text = dialogue_lines[current_line_index][0]
	dialogue_text.text = dialogue_lines[current_line_index][1]

func _input(event):
	if not dialogue_active:
		return
	if event.is_action_pressed("confirmar"):
		advence_dialogue()

func advence_dialogue():
	if current_line_index < dialogue_lines.size()-1:
		current_line_index += 1
		name_text.text = dialogue_lines[current_line_index][0]
		dialogue_text.text = dialogue_lines[current_line_index][1]
	else:
		dialogue_active = false
		dialogue_box.visible = false
		acabou.emit()
