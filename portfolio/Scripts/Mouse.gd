extends Node

func _on_mouse_entered():
	print("entered")
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited():
	print("exit")
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
