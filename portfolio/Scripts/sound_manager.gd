extends AudioStreamPlayer

var hover_sound = preload("res://Audio/Hover Blip.wav")
var click_sound = preload("res://Audio/Click Blip.wav")
@onready var button_sounds = $"."


func clicked():
	if button_sounds.stream != click_sound:
		button_sounds.stream = click_sound
		bus = "Sfx"
		button_sounds.volume_db = -3.0
	if Audio.fxs_on == false:
		return
	button_sounds.play()


func hover():
	if button_sounds.stream != hover_sound:
		bus = "Sfx"
		button_sounds.volume_db = -3.0
		button_sounds.stream = hover_sound
	if Audio.fxs_on == false:
		return
	button_sounds.play()

func add_sound(sound_file : String = ""):
	if Audio.fxs_on == false:
		return
	if sound_file:
		bus = "Sfx"
		var file = load(sound_file)
		await get_tree().create_timer(.1).timeout
		button_sounds.volume_db = -6.0
		button_sounds.stream = file
		button_sounds.play()
		return
