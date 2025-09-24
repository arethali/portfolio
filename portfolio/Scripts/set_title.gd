extends RichTextLabel

@export var title : String
@export var padding : Vector2

var panel_top_left_corner : Vector2
var panel_x_size : int
var panel_y_size : int

func _on_panel_top_left(dimes):
	panel_top_left_corner = dimes

func _ready():
	position = panel_top_left_corner + padding
	text = title
	var text_size_x = get_content_width()
	var text_size_y = get_content_height()
	#$"../ColorRect".size = Vector2i(text_size_x, text_size_y)
	if text_size_x > panel_x_size:
		print_debug("Box x too small")
		return
	if text_size_y > panel_y_size:
		print_debug("Box y too small")
		return

func _on_panel_x_size(size):
	panel_x_size = size


func _on_panel_y_size(size):
	panel_y_size = size
