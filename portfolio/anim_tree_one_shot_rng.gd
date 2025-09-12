extends AnimatedSprite2D

@export var anim_tree : AnimationTree
@export var shadow_anim_tree : AnimationTree = null
@export var conditions_array : Array[String]
@export var target : int

func _on_timer_timeout():
	var rand_num = randi_range(1,100)
	#print(rand_num)
	_play_anim(anim_tree, conditions_array, target, rand_num)
	if shadow_anim_tree:
		_play_anim(shadow_anim_tree, conditions_array, target, rand_num)


func _play_anim(anim_tree: AnimationTree, conditions : Array[String], target : int, dice : int):
	if dice % target != 0:
		return
	for condition in conditions:
		anim_tree.set("parameters/conditions/" + condition, true)
		await get_tree().create_timer(.5).timeout
		anim_tree.set("parameters/conditions/" + condition, false)
