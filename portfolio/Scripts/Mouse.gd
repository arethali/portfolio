extends Area2D


@export var outline_text : RichTextLabel
@export var color_block : ColorRect
@export var label_name : String
@export var long : bool = false

#random  text output
@export_multiline var text_array : Array[String]
@export var title : String

@onready var light : Color =  Color(1.0,0.949,0.769)
@onready var dork : Color =  Color(0.188,0.153,0.024)

signal set_rand_text(rand_text : String)

func _on_mouse_entered():
	outline_text.text = label_name
	var text_size_x = outline_text.get_content_width() + 7
	var text_size_y = outline_text.get_content_height()
	if long == true:
		text_size_y += 8
		outline_text.size.y = 27
	color_block.size = Vector2(text_size_x, text_size_y)
	#print(outline_text.size.y)
	



func _on_mouse_exited():
	outline_text.text = ""
	outline_text.size = Vector2(0,0)
	color_block.size = Vector2(0,0)


var pos := 0
#random text output
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if text_array.size() == 0:
				print_debug("Empty text array")
				return
			var curr_pos := pos
			pos = randi_range(0,text_array.size()-1)
			if curr_pos == pos:
				while curr_pos == pos:
					pos = randi_range(0,text_array.size()-1)
					await get_tree().process_frame
			emit_signal("set_rand_text", text_array[pos])
