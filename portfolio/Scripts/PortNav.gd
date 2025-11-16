extends Node2D

@onready var home_pos = 1920
@onready var projects_pos = 3828
@onready var personal_pos = 12
@export var camera : Camera2D
#@export var to_projects_button : Button
#@export var to_presonal_button : Button
#@export var to_projects_button : TextureButton
@export var label : RichTextLabel
@export var color_block : ColorRect
@onready var panel = $Buttons/Panel

var root_window

var arrow = load("res://Assets/UI/Global/Cursor/Arrow_green.png")
var point = load("res://Assets/UI/Global/Cursor/Pointing Hand small.png")

signal panel_offset(offset)

func _ready():
	#display settings
	root_window = get_tree().root
	DisplayServer.window_set_min_size(Vector2i(0, 480))
	DisplayServer.window_set_max_size(Vector2i(1920, 4200))
	root_window.size_changed.connect(_on_window_size_changed)
	
	#Set cursors
	Input.set_custom_mouse_cursor(arrow, Input.CURSOR_ARROW, Vector2(10,10))
	Input.set_custom_mouse_cursor(point, Input.CURSOR_POINTING_HAND, Vector2(0, 0))
	await get_tree().process_frame
	label.hide()
	color_block.hide()
	set_process(false)
	print("Hello There!\nThis portfolio was inspired by Buche.dev. \nGo check it out!\nMade in Aesprite and Godot.\nHosted by GitHub Pages.")
#
func _on_window_size_changed():
	var aspect_ratio = float(get_viewport().size.x)/float(get_viewport().size.y)
	if aspect_ratio <= 1920.0/1080.0:
		camera.offset.y = 0
		root_window.content_scale_mode = Window.CONTENT_SCALE_MODE_CANVAS_ITEMS
	else: 
		root_window.content_scale_mode = Window.CONTENT_SCALE_MODE_DISABLED
		camera.offset.y = float(1080.0 - float(get_viewport().size.y))
		emit_signal("panel_offset", camera.offset.y)
	

func _on_projects_pressed():
	ButtonsSound.clicked()
	camera.position.x = projects_pos
	#$AnimationPlayer.play("Cam_Home_to_Projects")

func _on_personal_pressed():
	ButtonsSound.clicked()
	camera.position.x = personal_pos


func _on_back_pressed():
	ButtonsSound.clicked()
	camera.position.x = home_pos

func _on_mouse_entered():
	ButtonsSound.hover()
	label.show()
	color_block.show()
	set_process(true)
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited():
	label.hide()
	color_block.hide()
	set_process(false)
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	label.position = mouse_pos + Vector2(-1,-1) + Vector2(12 ,12)
	color_block.position = mouse_pos + Vector2(-1,-1) + Vector2(8 ,8)
	


func _on_sign_entered():
	ButtonsSound.hover()
