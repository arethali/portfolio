extends CanvasLayer

var audio_on : bool 
var fxs_on : bool = true

var root_window
var anim 
var arrow = load("res://Assets/UI/Global/Cursor/Arrow_green combined.png")
var point = load("res://Assets/UI/Global/Cursor/Pointing Hand_combined.png")
var wait = load("res://Assets/UI/Global/Cursor/Wait_v2.png")

var text
var text_1 := "Hello there! \n Are you in a hurry or on your phone?"
var text_2 := "Great! \n Would you like the sound on?"

func _ready():
	root_window = get_tree().root
	root_window.size_changed.connect(_on_window_size_changed)
	Input.set_custom_mouse_cursor(arrow, Input.CURSOR_ARROW, Vector2(0,0))
	Input.set_custom_mouse_cursor(point, Input.CURSOR_POINTING_HAND, Vector2(0, 0))
	Input.set_custom_mouse_cursor(wait, Input.CURSOR_BUSY, Vector2(0, 0))
	#var screen_size = DisplayServer.screen_get_size()
	#DisplayServer.window_set_size(screen_size)
	_on_window_size_changed()
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	#await get_tree().create_timer(.5).timeout


func _hide_buttons():
	$VBoxContainer/Button.hide()
	$VBoxContainer/Button2.hide()
	#print("hide")


	
func _on_button_pressed():
	Audio.audio_on = true
	Audio.fxs_on = true
	ButtonsSound.clicked()
	get_node("AnimationPlayer").play("Label2_out")
	await get_tree().create_timer(.5).timeout
	Loading.load_scene()
	queue_free()
	
	
func _on_button_2_pressed():
	ButtonsSound.clicked()
	Audio.audio_on = false
	Audio.fxs_on = false
	get_node("AnimationPlayer").play("Label2_out")
	await get_tree().create_timer(.5).timeout
	Loading.load_scene()
	queue_free()
	

func _on_window_size_changed():
	await get_tree().process_frame
	var aspect_ratio = float(get_viewport().size.x)/float(get_viewport().size.y)
	if aspect_ratio <= 1920.0/1080.0:
		root_window.content_scale_mode = Window.CONTENT_SCALE_MODE_CANVAS_ITEMS
	else: 
		root_window.content_scale_mode = Window.CONTENT_SCALE_MODE_DISABLED
	if aspect_ratio <= 1080.0/1920.0:
		DisplayServer.screen_set_orientation(DisplayServer.SCREEN_SENSOR_LANDSCAPE)

func _on_button_mouse_entered():
	ButtonsSound.hover()


func _to_notion_pressed():
	JavaScriptBridge.eval("window.location.href='https://arethali.notion.site/Hello-there-077ff4e45733405ba3c33945093b8675?pvs=143'")
	print("To Notion")

func _on_continue_pressed():
	get_node("AnimationPlayer").play("Label1_out")
