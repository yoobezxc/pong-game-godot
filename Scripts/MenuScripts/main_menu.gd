extends Node2D

func _on_start_button_pressed() -> void:
	Global.load_scene(Global.main_level)

func _on_option_button_pressed() -> void:
	Global.load_scene(Global.option)

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("EXIT"):
		get_tree().quit()
