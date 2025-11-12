extends TextureButton

@export_enum("Link", "Window") var button_type : String
@export var link_path : String = ""

@export var gif : bool = false
@export var frames : Array[String]
@export var fps : float
@export var title_label : RichTextLabel
@export var time_label : RichTextLabel
@export var body_label : RichTextLabel

@export var title : String
@export var time : String = ""
@export_multiline var body : String

@export var pic_file : String
@export var camera : bool = false
#hide when window
@onready var cam_scroll = %CamScroll
@onready var button_container = %"Button Container"
@onready var subwindow_title = %"Subwindow title"
@onready var place_image = %PlaceImage
@onready var looky_back = %"Looky Back"

@onready var default_title

signal set_body(body : String)
signal set_hover(content : String)
signal send_pic_file (file : String)
signal send_gif_file (arr : Array, fpsec : int)
signal set_link (file : String)

func _ready():
	await get_tree().process_frame
	if camera == false:
		default_title = title_label.content

func _on_mouse_entered():
	ButtonsSound.hover()
	title_label.text = title
	time_label.visible = true
	emit_signal("set_hover", time)
	if body_label:
		emit_signal("set_body", body)


func _on_mouse_exited():
	title_label.text = default_title
	time_label.visible = false
	if body_label:
		body_label.visible = false



func _on_pressed():
	ButtonsSound.clicked()
	match button_type:
		"Link":
			if link_path:
				OS.shell_open(link_path)
				return
			return
		"Window":
			#print("switch to window")
			#hide prev window
			_toggle_buttons(false)
			_toggle_window(true)
			if gif:
				emit_signal("send_gif_file", frames, fps)
			else:
				emit_signal("send_pic_file", pic_file)
			emit_signal("set_link", pic_file)
			return

func _toggle_buttons(visiblity : bool):
	if title_label:
		title_label.visible = visiblity
	if time_label:
		time_label.visible = false
	if body_label:
		body_label.visible = visiblity
	if camera == true:
		cam_scroll.visible = visiblity
		return
	button_container.visible = visiblity

func _toggle_window(visiblity : bool):
	subwindow_title.visible = visiblity
	place_image.visible = visiblity
	looky_back.visible = visiblity


func _on_back_pressed():
	ButtonsSound.clicked()
	_toggle_buttons(true)
	_toggle_window(false)
