extends AnimatedSprite2D

@export var player : AnimationPlayer
@export var anim_name : String
@export var target : int
@export var need_reversed : bool

func _on_timer_timeout():
	var rand_num = randi_range(1,100)
	#print(rand_num)
	if rand_num % target != 0:
		return
	player.play(anim_name)
	if need_reversed:
		await player.animation_finished
		player.play_backwards(anim_name)
	await player.animation_finished
	player.play("RESET")
