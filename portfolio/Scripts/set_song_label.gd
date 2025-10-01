extends RichTextLabel

@export var song_name : String = "jkjhlasdfjaldbj"
@export var scroll_speed = 50.0 # Pixels per second
@export var pause_duration = 1.0 # Duration to pause at each end


var direction = 1
var tween: Tween
@onready var song_box = $".."


func _ready():
	await get_tree().process_frame
	await get_tree().process_frame
	size = song_box.max_size
	position = song_box.position
	#await get_tree().process_frame
	#_set_title()

func animate_marquee(start_pos: Vector2, end_pos: Vector2):
	tween = create_tween().set_loops()
	#await get_tree().process_frame
	# Scroll right to left
	var duration_forward = abs(end_pos.x - start_pos.x) / scroll_speed
	tween.tween_property(%"Song Name", "position", end_pos, duration_forward).set_ease(Tween.EASE_IN_OUT)
	tween.tween_interval(pause_duration)
	
	# Scroll left to right
	var duration_backward = abs(start_pos.x - end_pos.x) / scroll_speed
	tween.tween_property(%"Song Name", "position", start_pos, duration_backward).set_ease(Tween.EASE_IN_OUT)
	tween.tween_interval(pause_duration)

func _set_title():
	text = song_name
	var text_size_x = get_content_width()
	var text_size_y = get_content_height()
	await get_tree().process_frame
	if text_size_x > song_box.max_size.x:
		# Text is too long, start the marquee effect
		horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		var start_pos = Vector2(0 , 0)
		var end_pos = Vector2(song_box.max_size.x - text_size_x, 0)
		position.y = 0
		# Animate the label
		animate_marquee(start_pos, end_pos)
	else:
		# Text fits, center it instead of scrolling
		horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		#position.x = song_box.position.x

func _on_music_player_set_song_title(song):
	if tween:
		tween.kill()
	song_name = song
	await get_tree().process_frame
	await get_tree().process_frame
	_set_title()
