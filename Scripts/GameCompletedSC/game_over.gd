extends Node2D

func _on_try_again_button_pressed() -> void:
	Global.load_scene(Global.main_level)


func _on_main_menu_button_pressed() -> void:
	Global.load_scene(Global.main_menu)
