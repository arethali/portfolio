extends Node

#@export var lamp_R_anim : AnimationPlayer
@export var lamp_anim : AnimationPlayer

func _ready():
	#lamp_R_anim.play("Default")
	lamp_anim.play("Idle")
