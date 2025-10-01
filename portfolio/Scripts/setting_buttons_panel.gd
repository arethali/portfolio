extends Control

@export_enum("Projects", "Camera", "Contact", "Art", "Films", "Music") var button_format: String = ""
@export var project_buttons : Array[TextureButton]
@export var film_buttons : Array[TextureButton]
@export var art_buttons : Array[TextureButton]
@export var contact_buttons : Array[TextureButton]
@export var row_container : Array[HBoxContainer]
@export var buttons_container : VBoxContainer
@onready var project_name = $"Project Name"
@onready var title = $Title
@onready var time_line = $TimeLine
@onready var body = $Body
@onready var subwindow_title = %"Subwindow title"
@onready var looky_back = %"Looky Back"
@onready var place_image = %PlaceImage
@onready var song_name = %"Song Name"
@onready var music_buttons = $"Music Buttons"
@onready var mute = $Mute

signal overide_panel_size(h, w)

func _ready():
	match button_format:
		"Projects":
			title.content = "[b]Design Projects[/b]"
			project_name.padding = Vector2(20, 320)
			buttons_container.top_padding = 120
			time_line.padding = Vector2(-600.0, 332.0)
			time_line.left_alignment = false
			body.visible = true
			body.padding = Vector2(20, 388)
			emit_signal("overide_panel_size", 20, 40)
			add_buttons(project_buttons , row_container, 6)
		"Camera":
			print("camera")
			pass
		"Contact":
			title.content = "[b]Contact Me[/b]"
			emit_signal("overide_panel_size", 7, 14)
			project_name.visible  = false
			buttons_container.top_padding = 112
			time_line.visible  = false
			add_buttons(contact_buttons, row_container, 5)
		"Art":
			title.content = "[b]Illustrations[/b]"
			emit_signal("overide_panel_size", 20, 24)
			project_name.padding = Vector2(20, 500)
			buttons_container.top_padding = 100
			time_line.left_alignment = true
			time_line.padding = Vector2(20, 552)
			subwindow_title.padding = Vector2(292.0, 580.0)
			subwindow_title.left_alignment = false
			looky_back.top_padding = 584.0
			place_image.top_bott_padding= Vector2(100, 80)
			place_image.side_padding = 20
			add_buttons(art_buttons, row_container, 6)
		"Films":
			title.content = "[b]Filmography[/b]"
			emit_signal("overide_panel_size", 20, 24)
			project_name.padding = Vector2(20, 284)
			buttons_container.top_padding = 100
			time_line.left_alignment = true
			time_line.padding = Vector2(20, 336)
			body.visible = true
			body.padding = Vector2(20, 388)
			add_buttons(film_buttons, row_container, 6)
		"Music":
			title.visible = false
			project_name.visible = false
			emit_signal("overide_panel_size", 5, 14)
			song_name.visible = true
			music_buttons.visible = true
			music_buttons.top_padding = 92
			mute.visible = true
			pass
		_:
			print_debug("No button Layout choosen.")
			return

func add_buttons(butt_arr : Array, buttons_container: Array[HBoxContainer], length : int):
	var container = 0
	for i in butt_arr:
		remove_child(i)
		buttons_container[container].add_child(i)
		i.visible = true
		if buttons_container[container].get_child_count() >= length:
			container += 1
