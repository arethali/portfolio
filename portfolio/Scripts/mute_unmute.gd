extends TextureButton

var padding : Vector2 = Vector2(52, 40)

var panel_bot_right
var on : bool
@onready var mute = $"."
@onready var unmute = $"../Unmute"
@onready var buttons = %Buttons

signal paused
signal played

func _on_panel_bot_right(dimes):
	panel_bot_right = dimes

func _ready():
	await  get_tree().process_frame
	mute.position = panel_bot_right - padding
	unmute.position = panel_bot_right - padding
	if buttons.button_format != "Music":
		return 
	if Audio.fxs_on == true:
		#on = true
		mute.visible = true
		unmute.visible = false
		return
	#on = false
	mute.visible = false
	unmute.visible = true

func _on_pressed():
	ButtonsSound.clicked()
	if Audio.fxs_on == true:
		Audio.fxs_on = false
		mute.visible = false
		unmute.visible = true
		emit_signal("paused")
	else:
		Audio.fxs_on = true
		mute.visible = true
		unmute.visible = false
		emit_signal("played")


func _on_play_pressed():
	if Audio.fxs_on == false:
		Audio.fxs_on = true
		mute.visible = true
		unmute.visible = false
		emit_signal("played")
