extends AnimatedSprite2D

@export var anim_tree : AnimationTree
@export var anim_player : AnimationPlayer
@export var conditions_array : Array[String]
@export var target_array : Array[int]
@export var timing_array : Array[float]

@onready var state : String
@onready var time : float


func _on_timer_timeout():
	if state == "":
		var rand_num = randi_range(1,100)
		#print(rand_num)
		if target_array.size() != conditions_array.size():
			printerr("Mismatch target and condition array size")
			return
		if conditions_array.size() != timing_array.size():
			printerr("Mismatch timing and condition array size")
			return
		for i in range(conditions_array.size()):
			if rand_num % target_array[i] != 0:
				continue
			state = conditions_array[i]
			#print(state)
			time = timing_array[i]
			break
		if state == "":
			return
		if state == "Sleep":
			_play_sleep_anim(anim_tree)
			return
		_play_condition_anim(anim_tree, state, time)
		

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			print("clicked")
			state = "Yell"
			anim_tree.set("parameters/conditions/default", true)
			await get_tree().create_timer(.1).timeout
			anim_tree.set("parameters/conditions/default", false)
			anim_tree.get("parameters/playback").travel("Default")
			anim_tree.set("parameters/conditions/Yell", true)
			await get_tree().create_timer(.7).timeout
			anim_tree.set("parameters/conditions/Yell", false)
			anim_tree.get("parameters/playback").travel("Default")
			state = ""

func _play_condition_anim(anim_tree: AnimationTree, condition : String, time : float):
#	print("play" + condition)
	anim_tree.set("parameters/conditions/" + condition, true)
	await get_tree().create_timer(time).timeout
	anim_tree.set("parameters/conditions/" + condition, false)
	anim_tree.set("parameters/conditions/default", true)
	await get_tree().create_timer(time).timeout
	anim_tree.set("parameters/conditions/default", false)
	state = ""

func _play_sleep_anim(anim_tree: AnimationTree):
	#print("play sleep")
	anim_tree.set("parameters/conditions/Sleep", true)
	await get_tree().create_timer(.6).timeout
	anim_tree.set("parameters/conditions/Sleep", false)
	var time = randf_range(1.0, 15.0)
	await get_tree().create_timer(time).timeout
	anim_tree.set("parameters/conditions/Awake", true)
	await get_tree().create_timer(.6).timeout
	anim_tree.set("parameters/conditions/Awake", false)
	state = ""
