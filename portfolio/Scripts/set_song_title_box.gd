extends ColorRect


var panel_length : float
var panel_top_left_corner : Vector2
var max_size : Vector2
@onready var song_box = $".."

func _ready():
	await get_tree().process_frame
	max_size = Vector2((panel_length - song_box.padding_sides.x - song_box.padding_sides.y), 40)
	size = max_size
	#$"../../ColorRect".size = max_size
	#$"../../ColorRect".position = position



func _on_panel_x_size(size):
	panel_length = size

func _on_panel_top_left(dimes):
	panel_top_left_corner = dimes
