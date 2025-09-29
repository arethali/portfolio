extends TextureRect

@export var pic_file : String
@export var top_bott_padding : Vector2
@export var side_padding : int

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
	texture = load(pic_file)
	position = panel_top + Vector2(side_padding, top_bott_padding.x)
	size = Vector2(panel_x_size - side_padding * 2, panel_y_size - top_bott_padding.x - top_bott_padding.y )
	$"../../ColorRect".size = Vector2(panel_x_size - side_padding * 2, panel_y_size - top_bott_padding.x - top_bott_padding.y )
	$"../../ColorRect".position = position

func _on_panel_x_size(size):
	panel_x_size = size


func _on_panel_y_size(size):
	panel_y_size = size


func _on_recieve_pic_file(file):
	texture = load(file)
