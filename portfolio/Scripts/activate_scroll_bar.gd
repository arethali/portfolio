extends VScrollBar

@export var text_body : RichTextLabel
@export var scroll_container : ScrollContainer
@export var padding_x : int
@export var padding_y_top : int
@export var padding_y_bott : int
var panel_top_right_corner : Vector2
var scroll_y_size : int
var scroll
@onready var bios = %Bios

func _on_panel_top_right(dimes):
	panel_top_right_corner = dimes + Vector2(-20, 0)
	
func _ready():
	if text_body:
		scroll = text_body.get_v_scroll_bar()
		await get_tree().process_frame
		scroll.connect("value_changed", _on_rich_text_label_value_changed)
		_set_scroll()
	if scroll_container:
		scroll = scroll_container.get_v_scroll_bar()
		await get_tree().process_frame
		scroll.connect("value_changed", _on_rich_text_label_value_changed)
		#_set_scroll()
	#print_debug("scroll container not set")
	return

func _set_scroll():
	await get_tree().process_frame
	if scroll.max_value <= scroll.page:
		return
	max_value = scroll.max_value
	page = scroll.page
	print("page", page)
	position = panel_top_right_corner - Vector2(padding_x, padding_y_top * -1)
	size.y = (scroll_y_size - padding_y_top - padding_y_bott)
	return

func _on_rich_text_label_value_changed(value):
	#print(value)
	$".".value = scroll.value 

func _on_panel_y_size(size):
	scroll_y_size = size


func _on_value_changed(value):
	scroll.value  = value


func _on_set_scroll():
	_set_scroll()
