extends RichTextLabel

@export var content : String
@export var padding : Vector2
@onready var meta_rect = $"../Subwindow title/ColorRect"
@onready var subwindow_title = %"Subwindow title"

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
	meta_rect.position = position
	text = content
	var text_size_x = get_content_width()
	var text_size_y = get_content_height()
	#size = Vector2i(text_size_x, text_size_y)
	#$"../../ColorRect".size = Vector2i(text_size_x, text_size_y)
	#$"../../ColorRect".position = position


func _on_panel_top_right(dimes):
	panel_top_right_corner = dimes

func _on_meta_clicked(meta):
	if FileAccess.file_exists(meta):
		OS.shell_open(ProjectSettings.globalize_path(meta))
		return
	print_debug("File doesn't exist")
	return

func _on_meta_hover_started(meta):
	var text_size_x = get_content_width() - 6
	var text_size_y = get_content_height() - 30
	subwindow_title.add_theme_color_override("default_color", Color(1.0,0.949,0.769,1.0))
	await get_tree().process_frame
	meta_rect.size = Vector2(text_size_x, text_size_y)
	meta_rect.position = Vector2(180.0, 2.0)
	meta_rect.show()


func _on_meta_hover_ended(meta):
	subwindow_title.add_theme_color_override("default_color", Color(0.588,0.604,0.424,1.0))
	await get_tree().process_frame
	meta_rect.hide()


func _on_set_link(file):
	text = "[url=" + file + "]" + content + "[/url]"
