extends Node

@export var lamp_R_anim : AnimationPlayer
@export var lamp_L_anim : AnimationPlayer

func _ready():
	lamp_R_anim.play("Default")
	lamp_L_anim.play("Idle")
