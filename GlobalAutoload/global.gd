extends Node

var current_scene : String
var main_menu : String = "res://Scenes/MainMenu/main_menu.tscn"
var main_level : String = "res://Scenes/GameLevel/main_level.tscn"
var game_over : String = "res://Scenes/GameCompleted/game_over.tscn"
var you_win : String = "res://Scenes/GameCompleted/you_win.tscn"
var option : String = "res://Scenes/MainMenu/option.tscn"

var scenes : Array[String] = [main_menu, main_level, game_over, you_win, option]

var music_volume : float = 1.0
var sfx_volume : float = 1.0

func _ready() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)

func load_scene(name_scene : String) -> void:
	if name_scene in scenes:
		current_scene = name_scene
		get_tree().change_scene_to_file(current_scene)

func set_music_volume(value: float) -> void:
	music_volume = value
	var volume_db = lerp(-10, 0, value)
	var bus_index = AudioServer.get_bus_index("Music")
	
	if bus_index != -1:
		if volume_db <= -10:
			AudioServer.set_bus_mute(bus_index, true)
		else:
			AudioServer.set_bus_volume_db(bus_index, volume_db)
			AudioServer.set_bus_mute(bus_index, false)

func set_sfx_volume(value: float) -> void:
	sfx_volume = value
	var volume_db = lerp(-20, 0, value)
	var bus_index = AudioServer.get_bus_index("SFX")
	
	if bus_index != -1:
		if volume_db <= -20:
			AudioServer.set_bus_mute(bus_index, true)
		else:
			AudioServer.set_bus_volume_db(bus_index, volume_db)
			AudioServer.set_bus_mute(bus_index, false)
