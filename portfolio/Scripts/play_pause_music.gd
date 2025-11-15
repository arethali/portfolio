extends TextureButton

@onready var play = $"."
@onready var pause = $"../Pause"

#var on : bool

signal paused
signal played

func _ready():
	if Audio.audio_on == true:
		play.visible = false
		pause.visible = true
	else:
		play.visible = true
		pause.visible = false

func _on_pressed():
	ButtonsSound.clicked()
	if Audio.audio_on == true:
		Audio.audio_on = false
		play.visible = true
		pause.visible = false
		emit_signal("paused")
	else:
		Audio.audio_on = true
		play.visible = false
		pause.visible = true
		emit_signal("played")

func _on_dir_pressed():
	ButtonsSound.clicked()
	if Audio.audio_on == false:
		Audio.audio_on = true
		play.visible = false
		pause.visible = true
		emit_signal("played")
