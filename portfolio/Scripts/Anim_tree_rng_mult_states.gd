extends AnimatedSprite2D

@export var anim_tree : AnimationTree
@export var shadow_anim_tree : AnimationTree = null
@export var conditions_array : Array[String]
@export var target_array : Array[int]

func _on_timer_timeout():
	var rand_num = randi_range(1,100)
	#print(rand_num)
	if target_array.size() != conditions_array.size():
		printerr("Mismatch target and condition array size")
		return
	for i in range(conditions_array.size()):
		_play_condition_anim(anim_tree, conditions_array[i], target_array[i], rand_num)
		if shadow_anim_tree:
			_play_condition_anim(shadow_anim_tree, conditions_array[i], target_array[i], rand_num)
		

func _play_condition_anim(anim_tree: AnimationTree, condition : String, target : int, dice : int):
	if dice % target != 0:
		return
	#print("play" + condition)
	anim_tree.set("parameters/conditions/" + condition, true)
	await get_tree().create_timer(.5).timeout
	anim_tree.set("parameters/conditions/" + condition, false)
