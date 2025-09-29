extends RichTextLabel

@export var content : String
@export var padding : Vector2

@export var left_alignment : bool = true
var panel_top_left_corner : Vector2
var panel_top_right_corner : Vector2
var panel_top : Vector2
var panel_x_size : int
var panel_y_size : int

func _on_panel_top_left(dimes):
	panel_top_left_corner = dimes

func _ready():
	await get_tree().process_frame
	set_on_hover(content)
	if left_alignment == true:
		horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		panel_top = panel_top_left_corner
	else:
		horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		panel_top = panel_top_right_corner

func _on_panel_x_size(size):
	panel_x_size = size


func _on_panel_y_size(size):
	panel_y_size = size

func set_on_hover(content : String):
	position = panel_top + padding
	text = content
	var text_size_x = get_content_width()
	var text_size_y = get_content_height()
	#size = Vector2i(text_size_x, text_size_y)
	#$"../../ColorRect".size = Vector2i(text_size_x, text_size_y)
	#$"../../ColorRect".position = position


func _on_panel_top_right(dimes):
	panel_top_right_corner = dimes
