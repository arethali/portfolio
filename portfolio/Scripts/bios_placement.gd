extends Control

var panel_top_left_corner
var panel_x_size
var panel_y_size
var cont_set = false

var visible_lines
var min_size : Vector2
@export var padding_sides : Vector2
@export var padding_vert : Vector2

@export var texture : Texture2D
@export_multiline var about_text : String
#@export var about_overflow_text : String
@export_multiline var list_1_text : String
@export_multiline var list_2_text : String
@export var top_line_clipped = false

@onready var container = %Container
@onready var first_row = %"First Row"
@onready var second_row = %"Second Row"
@onready var portrait = %Portrait
@onready var about = %About
@onready var list_1 = %List1
@onready var list_2 = %List2
@onready var scroll_container = %ScrollContainer
@onready var about_overflow = %"About Overflow"
@onready var bios = %Bios
@onready var panel = $"../Panel"

signal set_scroll
func _ready():
	await get_tree().process_frame
	min_size = Vector2((panel_x_size - padding_sides.x - padding_sides.y), (panel_y_size - padding_vert.x - padding_vert.y))
	scroll_container.custom_minimum_size = min_size
	scroll_container.size = min_size
	scroll_container.get_v_scroll_bar().modulate.a = 0
	scroll_container.position = panel_top_left_corner + Vector2(padding_sides.x , padding_vert.x) 
	if texture.get_size() != Vector2(208,288):
		print_debug("Texture not the right size")
		return
	await get_tree().process_frame
	portrait.texture = texture
	about.text = about_text

	list_1.text = list_1_text
	list_2.text = list_2_text
	#await get_tree().process_frame
	#first_row.visible = true
	#second_row.visible = true
	

func _on_panel_x_size(size):
	panel_x_size = size

func _on_panel_y_size(size):
	panel_y_size = size
	
func _on_panel_top_left(dimes):
	panel_top_left_corner = dimes


func _check_overflow():
	await get_tree().process_frame
	var lines_array : Array[String]
	var prev_line = 0
	var string_to_add = ""
	var total_lines = about.get_line_count()
	visible_lines = about.get_visible_line_count()
	var length = 0
	if total_lines > visible_lines:
		#if about_overflow_text == "":
			#print_debug("Text Overflow")
			#return
		print(about_text.length())
		for i in range(about_text.length()+1):
			var current_line = about.get_character_line(i)
			if i == about_text.length():
				lines_array.append(string_to_add)
				break
			if current_line > prev_line :
				lines_array.append(string_to_add)
				string_to_add = ""
			string_to_add += about.text[i]
			length += 1
			prev_line = current_line
		if top_line_clipped == true:
			visible_lines -= 1
		about.text = _stringify_array(0, visible_lines, lines_array)
		about_overflow.text = _stringify_array(visible_lines, total_lines, lines_array)

func _stringify_array(start : int, end : int, array : Array[String]):
	var string = ""
	var pos = start
	for i in range(end-start):
		string += array[pos]
		pos += 1
	return string
	
func _on_container_resized():
	if bios and cont_set == false and visible == true:
		cont_set = true
		print("bios")
		_check_overflow()
		await get_tree().process_frame
		emit_signal("set_scroll")
		return
