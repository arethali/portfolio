extends AnimatedSprite2D

@export var god_target : int
@export var aes_target : int

@onready var on_off = false

func _ready():
	play("Off")

func _on_laptop_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if on_off == false:
				_choose_screen()
				on_off = !on_off
			else:
				play("Off")
				on_off = !on_off

func  _choose_screen():
	var rand_num = randi_range(1,100)
	if rand_num % god_target == 0:
		play("Godot")
		return
	if rand_num % aes_target == 0:
		play("Aesprite")
		return
	play("Desktop")
