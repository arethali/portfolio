extends AudioStreamPlayer

@onready var fade = $AnimationPlayer

func _ready():
	if Audio.audio_on != true:
		return
	fade.play("Fade_in")



func _on_mute_paused():
	stop()

func _on_mute_played():
	play()


func _on_play_played():
	play()
