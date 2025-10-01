extends AnimatedSprite2D

@export var anim_tree : AnimationTree
@export var anim_player : AnimationPlayer
@export var open_input : CollisionShape2D
@onready var first_open = false
@onready var open = false
@onready var interact_area = $"../../Buttons/Mail Box"

@export var paper : Sprite2D

func _ready():
	if paper:
		paper.hide()
	open_input.hide()

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_toggle_contact()


func _on_exit_pressed():
	_toggle_contact()


func _on_panel_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if interact_area.visible == false:
				_toggle_contact()

func _toggle_contact():
	if first_open == false:
		anim_tree.set("parameters/conditions/first_open", true)
		await get_tree().create_timer(1.4).timeout
		anim_tree.set("parameters/conditions/first_open", false)
		first_open = true
		open = true
		open_input.show()
		if paper:
			paper.show()
		return
	if open == true:
		open = false
		#print("click")
		anim_tree.set("parameters/conditions/Close", true)
		await get_tree().create_timer(.6).timeout
		anim_tree.set("parameters/conditions/Close", false)
		open_input.hide()
		return
	else:
		open = true
		anim_tree.set("parameters/conditions/Open", true)
		await get_tree().create_timer(.6).timeout
		anim_tree.set("parameters/conditions/Open", false)
		open_input.show()
		return
	print_debug("Mailbox error")
