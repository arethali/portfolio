extends Control

@export_enum("Text", "Buttons", "Resume", "Skills") var format: String

@onready var text = %Text
@onready var buttons = %Buttons
@onready var resume = %Resume
@onready var skills = %Skills

func _ready():
	match format:
		"Text":
			text.visible = true
		"Buttons":
			buttons.visible = true
		"Resume":
			resume.visible = true
		"Skills":
			skills.visible = true
		_:
			print_debug("No format selected.")
			return

func _on_exit_pressed():
	if visible == true:
		visible = false
