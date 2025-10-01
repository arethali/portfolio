extends AudioStreamPlayer2D

@export var playlist_files : Array[String]

var playlist : Array
var playing_music : bool 
var current : int
var current_song

signal autoplay_start
var pause_pos = 0.0

func _ready():
	for i in range(playlist_files.size()):
		playlist.append(load(playlist_files[i]))
	await get_tree().process_frame
	current = 0
	current_song = playlist[current]
	stream = current_song
	play()
	#emit_signal("autoplay_start")

func _on_paused():
	pause_pos = get_playback_position()
	print(pause_pos)
	await get_tree().process_frame
	print("stop")
	stop()
	set_stream_paused(true)
	
	return
	
func _on_played():
	stream = current_song
	set_stream_paused(false)
	play()
	await get_tree().process_frame
	seek(pause_pos)
	
	
#func _on_mute():
	#volume_db = -80
#
#func _on_unmute():
	#volume_db = 0
