extends RichTextLabel

@export var body_text : String
@export var left_margin : int
@export var right_margin : int
@export var margin_y : int

var panel_top_left_corner : Vector2
var panel_x_size : int
var panel_y_size : int

func _on_panel_top_left(dimes):
	panel_top_left_corner = dimes

func _ready():
	get_v_scroll_bar().modulate.a = 0
	var body_size_x = panel_x_size - left_margin - right_margin
	var body_size_y = panel_y_size - margin_y * 2
	if body_size_x < 4:
		print_debug("Box x too small")
		return
	if body_size_y < 4:
		print_debug("Box y too small")
		return
	size = Vector2i(body_size_x, body_size_y)
	position = panel_top_left_corner + Vector2(left_margin, margin_y)
	text = body_text
	var text_size_x = get_content_width()
	var text_size_y = get_content_height()
	#print(get_v_scroll_bar().page)
	#$"../ColorRect".size = Vector2i(text_size_x, text_size_y)


func _on_panel_x_size(size):
	panel_x_size = size


func _on_panel_y_size(size):
	panel_y_size = size
