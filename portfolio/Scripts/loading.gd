extends CanvasLayer
var loading_scene_file = "res://Scripts/loading.tscn"
var main_scene = "res://Scripts/Main.tscn"
var prog_bar : ProgressBar
var percent_label : RichTextLabel
var head_label : RichTextLabel
var loaded = false
var _progress: Array = []
var load_status = 0
var fade_anim : AnimationPlayer
var scene_instance
var instantiated = false
var in_loading = false

var root_window

func _ready():
	set_process(false)
	
	root_window = get_tree().root
	root_window.size_changed.connect(_on_window_size_changed)

func load_scene():
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if instantiated == false:
		var loading_scene = load(loading_scene_file)
		scene_instance = loading_scene.instantiate()
		get_tree().root.call_deferred("add_child", scene_instance)
		instantiated = true
	ResourceLoader.load_threaded_request(main_scene, "", true)
	prog_bar = scene_instance.get_node("Control/ProgressBar")
	percent_label = scene_instance.get_node("Control/Label")
	head_label = scene_instance.get_node("Control/Headphones")
	fade_anim = scene_instance.get_node("AnimationPlayer")
	set_process(true)
	return

#


func _process(delta):
	if loaded == true:
		load_main()
		return
	load_status = ResourceLoader.load_threaded_get_status(main_scene, _progress)
	#print(load_status)
	match load_status:
		0,2:
			print_debug("ERROR: Loading Failed")
			get_tree().quit()
		1:
			var progress = _progress[0]
			percent_label.text = str(int(progress * 100)) + "%"
			prog_bar.value = progress * 100
			if Audio.audio_on == true:
				head_label.visible = true
		3:
			loaded = true
	
func _on_window_size_changed():
	var aspect_ratio = float(get_viewport().size.x)/float(get_viewport().size.y)
	if aspect_ratio <= 1920.0/1080.0:
		root_window.content_scale_mode = Window.CONTENT_SCALE_MODE_CANVAS_ITEMS
	else: 
		root_window.content_scale_mode = Window.CONTENT_SCALE_MODE_DISABLED


func load_main():
	set_process(false)
	fade_anim.play("Fade_out")
	get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(main_scene))
	await fade_anim.animation_finished
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	scene_instance.queue_free()
	#print("finished")
	#print("on", Audio.audio_on)
	return
