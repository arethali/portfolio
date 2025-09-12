extends Node

#Generates random amount of clouds (from 6-10) at a certain position from (x: (350, 5910), y: (60. 640)) with random transparancy 55-255
# When a cloud reaches x: -144, reset to 5910
# All clound will move right to left at varying speeds
# Each pixel is 4
const X_MULT_MIN : int = 88
const X_MULTI_MAX : int = 1478
const Y_MULT_MIN : int = 4
const Y_MULTI_MAX : int = 105
const MULTIPLIER : int = 4

#Arrays
@export var cloud_arr : Array[Sprite2D]
@export var timer_arr : Array[Timer]

var num_clouds : int

var timer_1_arr : Array[Sprite2D]
var timer_2_arr : Array[Sprite2D]
var timer_3_arr : Array[Sprite2D]
var timer_4_arr : Array[Sprite2D]

func _ready():
	randomize()
	num_clouds = randi_range(6,10)
	
	for i in range(num_clouds):
		var cloud: int = randi_range(0, cloud_arr.size()-1)
		var x_pos : int = randi_range(X_MULT_MIN, X_MULTI_MAX) * MULTIPLIER
		var y_pos : int = randi_range(Y_MULT_MIN, Y_MULTI_MAX) * MULTIPLIER
		var pos : Vector2 = Vector2(x_pos, y_pos)
		cloud_arr[cloud].visible = true
		cloud_arr[cloud].position = pos
		cloud_arr[cloud].modulate.a = randf_range(0.25, 0.85)
		match randi_range(1,4):
			1: 
				timer_1_arr.append(cloud_arr[cloud])
			2:
				timer_2_arr.append(cloud_arr[cloud])
			3:
				timer_3_arr.append(cloud_arr[cloud])
			4:
				timer_4_arr.append(cloud_arr[cloud])
		cloud_arr.remove_at(cloud)



func _move_cloud(cloud : Sprite2D):
	cloud.position.x -= 4
	if cloud.position.x <= -300:
		cloud.position.x = 5192


func _on_timer_1_timeout():
	for cloud in timer_1_arr:
		_move_cloud(cloud)

func _on_timer_2_timeout():
	for cloud in timer_2_arr:
		_move_cloud(cloud)

func _on_timer_3_timeout():
	for cloud in timer_3_arr:
		_move_cloud(cloud)

func _on_timer_4_timeout():
	for cloud in timer_4_arr:
		_move_cloud(cloud)
