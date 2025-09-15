extends AnimatedSprite2D

@export var anim_tree : AnimationTree
@export var anim_player : AnimationPlayer

@onready var first_open = false
@onready var open = false

func _ready():
	anim_player.play("Closed")

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if first_open == false:
				anim_tree.set("parameters/conditions/first_open", true)
				await get_tree().create_timer(1.4).timeout
				anim_tree.set("parameters/conditions/first_open", false)
				first_open = true
				open = true
				return
			if open == true:
				open = false
				print("click")
				anim_tree.set("parameters/conditions/Close", true)
				await get_tree().create_timer(.6).timeout
				anim_tree.set("parameters/conditions/Close", false)
				return
			else:
				open = true
				anim_tree.set("parameters/conditions/Open", true)
				await get_tree().create_timer(.6).timeout
				anim_tree.set("parameters/conditions/Open", false)
				return
			print_debug("Mailbox error")
