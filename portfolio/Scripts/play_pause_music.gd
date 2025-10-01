extends TextureButton

@onready var play = $"."
@onready var pause = $"../Pause"

var on : bool

signal paused
signal played

func _ready():
	on = true
	play.visible = false
	pause.visible = true

func _on_pressed():
	if on == true:
		on = false
		play.visible = true
		pause.visible = false
		emit_signal("paused")
		
	else:
		on = true
		play.visible = false
		pause.visible = true
		emit_signal("played")
