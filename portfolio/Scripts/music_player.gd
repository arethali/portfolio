extends AudioStreamPlayer

@export var playlist_files : Array[String]
@export var song_title : Array[String]

var playlist : Array
var playing_music : bool 
var current : int
var current_song

signal set_song_title(song : String)
var pause_pos = 0.0

func _ready():
	for i in range(playlist_files.size()):
		playlist.append(load(playlist_files[i]))
	#await get_tree().process_frame
	current = 0
	stream = playlist[current]
	play()
	emit_signal("set_song_title", song_title[current])

func _on_paused():
	pause_pos = get_playback_position()
	print(pause_pos)
	await get_tree().process_frame
	print("stop")
	stop()
	set_stream_paused(true)
	
	return
	
func _on_played():
	stream = playlist[current]
	set_stream_paused(false)
	play()
	await get_tree().process_frame
	seek(pause_pos)
	
	
func _on_mute():
	volume_db = -80

func _on_unmute():
	volume_db = -12


func _on_forward():
	if current >= playlist.size()-1:
		current = 0
	else:
		current += 1
	stream = playlist[current]
	emit_signal("set_song_title", song_title[current])
	await get_tree().process_frame
	play()

func _on_back():
	if current == 0:
		current = playlist.size()-1
	else:
		current -= 1
	stream = playlist[current]
	emit_signal("set_song_title", song_title[current])
	await get_tree().process_frame
	play()


func _on_finished():
	_on_forward()
