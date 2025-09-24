extends AnimatedSprite2D

@export var anim_player : AnimationPlayer
@export var on_anim : String
@export var off_anim : String

@onready var on_off = true

func _ready():
	anim_player.play(on_anim)

func _on_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if on_off == false:
				anim_player.play(on_anim)
				on_off = !on_off
			else:
				anim_player.stop()
				anim_player.play(off_anim)
				on_off = !on_off
