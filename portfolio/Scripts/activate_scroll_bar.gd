extends VScrollBar

@export var text_body : RichTextLabel
@export var padding_x : int
@export var padding_y_top : int
@export var padding_y_bott : int
var panel_top_right_corner : Vector2
var scroll_y_size : int
@onready var text_scroll = text_body.get_v_scroll_bar()

func _on_panel_top_right(dimes):
	panel_top_right_corner = dimes + Vector2(-20, 0)
	
func _ready():
	text_scroll.connect("value_changed", _on_rich_text_label_value_changed)
	await get_tree().process_frame
	#print(text_scroll.max_value)
	#print(text_scroll.page)
	if text_scroll.max_value <= text_scroll.page:
		return
	max_value = text_scroll.max_value
	page = text_scroll.page
	#print(text_scroll.page)
	position = panel_top_right_corner - Vector2(padding_x, padding_y_top * -1)
	size.y = (scroll_y_size - padding_y_top - padding_y_bott)
	#print(size.x)
	
func _on_rich_text_label_value_changed(value):
	#print(value)
	$".".value = text_scroll.value 

func _on_panel_y_size(size):
	scroll_y_size = size


func _on_value_changed(value):
	text_scroll.value  = value
