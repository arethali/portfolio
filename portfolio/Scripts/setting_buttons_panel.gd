extends Control

@export_enum("Projects", "Camera", "Contact", "Art", "Films") var button_format: String = ""
@export var project_buttons : Array[TextureButton]
@export var film_buttons : Array[TextureButton]
@export var art_buttons : Array[TextureButton]
@export var row_container : Array[HBoxContainer]
@export var buttons_container : VBoxContainer
@onready var project_name = $"Project Name"
@onready var title = $Title
@onready var time_line = $TimeLine
@onready var body = $Body

signal overide_panel_size(h, w)

func _ready():
	match button_format:
		"Projects":
			title.content = "[b]Design Projects[/b]"
			project_name.padding = Vector2(20, 320)
			buttons_container.top_padding = 120
			time_line.padding = Vector2(-600.0, 332.0)
			time_line.left_alignment = false
			body.padding = Vector2(20, 388)
			emit_signal("overide_panel_size", 20, 40)
			add_buttons(project_buttons , row_container, 6)
		"Camera":
			pass
		"Contact":
			pass
		"Art":
			title.content = "[b]Illustrations[/b]"
			emit_signal("overide_panel_size", 20, 24)
			project_name.padding = Vector2(20, 500)
			buttons_container.top_padding = 100
			time_line.left_alignment = true
			time_line.padding = Vector2(20, 552)
			add_buttons(art_buttons, row_container, 6)
		"Films":
			title.content = "[b]Filmography[/b]"
			emit_signal("overide_panel_size", 20, 24)
			project_name.padding = Vector2(20, 284)
			buttons_container.top_padding = 100
			time_line.left_alignment = true
			time_line.padding = Vector2(20, 336)
			body.padding = Vector2(20, 388)
			add_buttons(film_buttons, row_container, 6)
		_:
			pass

func add_buttons(butt_arr : Array, buttons_container: Array[HBoxContainer], length : int):
	var container = 0
	for i in butt_arr:
		remove_child(i)
		buttons_container[container].add_child(i)
		i.visible = true
		if buttons_container[container].get_child_count() >= length:
			container += 1
