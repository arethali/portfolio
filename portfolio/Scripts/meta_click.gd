extends RichTextLabel

@onready var meta_rect = $ColorRect
@onready var click = $"."

func _on_meta_clicked(meta):
	if FileAccess.file_exists(meta):
		OS.shell_open(ProjectSettings.globalize_path(meta))
		return
	print_debug("File doesn't exist")
	return


func _on_meta_hover_started(meta):
	var text_size_x = click.get_content_width() - 4
	var text_size_y = click.get_content_height() - 8
	click.add_theme_color_override("default_color", Color(1.0,0.949,0.769,1.0))
	await get_tree().process_frame
	meta_rect.size = Vector2(text_size_x, text_size_y)
	meta_rect.show()


func _on_meta_hover_ended(meta):
	click.add_theme_color_override("default_color", Color(0.588,0.604,0.424,1.0))
	await get_tree().process_frame
	meta_rect.hide()
