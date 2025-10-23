extends AnimatedSprite2D

@onready var camera_2d = $"../../Camera2D"
@onready var glitch_layer = $"../Glitch Layer"

var shake_intensity = 4
func _ready():
	visible = false
	glitch_layer.visible = false

#func _on_area_2d_input_event(viewport, event, shape_idx):
	#if event is InputEventMouseButton and event.pressed:
		#if event.button_index == MOUSE_BUTTON_LEFT:
			#if frame == 2:
				#visible = false
				##frame = 0
			#frame += 1

func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_panel_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if frame == 2:
				visible = false
			frame += 1
			#print(shake_intensity)
			camera_2d.position.x += shake_intensity
			glitch_layer.visible = true
			await get_tree().process_frame
			camera_2d.position.x -= shake_intensity
			await get_tree().process_frame
			camera_2d.position.x -= shake_intensity
			await get_tree().process_frame
			camera_2d.position.x += shake_intensity
			await get_tree().process_frame
			camera_2d.position.x += shake_intensity
			await get_tree().process_frame
			camera_2d.position.x -= shake_intensity
			await get_tree().process_frame
			camera_2d.position.x -= shake_intensity
			await get_tree().process_frame
			camera_2d.position.x += shake_intensity
			shake_intensity += 4
			glitch_layer.visible = false


func _on_visibility_changed():
	if visible == false:
		await get_tree().create_timer(.2).timeout
		shake_intensity = 4
