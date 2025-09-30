extends VBoxContainer

@export var padding_sides : Vector2
@export var padding_top : int

var panel_length : float
var panel_top_left_corner : Vector2
var max_size : Vector2

func _ready():
	await get_tree().process_frame
	position = panel_top_left_corner + Vector2(padding_sides.x , padding_top) 
	max_size = Vector2((panel_length - padding_sides.x - padding_sides.y), 40)
	custom_minimum_size =  max_size
	size = max_size
	
	$"../../ColorRect".size = size
	$"../../ColorRect".position = position

func _on_panel_x_size(size):
	panel_length = size

func _on_panel_top_left(dimes):
	panel_top_left_corner = dimes
