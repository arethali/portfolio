extends CanvasLayer

var audio_on : bool 
var fxs_on : bool = true

var root_window
var anim 
var arrow = load("res://Assets/UI/Global/Cursor/Arrow_green.png")
var point = load("res://Assets/UI/Global/Cursor/Pointing Hand small.png")
var wait = load("res://Assets/UI/Global/Cursor/Wait_v2.png")

func _ready():
	root_window = get_tree().root
	root_window.size_changed.connect(_on_window_size_changed)
	Input.set_custom_mouse_cursor(arrow, Input.CURSOR_ARROW, Vector2(0,0))
	Input.set_custom_mouse_cursor(point, Input.CURSOR_POINTING_HAND, Vector2(0, 0))
	Input.set_custom_mouse_cursor(wait, Input.CURSOR_BUSY, Vector2(0, 0))
	#await get_tree().create_timer(.5).timeout


func _hide_buttons():
	$VBoxContainer/Button.hide()
	$VBoxContainer/Button2.hide()
	#print("hide")
	
func _on_button_pressed():
	Audio.audio_on = true
	Audio.fxs_on = true
	ButtonsSound.clicked()
	Loading.load_scene()
	queue_free()
	
	
func _on_button_2_pressed():
	Audio.audio_on = false
	Audio.fxs_on = false
	_hide_buttons()
	Loading.load_scene()
	queue_free()
	ButtonsSound.clicked()

func _on_window_size_changed():
	var aspect_ratio = float(get_viewport().size.x)/float(get_viewport().size.y)
	if aspect_ratio <= 1920.0/1080.0:
		root_window.content_scale_mode = Window.CONTENT_SCALE_MODE_CANVAS_ITEMS
	else: 
		root_window.content_scale_mode = Window.CONTENT_SCALE_MODE_DISABLED


func _on_button_mouse_entered():
	ButtonsSound.hover()
