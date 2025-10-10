extends Node

@export var crashed_anim : AnimationPlayer
@export var dp : AnimatedSprite2D
@export var sparks : AnimationPlayer

const X_MULT_MIN : int = 88
const X_MULTI_MAX : int = 1478
const Y_MULT_MIN : int = 4
const Y_MULTI_MAX : int = 240
const MULTIPLIER : int = 4

func _ready():
	crashed_anim.play("Smoke")
	
	#await get_tree().create_timer(8.0).timeout



func _on_timer_timeout():
	var rand_num = randi_range(1,100)
	# Spark anim
	#print(rand_num)
	_handle_spark_anims(rand_num)
	_handle_dead_pixel(rand_num)
	# Dead Pixel


func _handle_spark_anims(dice : int):
	if dice % 10 != 0:
		return
	#print("playing1")
	sparks.play("Spark1")
	await sparks.animation_finished
	if dice % 2 != 0:
		return
	#print("playing2")
	sparks.play("Spark2")
	await sparks.animation_finished
	if dice % 3 != 0:
		return
	#print("playing3")
	sparks.play("Spark3")
	await sparks.animation_finished

func _handle_dead_pixel(dice : int):
	if dice % 20 != 0 or dp.visible == true:
		return
	#dp_anim.play("Explode")
	#await dp_anim.animation_finished
	#dp_anim.play_backwards("Explode")
	dp.visible = true
	dp.frame = 0
	var x_pos : int = randi_range(X_MULT_MIN, X_MULTI_MAX) * MULTIPLIER
	var y_pos : int = randi_range(Y_MULT_MIN, Y_MULTI_MAX) * MULTIPLIER
	dp.position = Vector2(x_pos, y_pos)
