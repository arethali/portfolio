extends AnimatedSprite2D

func _idle_down():
	position.y = position.y + 4

func _idle_up():
	position.y = position.y - 4
