extends AnimatedSprite2D

@onready var anim_player = $AnimationPlayer
@onready var chair_area = $"../../Buttons/Chair Area"


func _ready():
	anim_player.play("RESET")

func _on_chair_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			anim_player.play("Spin")
			chair_area.visible = false
			await  anim_player.animation_finished
			chair_area.visible = true
