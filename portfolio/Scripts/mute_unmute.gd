extends TextureButton

var padding : Vector2 = Vector2(40, 40)

var panel_bot_right
var on : bool
@onready var mute = $"."
@onready var unmute = $"../Unmute"

signal paused
signal played

func _on_panel_bot_right(dimes):
	panel_bot_right = dimes

func _ready():
	await  get_tree().process_frame
	mute.position = panel_bot_right - padding
	unmute.position = panel_bot_right - padding
	on = true
	#mute.visible = true
	#unmute.visible = false

func _on_pressed():
	if on == true:
		on = false
		mute.visible = false
		unmute.visible = true
		emit_signal("paused")
		
	else:
		on = true
		mute.visible = true
		unmute.visible = false
		emit_signal("played")
