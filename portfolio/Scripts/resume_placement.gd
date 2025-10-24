extends Control
var panel_top_left_corner
var panel_x_size
var panel_y_size
var min_size : Vector2
@export var padding_sides : Vector2
@export var padding_vert : Vector2

@onready var resume = %Resume
@onready var cont_set = false
@onready var resume_scroll = %ResumeScroll


signal set_scroll

func _ready():
	await get_tree().process_frame
	min_size = Vector2((panel_x_size - padding_sides.x - padding_sides.y), (panel_y_size - padding_vert.x - padding_vert.y))
	resume_scroll.custom_minimum_size = min_size
	resume_scroll.size = min_size
	resume_scroll.get_v_scroll_bar().modulate.a = 0
	resume_scroll.position = panel_top_left_corner + Vector2(padding_sides.x , padding_vert.x) 

func _on_panel_x_size(size):
	panel_x_size = size

func _on_panel_y_size(size):
	panel_y_size = size
	
func _on_panel_top_left(dimes):
	panel_top_left_corner = dimes
	
func _on_container_resized():
	if resume and cont_set == false and visible == true:
		cont_set = true
		print("resume")
		emit_signal("set_scroll")
		#_check_overflow()
		return
